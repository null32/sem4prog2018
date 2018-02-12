#!/bin/bash

read t
while ((t-- > 0))
do
	read n
	read -a arr
	declare -a primes

	for (( d=0 ; d < n ; d++ ))
	do
		if (( ${arr[d]} == 1 ))
		then
			primes+=(${arr[$d]})
			continue
		fi

		for (( c=2 ; c * c <= ${arr[d]} ; c++ ))
		do
			if (( ${arr[d]} % c == 0 ))
			then
				primes+=(${arr[$d]})
				break
			fi
		done
	done

	if (( ${#primes[@]} > 0 ))
	then
		printf "%s\n" "${primes[@]}"
	else
		echo "-1"
	fi

	unset arr
	unset primes
done
