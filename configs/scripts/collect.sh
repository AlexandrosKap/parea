#!/bin/env sh

# Obtain all files of a specific type in a directory.
# Includes files in subdirectories.

main() {
    ext="$1"
    dir="$2"
    result=''
    if [ -d "$dir" ]; then
        for file in $dir/*; do
            if [ -d "$file" ]; then
                result="$result $(main "$ext" "$file")"
            else
                [ "${file%.$ext}" != "$file" ] && result="$result $file"
            fi
        done
    fi
    echo "$result"
}

main "$1" "$2"
