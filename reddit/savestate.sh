#!/bin/sh
# Save a database state in the states directory

if [ -z "$1" ]
then

    echo "\nERROR: Please pass the name of the state to save.\n"
    return

fi

cd $(dirname $0)

sudo -u postgres pg_dump reddit --clean > states/$1.sql