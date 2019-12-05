#!/bin/bash
set -e
PRC="/opt/processing-3.5.3/processing-java"
SRC_DIR="./src"
OPT=""

SRCCODE=""

for dir in "$@"
do
    OPT="--sketch=$dir --force --output=$dir-parsed  --build"
    echo $PRC $OPT
    $PRC $OPT
    PDENAME=`basename $dir`
    echo "copying `basename $dir` sources to $SRC_DIR"
    cp $dir-parsed/source/$PDENAME.java $SRC_DIR/
    #echo "new $PDENAME();"
    #echo "sketches.add(new SketchShit(\"$PDENAME.pde\", new $PDENAME()));"
    rm -rf $dir-parsed
    SRCCODE="$SRCCODE\nsketches.add(new SketchShit(\"$PDENAME.pde\", new $PDENAME()));"
done
echo -e $SRCCODE
