#!/bin/bash 

StartTime=$(date)

addition() {
	result=$(($1 + $2))
	echo $result
}

substituition() {
	result=$(($1 - $2))
	echo $result
}

multiplicate() {
	result=$(($1*$2))
	echo $result
}

division() {
	result=$(($1 / $2))
	echo $result
}

remainder() {
	result=$(($1%$2))
	echo $result
}

power() {
	result=$(($1 ** $2))
	echo $result
}

cat CalcultorRules.txt

read -p "what to do: " action
# Example usage

read -p "Enter first number: " v1
read -p "Enter second number: " v2

cal=$($action $v1 $v2)

if [[ $action = "addition" ]]; then
	echo "The sum of $v1 and $v2 is: $cal"

elif [[ $action = "substituition" ]]; then
	echo "$v1 - $v2 = $cal"
elif [[ $action = "multiplicate" ]]; then
	echo "$v1 multiplied by $v2 is $cal"
elif [[ $action = "division" ]]; then
	echo "$v1 divided by $v2 is $cal"

elif [[ $action = "remainder" ]]; then
	echo "The remainder when $v1 is divided by $v2 is: $cal"

elif [[ $action = "power" ]]; then
	echo "$v1 raised to the power of $v2 is: $cal"
fi

EndTime=$(date)

echo -e "Last run at $(date)\n" >> calculator.log
echo -e "Start Time: $StartTime \nEnded on $EndTime\n" >> calculator.log
