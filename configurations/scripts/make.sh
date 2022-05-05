#!/bin/env sh

# Create a csv file for every database in the databases directory.

# Run the script in the configurations directory
# and add dhall and dhall-to-csv to your path.

databases='./databases'
lib='Database'

echo
if [ ! -d $databases ]; then
    printf "$databases does not exist.\n\n"
    exit 1
fi

for database in $(ls $databases); do
    if [ $database != $lib ]; then
        dir="$databases/$database"
        temp="$dir/$database.dhall"
        output="$dir/$database.csv"

        # Create a temp dhall file with all the line sets.
        echo '' > $temp
        for file in $dir/*; do
            if [ $file != $temp ] && [ $file != $output ]; then
                dhall --file $file >> $temp
                echo '#' >> $temp
                echo "Normalized: $file"
            fi
        done
        echo '([ ] : List ../Database/Line.dhall)' >> $temp
        
        # Transpile the temp dhall file to a csv file.
        dhall-to-csv --file $temp --output $output
        printf "Transpiled: $temp\n\n"
        rm $temp
    fi
done
printf "Done!\n\n"