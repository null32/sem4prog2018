#!/bin/bash

read n

for (( c=0 ; c<n ; c++ ))
do
	read a
	if echo "$a" | grep -xqE "[a-zA-Z0-9][a-zA-Z0-9\.\_\-]*[a-zA-Z0-9]@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}"
	then
		echo "YES"
	else
		echo "NO"
	fi
done
