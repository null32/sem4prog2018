#!/bin/bash

declare a
while read a
do
	b=1
	while (( a > b ))
	do
		(( a -= b ))
		((b++))
	done

	echo $((b - a + 1))/$a
done
