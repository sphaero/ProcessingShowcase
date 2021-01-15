#!/bin/bash
set -e
PRC="/opt/processing-3.5.3/processing-java"
SRC_DIR="./src/pde"
OPT=""

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

for dir in "$@"
do
    #if ! [ -e "$dir/music.pde" ]; then
    #echo "creating $dir/music.pde"
    #create_music_pde $dir/music.pde
    #fi
    PDENAME=`basename $dir`
    # replace illegal methods
    sed -i 's/frameRate(/\/\/frameRate(/g' $dir/$PDENAME.pde
    sed -i 's/frameRate\ (/\/\/frameRate\ (/g' $dir/$PDENAME.pde
    sed -i 's/surface./\/\/surface./g' $dir/$PDENAME.pde
    OPT="--sketch=$dir --force --output=$dir-parsed  --build"
    echo $PRC $OPT
    $PRC $OPT
    echo "copying `basename $dir` sources to $SRC_DIR"
    cp $dir-parsed/source/$PDENAME.java $SRC_DIR/
    if [[ -d $dir/data ]]; then
        cp -r $dir/data/* data/ &> /dev/null | true
    fi
    #echo "new $PDENAME();"
    #echo "sketches.add(new SketchShit(\"$PDENAME.pde\", new $PDENAME()));"
    rm -rf $dir-parsed
    # undo replace illegal methods
    sed -i 's/\/\/frameRate(/frameRate(/g' $dir/$PDENAME.pde
    sed -i 's/\/\/frameRate\ (/frameRate\ (/g' $dir/$PDENAME.pde
    sed -i 's/\/\/surface./surface./g' $dir/$PDENAME.pde
    SRCCODE="$SRCCODE\nsketches.add(Arrays.asList(new SketchShit(\"$PDENAME.pde\", new $PDENAME())));"
    #SRCCODE="$SRCCODE\nnew SketchShit(\"$PDENAME.pde\", new $PDENAME())"
done
echo -e $SRCCODE
