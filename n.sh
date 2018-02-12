#!/bin/bash

function foo()
{
	# $1 avaible chars
	# $2 mask of taken chars
	# $3 result string
	local c

	if (( $2 == ((1 << ${#1}) - 1) ))
	then
		echo $3
		return
	fi

	for (( c=0 ; c<${#1} ; c++ ))
	do
		if (( ($2 ^ (1 << c)) < $2 )) ; then continue; fi

		foo "$1" $(( $2 ^ (1 << c) )) "$3${1:$c:1}"
	done
}

read -r a b c

arr1=($(foo "$a" 0 ""))
arr2=($(foo "$b" 0 ""))

for k in "${arr1[@]}"
do
	for l in "${arr2[@]}"
	do
		if (( k + l == c ))
		then
			echo "YES"
			echo "$k $l"
			exit 0
		fi
	done
done

echo "NO"
