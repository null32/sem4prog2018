#!/bin/bash

while read a
do
	len=${#a}
	ok=1
	for (( c=0; c<len / 2 ; c++ ))
	do
		if [[ ! "${a:$c:1}" == "${a:$((len - c - 1)):1}" ]]
		then
			ok=0
			break
		fi
	done

	if [ "$ok" -eq "1" ] ; then echo $a; fi
done
