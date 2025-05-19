#!/usr/bin/env python

from xml.sax.saxutils import escape, quoteattr
from argparse import ArgumentParser
from lxml import etree
from sys import argv, stderr, stdout
from textwrap import fill
import re

INDENT = 2
WIDTH = 80
INLINE_TAGS = {"term", "url", "c", "h", "area"}
PRESERVE_WHITESPACE = {"code", "cline", "tests", "idx"}
WRAP = {"p", "caption"}

NSMAP = {
    "http://www.w3.org/XML/1998/namespace": "xml",
    "http://www.w3.org/2001/XInclude": "xi",
}


def indent(level):
    return " " * (INDENT * level)


def open_tag(elem, ns, empty=False):
    s = f"<{namespaced(elem.tag)}"

    for name, value in elem.attrib.items():
        s += f" {attr(name, value)}"

    for prefix, url in elem.nsmap.items():
        if prefix not in ns:
            s += f' xmlns:{prefix}="{url}"'

    if empty:
        s += " /"
    s += ">"
    return s


def attr(name, value):
    return f"{namespaced(name)}={quoteattr(value)}"

def namespaced(name):
    if name.startswith("{"):
        uri, local = name[1:].split("}")
        prefix = NSMAP.get(uri)
        if prefix:
            return f"{prefix}:{local}"
        else:
            print(f"Unknown namespace {uri}", file=stderr)
            return name
    return name

def close_tag(elem):
    return f"</{namespaced(elem.tag)}>"


def is_inline(elem):
    return elem.tag in INLINE_TAGS


def is_empty(elem):
    return (elem.text or "").strip() == "" and not len(elem)


def is_just_short_text(elem):
    return len(elem) == 0 and len((elem.text or "")) < 60


def preserve_whitespace(elem):
    return elem.tag in PRESERVE_WHITESPACE


def empty(x):
    return (x or "").strip() == ""


def singleton_child(elem):
    return len(elem) == 1 and empty(elem.text) and empty(elem[0].tail)


def wrappable(elem):
    return elem.tag in WRAP and not singleton_child(elem)


def render_inline(elem, ns):
    s = open_tag(elem, ns)

    if elem.text and elem.text.strip():
        s += escape(elem.text)

    for child in elem:
        s += render_inline(child, ns | elem.nsmap)
        if child.tail:
            s += child.tail

    s += close_tag(elem)
    return s


def render_block(elem, ns, level=0):
    tag = f"\n{indent(level)}{open_tag(elem, ns)}"

    if is_empty(elem):
        return f"\n{indent(level)}{open_tag(elem, ns, empty=True)}"
    elif is_just_short_text(elem):
        return f"{tag}{escape((elem.text or '').strip())}{close_tag(elem)}"
    else:
        content = ""

        if elem.text and elem.text.strip():
            content += escape(elem.text.lstrip())

        for child in elem:
            content += serialize_element(child, ns | elem.nsmap, level + 1)
            if child.tail and child.tail.strip():
                content += escape(child.tail)

        if wrappable(elem):
            content = re.sub(r"\s+", " ", content)
            filled = fill_with_indent(content.strip(), indent(level + 1))
            return f"{tag}\n{filled}\n{indent(level)}{close_tag(elem)}\n"
        else:
            return f"{tag}\n{indent(level + 1)}{content.strip()}\n{indent(level)}{close_tag(elem)}\n"


def fill_with_indent(text, i):
    return fill(text.strip(), width=WIDTH, initial_indent=i, subsequent_indent=i, break_long_words=False)


def render_with_whitespace(elem, ns, level=0):
    s = f"\n{indent(level)}{open_tag(elem, ns)}"
    if elem.text and len(elem.text) > 0:
        s += escape(elem.text)
    for child in elem:
        s += render_child_with_whitespace(child, ns | elem.nsmap)
        if child.tail and len(child.tail) > 0:
            s += child.tail
    s += close_tag(elem)
    return s


def render_child_with_whitespace(elem, ns, level=0):
    s = open_tag(elem, ns)
    if elem.text and len(elem.text) > 0:
        s += escape(elem.text)
    for child in elem:
        s += render_child_with_whitespace(child, ns | elem.nsmap)
        if child.tail and len(child.tail) > 0:
            s += child.tail
    s += close_tag(elem)
    return s


def serialize_element(elem, ns={}, level=0):
    if not isinstance(elem.tag, str):
        # This seems to do the trick for comments
        return f"{elem}"
    if is_inline(elem):
        return render_inline(elem, ns)
    elif preserve_whitespace(elem):
        return render_with_whitespace(elem, ns, level)
    else:
        return render_block(elem, ns, level)


def document_elements(root):
    top_level = []

    e = root
    while e is not None:
        top_level.append(e)
        e = e.getprevious()

    top_level.reverse()

    e = root.getnext()
    while e is not None:
        top_level.append(e)
        e = e.getnext()

    return top_level


def reformat(filename, inplace):
    root = etree.parse(filename).getroot()

    f = open(filename, mode="w") if inplace else stdout

    print('<?xml version="1.0" encoding="UTF-8"?>', file=f)
    for e in document_elements(root):
        print(serialize_element(e), file=f)


if __name__ == "__main__":
    parser = ArgumentParser(
        prog="format-ptx",
        description="Reformat PreText XML to be semi-human-digestible.",
    )

    parser.add_argument("filename", help="File to reformat")
    parser.add_argument(
        "-i", "--inplace", action="store_true", help="Reformat in place"
    )

    args = parser.parse_args()

    reformat(args.filename, args.inplace)
