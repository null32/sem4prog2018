#!/bin/bash

read a
echo "scale=3; $a" | bc -l
