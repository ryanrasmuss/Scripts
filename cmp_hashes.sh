#!/bin/bash

if [ $# != 3 ]
then
    echo " \$1 First File Location"
    echo " \$2 Second File Location"
    echo " \$3 Algorithm (md5, sha256, etc)"
else

    file1_hash=`openssl dgst -$3 $1 | cut -d " " -f 2`
    file2_hash=`openssl dgst -$3 $2 | cut -d " " -f 2`

    echo -e "\033[32m$1\033[0m hash: \033[32m$file1_hash\033[0m"
    echo -e "\033[34m$2\033 hash: \033[34m$file2_hash\033[0m"

    if [ $file1_hash == $file2_hash ]
    then
        echo -e "\033[5;39mMatches!\033[0m 👌"
    else
        echo -e "\033[5;31mNot a match!\033[0m"
    fi
fi
