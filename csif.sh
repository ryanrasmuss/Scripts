#!/bin/bash

# Easy login for UC DAVIS CSIF machines
# Just add your UC Davis login to user_name
# Usage: ./csif.sh [pc#]

user_name='jsmith'

if [ $1 == '-h' ]; then
	echo "Usage: ./csif [pc#]"
else
	ssh $user_name@pc$1.cs.ucdavis.edu
fi
