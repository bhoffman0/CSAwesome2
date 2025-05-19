#!/usr/bin/env bash

set -euo pipefail

fd \.ptx pretext | while read -r f; do
    ./test-fixed-point.sh "$f"
done
