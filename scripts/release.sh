#!/bin/bash

cd "$(dirname "$0")"

# Build
./build.sh

# Get the version number
VERSION=`../bin/lessc --version | sed -rn "s/([^0-9]*)([0-9\.]+)([^0-9]*.*)/\2/ p"`

github-release upload \
  --owner digitickets \
  --repo less-compiler-test \
  --tag $VERSION \
  --release-name $VERSION \
  --body "lessc version $VERSION" \
  ../bin/lessc
