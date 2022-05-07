#!/bin/env sh

# Add dhall and dhall-to-csv to your path before running the script.

# Creates a csv file for every directory with dhall files in a database.
# The extension of the csv file can be changed if needed.

# ---
# Databases can be added to the databases variable.
# Every database needs to have three things:
#   - A package.dhall file
#   - A function in this file with the name: do_database
#   - A case in the main function of this file that runs the do_database function

# The do_database function has access to three variables:
#   - dir    : The directory of the csv file that will be created
#   - temp   : The temporary dhall file used to store the contents of all dhall files in dir
#   - output : The csv file

# The temporary dhall file is created inside the database directory.
# Example: ./database/en.dhall is created for ./database/en/
# ---

databases='./dialogue'
extension='fcsv'


# Get all dhall files in a directory.
collect_dhall() {
    my_result=''
    my_file=''
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

# Create csv files for the dialogue database.
do_dialogue() {
    # Create a temp dhall file that contains every dhall file.
    echo 'let lib = ./package.dhall' > $temp
    echo 'let Line = lib.Line' >> $temp
    echo 'let newLineSet = lib.newLineSet' >> $temp
    echo 'in' >> $temp

    has_files=''
    for file in $(collect_dhall $dir); do
        has_files='1'
        line_path="${file#$dir/}"
        line_path="${line_path%.dhall}"
        echo "(newLineSet \"$line_path\"" >> $temp
        dhall --file $file >> $temp
        echo ')#' >> $temp
        echo "Normalized: $file"
    done
    echo '([ ] : List Line)' >> $temp

    # Transpile the temp dhall file to a csv file.
    if [ -n "$has_files" ]; then
        dhall-to-csv --file $temp --output $output
        printf "Transpiled: $temp\n\n"
    fi
    rm $temp
}

# Create csv files for all databases.
main() {
    echo
    for database in $databases; do
        if [ -d "$database" ]; then
            for part in $(ls $database); do
                dir="$database/$part"
                temp="$database/$part.dhall"
                output="$dir/$part.$extension"
                if [ -d "$dir" ]; then
                    case "$database" in
                        './dialogue' ) do_dialogue;;
                        * ) printf "$database: Database has no case.\n\n";;
                    esac
                fi
            done
        fi
    done
    printf "Done!\n\n"
}

main
