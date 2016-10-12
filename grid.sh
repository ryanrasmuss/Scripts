#!/bin/bash
# put a -h
# put arguments to allow 2-pane view and 3-pane view
if [ $1 == '-h' ]; then
	echo "Usage: ./grid.sh file0 file1 file3 file4"
elif [ $# == 1 ]; then
	vim $1
elif [ $# == 2 ]; then
	vim -o $1 $2
elif [ $# == 3 ]; then
	vim $1 -c 'split '$2'' -c 'vsplit '$3''
elif [ $# == 4 ]; then
	vim $1 -c 'split '$2'' -c 'vsplit '$3'' -c 'wincmd j' -c 'vsplit '$4''
else
	echo "Usage: ./grid.sh file0 file1 file3 file4"
fi
