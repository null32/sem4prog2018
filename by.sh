#!/bin/bash

function magic() {
	local str="$@"
	local i=0
	local len=${#str}

	local inLinkTag=false
	local inTag=false
	local nameSet=false

	local name=""
	local link=""

	for ((i = 0; i < len; i++))
	do
		if ! $inTag && [ "${str:$i:1}" == "<" ]
		then
			inTag=true
		fi

		if $inTag && [ "${str:$i:1}" == ">" ]
		then
			inTag=false
		fi

		if ! $inLinkTag && [ "${str:$i:3}" == "<a " ]
		then
			inLinkTag=true
		fi

		if $inLinkTag && [ "${str:$i:4}" == "</a>" ]
		then
			inLinkTag=false
		fi

		if $inLinkTag && [ "${str:$i:6}" == "href=\"" ]
		then
			((i += 6))
			local linkStart=$i
			while ((i < len)) && [ "${str:$i:1}" != "\"" ]
			do
				((i++))
			done
			local linkEnd=$i

			link=${str:$linkStart:$((linkEnd - linkStart))}
		fi

#echo "[${str:$i:1}] link=$inLinkTag tag=$inTag nameSet=$nameSet"
		if $inLinkTag && ! $inTag && ! $nameSet
		then
			local nameStart=$((i + 1))
			nameSet=true
		fi

		if $inTag && $nameSet
		then
			local nameEnd=$i
			nameSet=false
			name+=${str:$nameStart:$((nameEnd - nameStart))}
		fi

		if ! $inLinkTag && ! [ -z "$link" ]
		then
			#echo "${str:$linkStart:$((linkEnd - linkStart))},${name}"
			local res=""
			res+=$(echo $link | xargs)
			res+=","
			res+=$(echo $name | xargs)
			((${#res} > 1)) && echo "$res"
			link=""
			name=""
		fi
	done
}

read n
while ((n--))
do
	read str
	magic "${str}"
done
true

