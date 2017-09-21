#!/bin/bash

PCS="PC1 PC2 PC3 Router1 Router2 Router3"

for i in $PCS; do
    VBoxManage controlvm $i poweroff
done
