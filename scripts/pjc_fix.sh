#!/bin/bash
set -e

get_abs_path() {
  echo "$(cd "$1" && pwd)"
}

SCRIPT_ROOT=$(get_abs_path `dirname $0`)
GIT_ROOT=$(get_abs_path $SCRIPT_ROOT/..)

if [ -z "$1" ]; then 
    echo "need zip url to download"
    exit 1
fi

wget $1 -O /tmp/pjc.zip

rm -rf /tmp/pjcpde && true
mkdir /tmp/pjcpde
# de zip file van projectcampus
unzip /tmp/pjc.zip -d /tmp/pjcpde
cd /tmp/pjcpde

for i in `ls *.pde`; 
do
    FILENAME=`echo $i | cut -d "_" -f3-`
    PDENAME=`echo $FILENAME | cut -d "." -f1`
    IDX=`echo $i | cut -d "_" -f1`
    if [ -d $PDENAME ] # seems this one exists already
    then               # append index nr
        PDENAME=${PDENAME}_IDX${IDX}; echo $PDENAME bbla
    fi
    if [[ $i != $FILENAME ]]
    then
        mv $i $PDENAME.pde
    fi
    mkdir -p $PDENAME/data
    mv $PDENAME.pde $PDENAME/
    echo $FILENAME $PDENAME
done

for i in `ls *.zip`; 
do
    unzip $i
    rm $i
done
find . -iname "*DS_store*" | xargs rm -rf
rm -rf __MACOSX

rsync -avi --exclude=*pjc_fix.sh* . $GIT_ROOT/pde/
