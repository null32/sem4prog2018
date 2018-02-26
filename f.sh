#!/bin/bash

read regex

while read a
do
	if echo "$a" | grep -xqE "$regex"
	then
		echo YES
	else
		echo NO
	fi
done
