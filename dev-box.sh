#!/bin/bash

VM="Dev-Box-32"
PORT=11337
IP=localhost
LOGIN=user

output="$(``VBoxManage list runningvms | grep $VM``)"

if [[ -z $output ]]; then
    VBoxManage startvm $VM --type=headless
    ssh -l $LOGIN -p $PORT $IP
elif [[ $# == 1 ]]; then

    if [[ $1 == 'ssh' ]]; then
        echo "ssh -l $LOGIN -p $PORT $IP"
        ssh -l $LOGIN -p $PORT $IP
    elif [[ $1 == 'off' ]]; then
        echo "Shutting down Dev Box"
        VBoxManage controlvm $VM poweroff
    else
        printf "\033[5;31mWhat? ssh or off\033[0m\n"
    fi

else
    echo "$VM is already up! Call ssh or off"
fi
