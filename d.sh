#!/bin/bash

read len
read -a arr

IFS=$'\n' sorted=($(sort <<<"${arr[*]}"))

i=0
max=0
cura=0
curv=0

while ((i < len))
do
	if ((curv != ${sorted[$i]}))
	then
		((cura > max)) && max=$cura
		curv=${sorted[$i]}
		cura=1
	else
		((cura++))
	fi
	((i++))
done
((cura > max)) && max=$cura

echo $max
