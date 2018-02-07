#!/bin/bash

read -a arr
(( (${arr[0]} * ${arr[1]}) % 2 == 0 )) && echo first || echo second
