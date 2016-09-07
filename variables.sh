#!/bin/bash
HELLO="Hello World"
echo $HELLO
columns=(4   5   6)
echo ${columns[*]}
echo ${columns[0]}
echo $columns


startTime=1001
diffTime=100
endTime=$((startTime+diffTime))
echo $startTime $diffTime $endTime

