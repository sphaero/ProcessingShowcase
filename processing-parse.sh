#!/bin/bash
set -e
PRC="/opt/processing-3.5.3/processing-java"
SRC_DIR="./src/pde"
OPT=""

SRCCODE=""

create_music_pde() {
    cat > $1 << EOF
int currentPosition = 0;
int currentPattern = 0;
void loadSounds() {}
void loadSounds(int s, int e) {}
void playSounds() {}
EOF
}

for dir in "$@"
do
    #if ! [ -e "$dir/music.pde" ]; then
    echo "creating $dir/music.pde"
    create_music_pde $dir/music.pde
    #fi
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
