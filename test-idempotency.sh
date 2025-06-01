#!/usr/bin/env bash

set -euo pipefail

./format-ptx.py "$1" > first.xml
./format-ptx.py -q first.xml > second.xml
sum1=$(shasum first.xml | cut -c -40)
sum2=$(shasum second.xml | cut -c -40)

if [ "$sum1" != "$sum2" ]; then
    echo "$1"
    exit 1
else
    exit 0
fi
