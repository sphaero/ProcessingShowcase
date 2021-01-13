#!/bin/bash
set -e

# de zip file van projectcampus
#unzip $1

for i in `ls *.pde`; 
do
    FILENAME=`echo $i | cut -d "_" -f3-`
    PDENAME=`echo $FILENAME | cut -d "." -f1`
    if [[ $i != $FILENAME ]]; then mv $i $FILENAME; fi
    mkdir -p $PDENAME/data
    mv $FILENAME $PDENAME/
    echo $FILENAME $PDENAME
done

for i in `ls *.zip`; 
do
    unzip $i
done
find . -iname "*DS_store*" | xargs rm -rf
rm -rf __MACOSX

rsync -avi --exclude=*pjc_fix.sh* . ../pde/
