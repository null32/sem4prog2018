#!/bin/bash

h=544
read -a arr

len=${arr[0]}
i=1
while (( i - 1 < len ))
do
	(( ${arr[i]} <= h )) && { echo "Crash $i"; exit 0; }
	((i++))
done

echo "No crash"
