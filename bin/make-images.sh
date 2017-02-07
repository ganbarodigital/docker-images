#!/bin/bash

function die() {
	echo $*
	exit 1
}

if [[ -z "$1" ]] ; then
    die "usage: $0 <make target(s)>"
fi

IMAGES_DIR=`dirname $0`/..
IMAGES_FILE=`dirname $0`/images-list.txt
IMAGES=`cat $IMAGES_FILE`

for x in $IMAGES ; do
	( cd $IMAGES_DIR/$x && make "$@" ) || die "Unable to build $x"
done