#!/bin/bash

regex="[A-Za-z0-9\.\-\_]+@([A-Za-z0-9\-\_]+\.)+[A-Za-z]{2,3}"

txt=$(cat)
mails=($(echo "$txt" | grep -oE "$regex" | sort | uniq))
mails="${mails[@]}"
echo ${mails// /;}
