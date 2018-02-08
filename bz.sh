#!/bin/bash

read t
declare -a tags

while ((t-- > 0))
do
	read a

	while true
	do
		i=$(expr index "$a" "<")
		if [ "$i" -eq "0" ] ; then break; fi

		a=${a:$i}
		i=$(expr index "$a" " />")

		tags+=(${a:0:$((i - 1))})
		a=${a:$i}
	done
done

tags=($(printf "%s\n" "${tags[@]}" | sort -u))
tags="${tags[*]}"
echo ${tags// /;}
