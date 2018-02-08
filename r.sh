#!/bin/bash

function solve()
{
	local sq=$(echo "($1 * $3 + $2 * $3) * 2" | bc)
	res=$(echo "$sq / 16" | bc)
	if [ ! "$(echo "$sq % 16" | bc)" -eq "0" ] ; then ((res++)); fi
	echo $res
}

read t
while ((t-- > 0))
do
	read -a arr
	solve ${arr[0]} ${arr[1]} ${arr[2]}
done
