#!/usr/bin/env python

# Lifted from Runestone2PreTeXt repo since we want to run it on earlier xml.

import re
import os
from collections import defaultdict
from sys import argv;

seen = defaultdict(int)

counter = 0

directory, ext = argv[1:]

def rewrite_id_old(m):
    text = re.sub(r'\s+', "-", m.group(1))
    text = re.sub(r'^_+', r'', text)
    text = re.sub(r'^(\d)', r'_\1', text)
    text = uniquify(text or "empty")
    return f'xml:id="{text}"'

def rewrite_id(m):
    global counter
    counter = counter + 1
    return f'xml:id="UNIQUE-ID-{counter:06d}"'

def uniquify(text):
    if not text:
        text = "BLANK-ID"
    c = seen[text]
    seen[text] += 1
    return text if c == 0 else f"{text}-{c}"

def rewrite_and_uniquify(m):
    return uniquify(rewrite_id_old(m))


for root, dirs, files in os.walk(directory):
    for file in files:
        if "toctree" in file:
            continue
        if file.endswith(ext):
            with open(os.path.join(root, file)) as f:
                text = f.read()
            text = re.sub(r'xml:id="(.*?)"', rewrite_and_uniquify, text)

            with open(os.path.join(root, file), "w") as f:
                f.write(text)
