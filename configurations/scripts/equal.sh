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
        echo add thigs later...
    fi
done
printf "Done!\n\n"
