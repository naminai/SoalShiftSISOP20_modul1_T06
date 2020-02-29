#!/bin/bash

Nama=$*
#!/bin/bash

Nama=$*
Randomizer=`pwgen -c -n 28 1`
echo $Randomizer
Kode=`printf '%s\n' "${Nama//[[:digit:]]/}"`
echo $Randomizer >> $Kode.txt 

echo $Randomizer
Kode=`printf '%s\n' "${Nama//[[:digit:]]/}"`
echo $Randomizer >> $Kode.txt 
