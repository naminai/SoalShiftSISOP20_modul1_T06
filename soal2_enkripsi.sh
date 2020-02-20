#!/bin/bash

args=$*
arg=`basename $args .txt`  
sword=`stat $args`
ketupat=`echo -e "$sword"` 
amboi=`echo $ketupat | awk 'BEGIN{IFS=";"}{print $15}'` 
hebat=$(sudo debugfs -R 'stat <'$amboi'>' /dev/sda1 | awk '{if($1~/crtime/)print $7}')
donee=`echo $hebat | awk -F: '{print $1}'`
coba1=`echo "$arg" | caesar $donee` 
mv $args $coba1.txt
