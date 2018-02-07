#!/bin/bash

money=(500 200 100 50 20 10)

function solve()
{
	local sum=$1
	local count=0
	local len=6
	local i=0
	while ((i < len))
	do
		((count += sum / ${money[i]}))
		((sum %= ${money[i]}))
		((i++))
	done

	((sum == 0)) && echo $count || echo -1
}

read t
i=0
while ((i < t))
do
	read a
	solve $a
	((i++))
done

