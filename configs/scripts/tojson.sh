#!/bin/env sh

[ -n "$1" ] && dhall-to-json --file "$1" --output "$1.json" --compact
