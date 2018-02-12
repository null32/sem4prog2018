#!/bin/bash

function solve()
{
	read len
	read -a arr

	if ((len % 2 == 0))
	then
		sorted1=($(printf "%s\n" "${arr[@]:0:$((len / 2))}" | sort -g))
		sorted2=($(printf "%s\n" "${arr[@]:$((len / 2))}" | sort -g -r))
		printf "%s\n" "${sorted1[@]}"
		printf "%s\n" "${sorted2[@]}"
	else
		sorted1=($(printf "%s\n" "${arr[@]:0:$((len / 2))}" | sort -g))
		sorted2=($(printf "%s\n" "${arr[@]:$((len / 2 + 1))}" | sort -g -r))
		printf "%s\n" "${sorted1[@]}"
		echo ${arr[$((len / 2))]}
		printf "%s\n" "${sorted2[@]}"
	fi
}

read t
while ((t-- > 0))
do
	solve
done
