#!/usr/bin/env python

from argparse import ArgumentParser
from lxml import etree
from sys import argv, stderr, stdout
from textwrap import fill
import re

INDENT = 2
WIDTH = 80
INLINE_TAGS = {"term", "url", "c", "h", "area"}
PRESERVE_WHITESPACE = { "code", "cline", "tests", "idx" }
WRAP = { "p", "caption" }

NSMAP = {
    "http://www.w3.org/XML/1998/namespace": "xml",
}

def indent(level):
    return " " * (INDENT * level)

def open_tag(elem):
    s = f"<{elem.tag}"
    for name, value in elem.attrib.items():
        s += f" {attr(name, value)}"
    s += ">"
    return s

def attr(name, value):
    if name.startswith("{"):
        uri, local = name[1:].split("}")
        prefix = NSMAP.get(uri)
        if prefix:
            name = f"{prefix}:{local}"
    return f'{name}="{value}"'

def close_tag(elem):
    return f"</{elem.tag}>";

def inline(elem):
    return f"{open_tag(elem)}{elem.text}{close_tag(elem)}";

def is_inline(elem):
    return elem.tag in INLINE_TAGS

def is_empty(elem):
    return (elem.text or "").strip() == "" and not len(elem)

def is_just_short_text(elem):
    return len(elem) == 0 and len((elem.text or "")) < 60

def preserve_whitespace(elem):
    return elem.tag in PRESERVE_WHITESPACE

def wrappable(elem):
    return elem.tag in WRAP and (elem.text or (len(elem) > 0 and elem[0].tail))

def render_inline(elem):
    s = open_tag(elem)

    if elem.text and elem.text.strip():
        s += elem.text

    for child in elem:
        s += render_inline(child)
        if child.tail:
            s += child.tail

    s += close_tag(elem)
    return s

def render_block(elem, level=0):
    tag = f"\n{indent(level)}{open_tag(elem)}"

    if is_empty(elem):
        return f"{tag}{close_tag(elem)}"
    elif is_just_short_text(elem):
        return f"{tag}{(elem.text or "").strip()}{close_tag(elem)}"
    else:
        content = ""

        if elem.text and elem.text.strip():
            content += elem.text.strip()

        for child in elem:
            content += serialize_element(child, level + 1)
            if child.tail and child.tail.strip():
                #content += " " + child.tail.strip() + " "
                content += child.tail

        if wrappable(elem):
            content = re.sub(r"\s+", " ", content)
            i = indent(level + 1)
            filled = fill(content.strip(), width=WIDTH, initial_indent=i, subsequent_indent=i)
            return f"{tag}\n{filled}\n{indent(level)}{close_tag(elem)}\n"
        else:
            return f"{tag}\n{indent(level + 1)}{content.strip()}\n{indent(level)}{close_tag(elem)}\n"

def render_with_whitespace(elem, level=0):
    s = f"\n{indent(level)}{open_tag(elem)}"
    if elem.text and len(elem.text) > 0:
        s += elem.text
    for child in elem:
        s += render_child_with_whitespace(child)
        if child.tail and len(child.tail) > 0:
            s += child.tail
    s += close_tag(elem)
    return s

def render_child_with_whitespace(elem, level=0):
    s = open_tag(elem)
    if elem.text and len(elem.text) > 0:
        s += elem.text
    for child in elem:
        s += render_child_with_whitespace(child)
        if child.tail and len(child.tail) > 0:
            s += child.tail
    s += close_tag(elem)
    return s


def serialize_element(elem, level=0):
    if not isinstance(elem.tag, str):
        # This seems to do the trick for comments
        return f"{elem}"
    if is_inline(elem):
        return render_inline(elem)
    elif preserve_whitespace(elem,):
        return render_with_whitespace(elem, level)
    else:
        return render_block(elem, level)

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

    print('<?xml version="1.0"?>', file=f)
    for e in document_elements(root):
        print(serialize_element(e), file=f)

if __name__ == '__main__':

    parser = ArgumentParser(
        prog='format-ptx',
        description='Reformat PreText XML to be semi-human-digestible.')

    parser.add_argument('filename', help='File to reformat')
    parser.add_argument('-i', '--inplace', action='store_true', help='Reformat in place')

    args = parser.parse_args()

    reformat(args.filename, args.inplace)
