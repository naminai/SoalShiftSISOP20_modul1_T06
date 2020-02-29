#!/bin/bash

Nama=$*
Randomizer=`pwgen -c -n 28 1`
Kode=`printf '%s\n' "${Nama//[[:digit:]]/}"`
echo $Randomizer >> $Kode.txt
