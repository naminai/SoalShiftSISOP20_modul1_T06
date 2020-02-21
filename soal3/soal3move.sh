#!/bin/bash
dirinfo=`pwd`
testering=`ls $dirinfo | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

if [[ `ls $dirinfo | grep "kenangan"` != "kenangan" ]]
then
  mkdir $dirinfo/kenangan
fi

if [[ `ls $dirinfo | grep "duplicate"` != "duplicate" ]]
then
  mkdir $dirinfo/duplicate
fi

arr=""
for ((i=1; i<=$testering; i++))
do
  loc="`cat $dirinfo/wget.log | grep "Location:" | head -$i | tail -1 | cut -d " " -f 2`"
  isDuplicate=`echo -e $arr | awk -v loc=$loc 'BEGIN {isDuplicate=0} {if (loc==$0) isDuplicate=1} END {printf "%d", isDuplicate}'`
  if [[ $isDuplicate == 1 ]]
  then
    mv $dirinfo/pdkt_kusuma_$i $dirinfo/duplicate/duplicate_$i
  else
    arr="$arr$loc\n"
    mv $dirinfo/pdkt_kusuma_$i $dirinfo/kenangan/kenangan_$i
  fi
done

cat $dirinfo/wget.log >> $dirinfo/wget.log.bak && rm $dirinfo/wget.log # && rm location.log
#if [[ $testering =~ [0..9] ]]
#then
#  testering=0
#fi

#x=`expr $testering + 1`
#y=`expr $testering + 28`

