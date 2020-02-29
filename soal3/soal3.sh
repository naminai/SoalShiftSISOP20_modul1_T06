#!/bin/bash
display=`pwd`
namber=`ls $display | grep "pdkt_kusuma" | cut -d "_" -f 3 |sort -n | tail -1`
if [[ $namber =~ [0..9] ]]
then
  namber=0
fi
x=`expr $namber + 1` 
y=`expr $namber + 28`
for ((c=x; c<=y; c++ ))
do
     wget -a $display/wget.log -O "$display/pdkt_kusuma_$c" https://loremflickr.com/320/240/  
done
grep "Location" wget.log >> location.log
