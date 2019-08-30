#!/bin/bash

# WILL CREATE (and remove) local_logs.tmp and remote_logs.tmp locally
# CHANGE DIRECTORY PATH @ LINES 14 & 29
# CHANGE VARIABLES BELOW @ LINES 7 & 9

remote_user=logger
remote_ip=169.254.1.1

log_dir=$FWDIR/log/

ls $FWDIR/log/*.log | cut -d'/' -f6 > local_logs.tmp

ssh -q -p 22222 $remote_user@$remote_ip "ls Logs/" > remote_logs.tmp

#echo "local logs"
#cat local_logs.tmp
#echo "remote logs"
#cat remote_logs.tmp

copy_me=$(diff local_logs.tmp remote_logs.tmp | grep '<' | cut -b 3-)

#echo "files to transfer.."
#echo $copy_me

for f in $copy_me
do
    #echo $f
    scp -q -v -P 22222 $log_dir$f $remote_user@$remote_ip:Logs/.
done

rm -v local_logs.tmp
rm -v remote_logs.tmp
