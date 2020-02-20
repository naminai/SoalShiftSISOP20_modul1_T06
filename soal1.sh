#!/bin/bash
#A
echo "Region dengan profit paling sedikit adalah: "
region=`awk -F, 'NR>1{a[$13]+=$21}END{for (i in a)printf "%s\t%d\n", i, a[i] | "sort -nk2";}' Sample-Superstore.csv`
regional=`echo "$region" | awk '{NR==1}{print $1;exit}'` 
echo -e "$regional\n"
#B
echo "State dari Region Central dengan profit paling sedikit adalah: "
state=`awk -F, -v a="$regional" 'NR>1 {if(match($13, a))arr[$11]+=$NF}END{for (i in arr) printf "%s\t%d\n", i, arr[i]}' Sample-Superstore.csv  | sort -nk2 | awk -F "," 'FNR <3 {printf "%s\n",$1}'` 
stational=`echo "$state" | awk '{NR==1}{print $1}'`
#echo "$stational"
stationbalapan=`echo $stational | awk '{NR==1}{print $1}'`
echo $stationbalapan
stationpurabaya=`echo $stational | awk '{NR==1}{print $2}'`
echo -e "$stationpurabaya\n"
#C
echo "Produk dari State Texas dengan profit paling sedikit adalah: "
productkawe=`awk -F, -v b="$stationbalapan" 'NR>1 {if(match($11, b))arr[$17]+=$21}END{for (i in arr) printf "%f\t%s\n", arr[i], i}' Sample-Superstore.csv | sort -n | awk -F, 'FNR <11 {printf "%s\n", $1}' | cut -f2-  `
echo -e "$productkawe\n" 
echo "Produk dari State Illinois dengan profit paling sedikit adalah: "
productgagal=`awk -F, -v c="$stationpurabaya" 'NR>1 {if(match($11, c))arr[$17]+=$21}END{for (i in arr) printf "%f\t%s\n", arr[i], i}' Sample-Superstore.csv | sort -n | awk -F, 'FNR <11 {printf "%s\n", $1}' | cut -f2- ` 
echo -e "$productgagal\n"



