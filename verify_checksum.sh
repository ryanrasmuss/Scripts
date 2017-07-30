#!/bin/bash

# Verify checksums

if [ $# == 3 ]; 
then
    # $1 is the known sha1 value
    # $2 is the iso in question
    # $3 is key type?
    testing=`openssl dgst -$3 $2 | cut -d " " -f 2`
    echo "$1 to"
    echo "$testing"
    if [ $1 == $testing ]
    then 
        echo "matches"
	else
		echo "no match"
    fi
else
    echo " \$1 known sha1 value"
    echo " \$2 *.iso in question"
    echo " \$3 key type (md#/sha#/etc..)"
fi
