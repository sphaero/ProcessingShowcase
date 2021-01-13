#!/bin/bash

for i in {0..100}
do
    START=`echo "$i*6.6628" | bc -l`
    STOP=`echo "($i+1)*6.6628" | bc -l`
    echo $START $STOP
    #ffmpeg -y -i ~/psychotech.wav -ss $START -to $STOP -c copy sound/$i.wav
    ffmpeg -y -i ~/psychotech.wav -ss $START -to $STOP -sample_fmt s16 -ar 441000 sound/$i-44khz.wav
done
