#!/bin/bash

read -p "Enter numebr: " i

for a in {1..10}
do
	echo $i
	(( i+=1 ))
done
