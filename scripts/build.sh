#!/bin/bash

cd "$(dirname "$0")"

# Delete existing builds
rm -rf ./bin

# Generate bin/lessc
../node_modules/.bin/pkg ../node_modules/.bin/lessc -t node14-linux -o ../bin/lessc
echo Generated bin/lessc

# Get the version number
VERSION=`../bin/lessc --version | sed -rn "s/([^0-9]*)([0-9\.]+)([^0-9]*.*)/\2/ p"`

echo Version $VERSION
