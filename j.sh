#!/bin/bash

function stuff()
{
    read -r n m step
    declare -a values
    while (( n-- > 0 ))
    do
        read -a temp
        values+=(${temp[@]})
    done
    values=($(printf "%s\n" "${values[@]}" | sort -g))

    len=${#values[@]}
    li=0
    ri=0
    cost=0

    while ((li + ri < len))
    do
        if ((li <= ri))
        then
            if (( values[li] != values[li + 1] ))
            then
                if (( (values[li + 1] - values[i]) % step != 0 ))
                then
                    echo -1
                    return 0
                fi
                #echo "${values[li]} != ${values[li + 1]} => cost += $(((li + 1) * (values[li + 1] - values[li]) / step))"
                (( cost += (li + 1) * (values[li + 1] - values[li]) / step ))
                values[li]=${values[li + 1]}
            fi
            ((li++))
        else
            if (( values[len - ri - 1] != values[len - ri - 2] ))
            then
                if (( (values[len - ri - 1] - values[len - ri - 2]) % step != 0 ))
                then
                    echo -1
                    return 0
                fi
                #echo "${values[len - ri - 1]} != ${values[len - ri - 2]} => cost += $(((ri + 1) * (values[len - ri - 1] - values[len - ri - 2]) / step))"
                (( cost += (ri + 1) * (values[len - ri - 1] - values[len - ri - 2]) / step ))
                values[len - ri - 1]=${values[len - ri - 2]}
            fi
            ((ri++))
        fi
    done

    echo $cost
}

read t
while (( t-- > 0 ))
do
  stuff
done
