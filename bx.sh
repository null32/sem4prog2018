#!/bin/bash

read n

declare -a field
for (( c=0 ; c<63 ; c++ ))
do
	field[$c]=$(printf "_%.0s" {1..100})
done

declare -a indexes=(50)
declare h=62
declare sz=16

while ((n-- > 0))
do
	for (( c=0 ; c<sz ; c++ ))
	do
		for i in ${indexes[@]}
		do
			#field[$h]=$( echo ${field[$h]} | sed s/./1/$i )
			field[$h]=$( echo ${field[$h]:0:$((i - 1))}1${field[$h]:$i} )
		done
		((h--))
	done

	for (( c=0 ; c<sz ; c++))
	do
		for i in ${indexes[@]}
		do
			#field[$h]=$( echo ${field[$h]} | sed s/./1/$((i - c - 1)) )
			#field[$h]=$( echo ${field[$h]} | sed s/./1/$((i + c + 1)) )
			field[$h]=$( echo ${field[$h]:0:$((i - c - 2))}1${field[$h]:$((i - c - 1))} )
			field[$h]=$( echo ${field[$h]:0:$((i + c))}1${field[$h]:$((i + c + 1))} )
		done
		((h--))
	done

	declare -a newis
	for i in ${indexes[@]}
	do
		newis+=($((i - sz)) $((i + sz)))
	done

	unset indexes
	indexes=(${newis[@]})
	unset newis
	((sz /= 2))
done

for (( c=0 ; c<63 ; c++ ))
do
	echo ${field[c]}
done
