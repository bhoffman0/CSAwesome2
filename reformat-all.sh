#!/usr/bin/env bash

set -euo pipefail

fd \.ptx pretext | while read -r f; do
    ./format-ptx.py -i "$f"
done
