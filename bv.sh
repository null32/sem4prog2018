#!/bin/bash

read t
while ((t-- > 0))
do
	read a
	echo $a | python3 -c "
a = int(input())
res = 1
for b in range(1, a + 1):
	res *= b
print(res)
"
done
