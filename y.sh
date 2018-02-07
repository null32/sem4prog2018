#!/bin/bash

function min()
{
	(( $1 > $2 )) && echo $2 || echo $1
}

read -a temp

declare m=${temp[0]}
declare n=${temp[1]}

declare -A field

for (( c=0 ; c<m ; c++ ))
do
	read -a temp
	for (( d=0 ; d<n ; d++ ))
	do
		field[$c,$d]=${temp[$d]}
	done
done

for (( c=1 ; c<n ; c++ ))
do
	field[0,$c]=$(( ${field[0,$c]} + ${field[0,$((c - 1))]} ))
done
for (( c=1 ; c<m ; c++ ))
do
	field[$c,0]=$(( ${field[$c,0]} + ${field[$((c - 1)),0]} ))
done

for (( c=1 ; c<m ; c++ ))
do
	for (( d=1 ; d<n ; d++ ))
	do
		field[$c,$d]=$(( ${field[$c,$d]} + $(min ${field[$((c - 1)),$d]} ${field[$c,$((d - 1))]}) ))
	done
done

echo ${field[$((m - 1)),$((n - 1))]}
