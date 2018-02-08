#!/bin/bash

function min()
{
	if (( $1 > $2 ))
	then
		echo $2
	else
		echo $1
	fi
}

read n
declare -A field

for (( c=0 ; c<n ; c++ ))
do
	read -a temp
	for (( d=0 ; d<n ; d++ ))
	do
		field[$c,$d]=${temp[d]}
	done
done

for (( k=0 ; k<n ; k++ ))
do
	for (( i=0 ; i<n ; i++ ))
	do
		for (( j=0 ; j<n ; j++ ))
		do
			field[$i,$j]=$(min ${field[$i,$j]} $(( ${field[$i,$k]} + ${field[$k,$j]} )))
		done
	done
done

for (( c=0 ; c<n ; c++ ))
do
	for (( d=0 ; d<n - 1 ; d++ ))
	do
		printf "%s " ${field[$c,$d]}
	done
	echo "${field[$c,$((n - 1))]}"
done
