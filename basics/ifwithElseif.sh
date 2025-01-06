#!/bin/bash

a=3
b=5
c=7
d=9

if [ $b -gt $c ]; then
        echo "b is greater than a "
        echo "$b is greater than $a"
elif [ $a -ne $b ]; then
	echo "NOT Equal"
else
        echo "$a is less than $b"
fi
