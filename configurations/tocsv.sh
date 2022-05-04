#!/bin/env sh

[ -n "$1" ] && dhall-to-csv \
    --file "$1" \
    --output "$1.csv"
[ -z "$1" ] && echo "Enter a dhall file."
