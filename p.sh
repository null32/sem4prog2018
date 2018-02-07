#!/bin/bash

read a
declare -a arr
#arr=($(echo $a | grep -o .))
arr=($(echo $a | fold -w1))

i=0
len=${#a}
#while ((i < len))
#do
#	arr[i]=$(expr substr $a $((i + 1)) 1)
#	((i++))
#done
#i=0

max=0
while ((i < len))
do
	((${arr[i]} > ${arr[max]})) && max=$i
	((i++))
done

if ((len % 2 == 0))
then
	if ((max >= len / 2)) ; then echo 1; else echo -1; fi
else
	mid=$(( (len - 1) / 2 ))
	if ((max == mid)) ; then echo 0; fi
	if ((max < mid)) ; then echo -1; fi
	if ((max > mid)) ; then echo 1; fi
fi
