#!/bin/bash

read n k

declare -A matrix

for (( i = 1; i <= n; i++ ))
do
	for (( j = 1; j <= k; j++ ))
	do
		matrix[$i,$j]=0
	done
	matrix[$i,1]=1
done

#iteration for sequence length
for (( i = 2; i <= k; i++ ))
do
	#iteration for each possible num
	for (( j = 1; j <= n; j++ ))
	do
		for (( p = j; p <= n; p += j ))
		do
			matrix[$p,$i]=$(( ${matrix[$p,$i]} + ${matrix[$j,$((i - 1))]} ))
		done
	done
done

#debug
#for (( i = 1; i <= n; i++ ))
#do
#	for (( j = 1; j <= k; j++ ))
#	do
#		printf "%5s " ${matrix[$i,$j]}
#	done
#	echo ""
#done

sum=0
for (( i = 1; i <= n; i++ ))
do
	(( sum += ${matrix[$i,$k]} ))
done

echo $sum
