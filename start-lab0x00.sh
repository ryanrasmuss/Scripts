#!/bin/bash

PCS="PC1 PC2 PC3 Router1 Router2 Router3"

for i in $PCS; do
    VBoxManage startvm $i --type=headless
done

echo "Ports: 15001, 15002, 15003, 15101, 15102, 15103"
