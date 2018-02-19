#!/bin/bash
VBoxManage startvm Web --type=headless 
ssh -l user -p 16003 localhost
