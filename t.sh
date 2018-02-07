#!/bin/bash

read a

debt=2
credit=4

(( a == 1 )) && { echo 2 2; exit 0; }
while (( a > 1 ))
do
	debt=$(( debt + credit ))
	ret=$(( debt / 2 ))
	debt=$(( debt - ret ))
	spent=$(( credit - ret ))
	credit=$(( credit * 2))
	((a--))
done
echo $spent $debt
