#!/bin/bash

# Author: Ryan Rasmuss

# download_csif.sh script downloads files from the UC DAVIS CSIF machines to your
#	local machine
# USAGE: ./download_csif.sh [pc#] [pathToFileOnCSIF] [localDestination]
# USAGE: ./download_csif.sh -r [pc#] [pathToDirectoryOnCSIF] [localDestination]
# When selecting destination use . for home directory (if you wish)

user_name=''

if [ "$1" == '-h' ]; then
	echo "Usage: ./download_csif.sh [pc#] [pathToFile] [pathOnHost]"
	echo "or ./download_csif.sh -r [pc#] [pathToDirectory] [pathOnHost]"
elif [ "$1" == '-r' ]; then
	scp $1 $user_name@pc$2.cs.ucdavis.edu:$3 $4
else
	scp $user_name@pc$1.cs.ucdavis.edu:$2 $3
fi
