#!/bin/bash

read a
read -a arr

declare max=0
declare min=0

i=0
len=${#arr[@]}
while ((i < len))
do
	((${arr[$i]} > ${arr[$max]})) && max=$i
	((${arr[$i]} < ${arr[$min]})) && min=$i
	((i++))
done

i=${arr[$min]}
arr[$min]=${arr[$max]}
arr[$max]=$i

i=0
while ((i < len))
do
	echo ${arr[$i]}
	((i++))
done
