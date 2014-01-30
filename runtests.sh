#!/bin/bash

cd $(dirname $0)

if [ ! -e config/config.json ]
  then
    cp config/config.json.example config/config.json
fi

python deltabot/test.py
