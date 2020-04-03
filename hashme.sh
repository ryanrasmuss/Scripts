#!/bin/bash

# mac tool

if [ $# == 2 ];
then
    hashed=`openssl dgst -$2 $1 | cut -d " " -f 2`
    echo -e "$1 $2 hash: $hashed"
else
    echo "  \$1 file"
    echo "  \$2 algo"
fi
