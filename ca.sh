#!/bin/bash

read n
declare -a sents

for (( c=0 ; c<n ; c++ ))
do
	read sents[$c]
done

read n
declare -a words

for (( c=0 ; c<n ; c++ ))
do
	read words[$c]
done

for w in ${words[@]}
do
	res=0
	for s in "${sents[@]}"
	do
		c=$(echo "$s" | grep -oP "[\w\d_]$w[\w\d_]" | wc -l)
		(( res += c ))
	done
	echo $res
done
