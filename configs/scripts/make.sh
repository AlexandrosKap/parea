#!/bin/env sh

# Add dhall and dhall-to-csv to your path before running the script.

# Creates a csv file for every directory
# in a database that has dhall files.
# The extension of the csv file can also be changed if needed.

# Databases can be added to the databases variable.
# Every database can have a package.dhall file.

databases='./dialogueLines'
lib="package.dhall"
extension="fcsv"


# Get all dhall files in a directory.
collect_dhall() {
    my_result=''
    if [ -d "$1" ]; then
        for my_file in $1/*; do
            if [ -d "$my_file" ]; then
                my_result="$my_result $(collect_dhall "$my_file")"
            else
                [ ${my_file%.dhall} != "$my_file" ] && my_result="$my_result $my_file"
            fi
        done
    fi
    echo "$my_result"
}

# Create csv files.
echo
for database in $databases; do
    for part in $(ls $database); do
        if [ $part != $lib ]; then
            dir="$database/$part"
            temp="$dir/$part.dhall"
            output="$dir/$part.$extension"

            # Create a temp dhall file that contains every dhall file.
            echo '(../package.dhall).newLineSet (' > $temp
            has_files=''
            for file in $(collect_dhall "$dir"); do
                if [ "$file" != "$temp" ]; then
                    has_files='1'
                    dhall --file $file >> $temp
                    echo '#' >> $temp
                    echo "Normalized: $file"
                fi
            done
            echo '([ ] : List (../package.dhall).Line))' >> $temp
            
            # Transpile the temp dhall file to a csv file.
            if [ -n "$has_files" ]; then
                dhall-to-csv --file $temp --output $output
                printf "Transpiled: $temp\n\n"
            fi
            rm $temp
        fi
    done
done
printf "Done!\n\n"
