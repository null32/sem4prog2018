#!/bin/bash

read n
sum=0

for (( c=0 ; c<n ; c++ ))
do
	read temp
	(( sum += temp ))
done

echo "$sum / $n" | bc -l | awk '{printf "%.3f\n", $1}'
