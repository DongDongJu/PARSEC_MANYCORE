#!/bin/bash 

RESULT_HOME_PATH=/home/dongjoo/workspace/parsec/result

start_time=$(date +%x)
RESULT_FILE=$RESULT_HOME_PATH/$start_time_$1.txt

echo $1 >> $RESULT_FILE
for x in 1 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200 210 220 230 240
do
	beginTime=$(date +%s%N)
	parsecmgmt -a run -p $1 -i native -n $x
    endTime=$(date +%s%N) 
	elapsed=`echo "($endTime - $beginTime) / 1000000" | bc` 
	elapsedSec=`echo "scale=6;$elapsed / 1000" | bc | awk '{printf "%.6f", $1}'` 
	echo $x $elapsedSec >> $RESULT_FILE
done

