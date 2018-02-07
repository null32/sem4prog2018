#!/bin/bash

read a
(( ${#a} == 1 )) && { echo 0; exit 0; }

syms=($(echo $a | fold -w1))
pos=0
len=${#a}
while ((pos < len - 1))
do
	(( ${syms[pos]} < ${syms[$((pos + 1))]} )) && break
	((pos++))
done
unset syms[$pos]
printf "%s" ${syms[@]}
