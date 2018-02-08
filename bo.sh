#!/bin/bash

read n
if (( $n == 1 ))
then
	read n
	echo $n
else
	read -a arr
	a=${arr[*]}
	echo $((${a// /^}))
fi
