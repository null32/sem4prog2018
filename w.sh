#!/bin/bash

read n

if (( n == 1 ))
then
	echo 11
	exit 0
fi

res=50
for (( i = 2; i < n; i++))
do
	(( res *= 4 ))
done

echo $res
