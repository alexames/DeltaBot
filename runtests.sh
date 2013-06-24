#!/bin/sh
# Run the deltabot test suite.

cd $(dirname $0)

python -m unittest discover deltabot/tests '*_test.py'