#!/bin/bash

if [[ -z $2 ]] ; then
    echo "*** usage: $0 <from-version> <to-version>"
    exit 1
fi

DOCKERFILES=$(find . -name Dockerfile)
for x in $DOCKERFILES ; do
    sed -e "s/^FROM \(.*\)-$1$/FROM \1-$2/" -i $x
done