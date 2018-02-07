#!/bin/bash

read -a arr
h1=${arr[0]}
m1=${arr[1]}
h2=${arr[2]}
m2=${arr[3]}
bang=0

while (( (h1 != h2) || (m1 < m2) ))
do
	if (( m1 == 30 ))
	then
		((bang++))
	fi
	if (( m1 == 0 ))
	then
		(( h1 % 12 == 0 )) && ((bang += 12)) || ((bang += h1 % 12 ))
	fi

	(( m1++ ))
	if (( m1 == 60 ))
	then
		m1=0
		((h1++))
	fi
done

if (( m1 == 30 ))
then
	((bang++))
fi
if (( m1 == 0 ))
then
	(( h1 % 12 == 0 )) && ((bang += 12)) || ((bang += h1 % 12 ))
fi

echo $bang
