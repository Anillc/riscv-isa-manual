#!/usr/bin/env bash
set -eu

ORIGIN=$PWD
BUILD=$(mktemp -d)

cleanup() {
  rm -rf $BUILD
}
trap cleanup EXIT

cp -r ../src $BUILD
cp -r ../build $BUILD
cd ../src-zh
for i in $(find . -name '*.adoc.txt'); do
  cp $i $BUILD/src/${i%.txt}
done
cd $BUILD/build
make docker
mv *.pdf $ORIGIN
mv *.html $ORIGIN
