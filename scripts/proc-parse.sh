#!/bin/bash
set -e
PRC="/opt/processing-3.5.4/processing-java"
SRC_DIR="./tmp/pde"

SRCCODE=""

mkdir -p $SRC_DIR

create_music_pde() {
    cat > $1 << EOF
int currentPosition = 0;
int currentPattern = 0;
void loadSounds() {}
void loadSounds(int s, int e) {}
void playSounds() {}
EOF
}

# handled by make
#if [ "$1" -nt "$2" ]
#then
#    echo "$1 is newer than $2"
#fi
#exit 0

FILENAME=`basename $1`
DIRNAME=$(dirname $1)
PDENAME=`echo $FILENAME | cut -d "." -f1`

#echo $1 $FILENAME $DIRNAME $PDENAME
cp -r $DIRNAME /tmp/
TMPPDENAME="/tmp/${PDENAME}"

# replace illegal methods
sed -i 's/frameRate(/\/\/frameRate(/g' $TMPPDENAME/$FILENAME
sed -i 's/frameRate\ (/\/\/frameRate\ (/g' $TMPPDENAME/$FILENAME
sed -i 's/surface./\/\/surface./g' $TMPPDENAME/$FILENAME
sed -e '/new OscP5/s/^/\/\//g' -i $TMPPDENAME/$FILENAME
#sed -i 's/background(/\/\/background(/g' $TMPPDENAME/$FILENAME

OPT="--sketch=$TMPPDENAME --force --output=$DIRNAME-parsed  --build"
#echo $PRC $OPT
$PRC $OPT
#echo "copying `basename $dir` sources to $SRC_DIR"
mkdir -p `dirname $2`
# make make happy
cp $DIRNAME-parsed/source/$PDENAME.java $2
# make java happy, they both need a different dir :(
cp $DIRNAME-parsed/source/$PDENAME.java src/pde/

if [[ -d $DIRNAME/data ]]; then
     cp -r $DIRNAME/data/* data/ &> /dev/null | true
fi
rm -rf $DIRNAME-parsed
rm -rf $TMPPDENAME
# undo replace illegal methods
#sed -i 's/\/\/frameRate(/frameRate(/g' $1
##sed -i 's/\/\/background(/background(/g' $1
#sed -i 's/\/\/frameRate\ (/frameRate\ (/g' $1
#sed -i 's/\/\/surface./surface./g' $1
#sed -e '/new OscP5/s/^\/\///g' -i $1
SRCCODE="$SRCCODE\nsketches.add(Arrays.asList(new SketchShit(\"$PDENAME.pde\", new $PDENAME())));"
#SRCCODE="$SRCCODE\nnew SketchShit(\"$PDENAME.pde\", new $PDENAME())"

echo -e $SRCCODE
