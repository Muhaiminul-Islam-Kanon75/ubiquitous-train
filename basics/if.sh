#!/bin/bash

a=3
b=5
c=7
d=9

if [ $b -gt $a ]; then
	echo "b is greater than a "
	echo "$b is greater than $a"
fi

if [ $a -lt $b ]; then
	echo "$a is less than $b"
fi
