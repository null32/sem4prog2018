#!/bin/bash

magic=(6 28 496 8128 33550336 8589869056)

read t
while ((t-- > 0))
do
	read n
	read -a arr

	len=${#arr[@]}
	for (( i = 0; i < len; i++))
	do
		good=0
		for m in "${magic[@]}"
		do
			if [ "${arr[$i]}" -eq "$m" ]
			then
				good=1
				break
			fi
		done
		[ "$good" -eq "0" ] && unset arr[$i] || true
	done

	[ -z "${arr[*]}" ] && echo "-1" || printf "%s\n" "${arr[@]}"
done
