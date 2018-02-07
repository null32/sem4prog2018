#!/bin/bash

read len
read -a arr
read -a temp
declare -a cost=("0")
cost+=("${temp[@]}")

i=0
res=0
while (( i < len ))
do
	(( res += ${cost[ ${arr[$i]} ]} ))
	((i++))
done

echo $res
