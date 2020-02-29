#!/bin/bash
dirinfo=`pwd`
testering=`ls $dirinfo | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

mkdir $dirinfo/kenangan
mkdir $dirinfo/duplicate

x=0
y=0
arr=""
for ((i=1; i<=$testering; i++))
do
  lokasi="`cat $dirinfo/wget.log | grep "Location:" | head -$i | tail -1 | cut -d " " -f 2`"
  dupes=`echo -e $arr | awk -v lokasi=$lokasi 'BEGIN {dupes=0} {if (lokasi==$0) dupes=1} END {printf "%d", dupes}'`
  if [[ $dupes == 1 ]]
  then
  x=`expr $x + 1`
      mv $dirinfo/pdkt_kusuma_$i $dirinfo/duplicate/duplicate_$x
  else
  arr="$arr$lokasi\n"
  y=`expr $y + 1`
    mv $dirinfo/pdkt_kusuma_$i $dirinfo/kenangan/kenangan_$y
  fi
done

cat $dirinfo/wget.log >> $dirinfo/wget.log.bak && rm $dirinfo/wget.log 
