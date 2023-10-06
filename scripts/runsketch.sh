#!/bin/bash

PRO="/opt/processing-4.3/processing-java"
OPTS="--run"
#for i in *; 
#do
#    FILENAME=`echo $i | cut -d "_" -f3-`
#    PDENAME=`echo $FILENAME | cut -d "." -f1`
#    echo $i $FILENAME $PDENAME
    #if [[ $i != $FILENAME ]]; then mv $i $FILENAME; fi
    #mkdir -p $PDENAME/data
    #mv $FILENAME $PDENAME/
#    $PRO --sketch=$i $OPTS
#done

for i in `find . -name "*.pde"`
do
  FILENAME=`basename $i` 
  DIRNAME=$(dirname $i)
  PDENAME=`echo $FILENAME | cut -d "." -f1`
  echo $i, $DIRNAME, $FILENAME, $PDENAME
  $PRO --sketch=$DIRNAME $OPTS
done

