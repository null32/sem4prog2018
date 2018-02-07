#!/bin/bash

read -a temp
declare -a arr
i=0
while read a
do
	arr[$i]="$a"
	((i++))
done

echo ${arr[@]:${temp[0]}:$((${temp[1]} - ${temp[0]} + 1))}
