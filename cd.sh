#!/bin/bash

read n
declare -a sents

while ((n--))
do
	read str
	sents+=($str)
done

read n
declare -a words

while ((n--))
do
	read str
	words+=($str)
done

for w in ${words[@]}
do
	res=0
	for s in "${sents[@]}"
	do
		c=$(echo "$s" | grep -woE "$w" | wc -l)
		(( res += c ))
	done
	echo $res
done
