#!/bin/bash

# Failed on some test
# but still got accepted.
# Dunno if this is
# the proper solution.

read -a inp
a=${inp[0]}
b=${inp[1]}

res=0

if ((a > b))
then
	((res += a / b))
	((a % b != 0)) && ((res++))
	c=$(( a - (a % b) ))
	((res += c / b))
	((c % b != 0)) && ((res++))
else
	res=2
fi

echo $res
