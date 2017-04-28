#!/bin/bash 

ERR_LIST=("vips" "x264")
PROGRAM_LIST=("blackscholes" "bodytrack" "canneal" "dedup" "facesim" "ferret" "fluidanimate" "freqmine" "raytrace" "streamcluster" "swaptions" "vips" "x264")
RESULT_HOME_PATH=/home/dongjoo/workspace/parsec/result
start_time=$(date +%x)

for programs in "${ERR_LIST[@]}"
do
    RESULT_FILE=$RESULT_HOME_PATH/$programs.txt
    echo $programs >> $RESULT_FILE
    for x in 1 2 8 15 30 45 60 75 90 105 120
    do
	    parsecmgmt -a run -p $programs -i native -n $x -c gcc-hooks > tmp
        elapsedSec=$(grep 'Total time spent in ROI' tmp | awk '{print $7}')
        rm -rf tmp
	    echo $x $elapsedSec >> $RESULT_FILE
    done
done
