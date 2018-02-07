#!/bin/bash

function solve()
{
	local sw=0
	local a=$1
	for (( c=1; c<=a ; c++ ))
	do
		(( sw += a % c == 0 ))
	done
	echo $(( sw % 2 ))
}

read t
while ((t > 0))
do
	read a
	solve $a
	((t--))
done
