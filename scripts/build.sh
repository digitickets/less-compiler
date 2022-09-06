#!/bin/bash

# Delete existing builds
rm -rf ./bin

# Generate bin/lessc
./node_modules/.bin/pkg node_modules/.bin/lessc -t node14-linux -o bin/lessc
echo Generated bin/lessc

# Get the version number
VERSION=`./bin/lessc --version | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p'`

# Create a versioned file

cp bin/lessc bin/lessc-$VERSION
echo Generated bin/lessc-$VERSION
