#!/bin/bash

read a
read b

printf "%s\n%s\n%s\n%s\n" $((a + b)) $((a - b)) $((a * b)) $((a / b))
