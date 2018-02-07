#!/bin/bash

read a
read b
read c

if [ "$a" -eq "$b" ] && [ "$a" -eq "$c" ] ; then echo EQUILATERAL; exit 0; fi
if [ "$a" -eq "$b" ] || [ "$a" -eq "$c" ] || [ "$b" -eq "$c" ] ; then echo ISOSCELES; exit 0; fi
echo SCALENE
