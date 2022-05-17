#!/bin/env sh

# Create a csv file for every directory in the dialogue directory.
# The dialogue directory must have a package.dhall file.
# The extension of the csv file can be changed if needed.
# Add dhall and dhall-to-csv to your path before running this script.

collect='./scripts/collect.sh'
dialogue='./dialogue'
ext='fcsv'

main() {
    echo
    for dir in $dialogue/*; do
        if [ -d "$dir" ]; then
            temp="$dir.temp.dhall"
            output="$dir.$ext"

            # Create the temp file that contains every dhall file.
            echo 'let pack = ./package.dhall' > $temp
            echo 'let Line = pack.Line' >> $temp
            echo 'let newLineSet = pack.newLineSet' >> $temp
            echo 'in' >> $temp

            has_files=''
            for file in $(sh $collect dhall $dir); do
                has_files='1'
                line_path="${file#$dir/}"
                line_path="${line_path%.dhall}"
                echo "(newLineSet \"$line_path\"" >> $temp
                dhall --file $file >> $temp
                echo ')#' >> $temp
                echo "Normalized: $file"
            done
            echo '([ ] : List Line)' >> $temp

            # Transpile the temp file to a csv file.
            if [ -n "$has_files" ]; then
                dhall-to-csv --file $temp --output $output
                printf "Created: $output\n\n"
            fi
            rm $temp
        fi
    done
}

main
