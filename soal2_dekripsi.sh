#!/bin/bash

args=$*
arg=`basename $args .txt`  
sword=`stat $args`
ketupat=`echo -e "$sword"` 
yasudah=`echo $ketupat | awk 'BEGIN{IFS=";"}{print $15}'` 
hebat=$(sudo debugfs -R 'stat <'$yasudah'>' /dev/sda1 | awk '{if($1~/crtime/)print $7}')
donee=`echo $hebat | awk -F: '{print $1}'`
sepatu=$((10#$donee))
senapan=$((10#26-$sepatu))
#echo $senapan
coba1=`echo "$arg" | caesar $senapan`  
mv $args $coba1.txt

