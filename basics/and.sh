#!/bin/bash


a=1
b=2
c=2

if [ $b -ge $a ] && [ $b == $c ]; then
	echo "hello, How are you?"
elif [ $a -eq $c ]; then
	echo "goodbye"
else
	echo "nothing"
fi

