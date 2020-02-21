#!/bin/bash
display=`pwd`
testering=`ls | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

x=`mkdir $display/kenangan`
y=`mkdir $display/duplicate`

if [[ `ls $display | grep "kenangan"` != "kenangan" ]]
then
  $x
fi

if [[ `ls $display | grep "duplicate"` != "duplicate" ]]
then
  $y
fi

arr=""
for ((i=1; i<=$testering; i++))
do
  lokasi="`cat $display/wget.log | grep "Location" | head -$i | tail -1 | cut -d " " -f 2`"
  dupes=`echo -e $arr | awk -v lokasi=$lokasi 'BEGIN {dupes=0} {if (lokasi==$0) dupes=1} END {printf "%d", dupes}'`
  if [[ $dupes == 1 ]]
  then
    mv $display/pdkt_kusuma_$i $display/duplicate/duplicate_$i
  else
    arr="$arr$lokasi\n"
    mv $display/pdkt_kusuma_$i $display/kenangan/kenangan_$i
  fi
done

cat $dirinfo/wget.log >> $dirinfo/wget.log.bak && rm $dirinfo/wget.log # && rm location.log
