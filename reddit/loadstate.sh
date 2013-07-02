#!/bin/sh
# Save a database state in the states directory

if [ -z "$1" ]
then

    echo "\nERROR: Please pass the name of the state to load.\n"
    return

fi

cd $(dirname $0)

./savestate.sh tmp

sudo -u postgres psql -d reddit -f states/$1.sql 1> /dev/null

if [ $? != 0 ]
then

    echo "\nERROR: There was an error loading the requested state.  The most recent good state has been saved as 'tmp'."

else

    rm states/tmp.sql

fi