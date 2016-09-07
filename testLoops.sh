#!/bin/bash


# Loop for printing numbers START to END
echo "For Loop:"
START=0
END=100
for ((counter = $START; counter <= $END; counter+=5))
do
	echo $counter
done

echo "While Loop:"
counter=$START
while [[ $counter -le $END ]]
do
	echo $counter
	counter=$((counter+5))
done

echo "For Each Loop:"
arr=`seq $START 5 $END`
for i in $arr
do
	echo $i
done


printArgs()
{
	for i in $@
	do
		echo $i
	done
}

echo "Print function arguments:"
printArgs 10 "ABB" 141
