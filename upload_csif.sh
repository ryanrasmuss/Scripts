#!/bin/bash

# Author: Ryan Rasmuss

# upload_csif.sh script uploads files from host machine to UC Davis CSIF machines

# USAGE: ./upload_csif.sh [fileToUpload] [pc#] [destination]
# USAGE: ./upload_csif.sh -r [directoryToUpload] [pc#] [destination]
# When selecting destination use . for home directory (if you wish)

user_name=''

if [ $1 == '-h' ]; then	
	echo "Usage: ./upload_csif.sh file pc# where(.)"
	echo "or ./upload_csif.sh -r directory pc# where(.)"
elif [ $1 == '-r' ]; then
	scp $1 $2 $user_name@pc$3.cs.ucdavis.edu:$4
else
	scp $1 $user_name@pc$2.cs.ucdavis.edu:$3
fi
