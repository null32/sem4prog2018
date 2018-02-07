#!/bin/bash

read a
declare -a arr

len=${#a}
i=0
while ((i < len))
do
	arr[i]=$(expr substr $a $((i + 1)) 1)
	((i++))
done

IFS=$'\n' sorted=($(sort <<<"${arr[*]}"))

torem=${sorted[$(( (len - 1) / 2 ))]}

a=${a//${torem}/}

echo $torem
[ -z $a ] && echo NULL || echo $a
