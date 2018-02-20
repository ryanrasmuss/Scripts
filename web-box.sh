#!/bin/bash

output="$(``VBoxManage list runningvms | grep "Dev-Box-32"``)"
if [[ -z $output ]]; then
    VBoxManage startvm Web --type=headless 
    ssh -l user -p 16003 localhost
else
    echo "Web is already up"
fi
