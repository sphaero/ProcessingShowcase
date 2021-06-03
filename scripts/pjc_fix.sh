#!/bin/bash
set -e

get_abs_path() {
  echo "$(cd "$1" && pwd)"
}

SCRIPT_ROOT=$(get_abs_path `dirname $0`)
GIT_ROOT=$(get_abs_path $SCRIPT_ROOT/..)

rm -rf /tmp/pjcpde && true
mkdir /tmp/pjcpde
# de zip file van projectcampus
unzip $1 -d /tmp/pjcpde
cd /tmp/pjcpde

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

rsync -avi --exclude=*pjc_fix.sh* . $GIT_ROOT/pde/
