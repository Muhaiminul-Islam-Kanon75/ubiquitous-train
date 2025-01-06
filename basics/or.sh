#!/bin/bash


a=5
b=3
c=3

if [ $b -ge $a ] || [ $b == $c ]; then
        echo "hello, How are you?"
elif [ $a -eq $c ]; then
        echo "goodbye"
else
        echo "nothing"
fi

