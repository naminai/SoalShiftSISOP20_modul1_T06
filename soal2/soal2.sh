#!/bin/bash

Nama=$*
Randomizer=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
echo $Randomizer
Kode=`printf '%s\n' "${Nama//[[:digit:]]/}"`
echo $Randomizer >> $Kode.txt 
