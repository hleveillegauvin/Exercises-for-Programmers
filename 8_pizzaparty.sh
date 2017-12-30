#!/bin/sh

# Exercises for Programmers
# 8 - Pizza Party
# Written by: Hubert Léveillé Gauvin
# Date: 10 May 2017

# Write a program to evenly divide pizzas. Prompt for the number of people, the number of pizzas, and the number of slices per pizza. Ensure that the number of pieces comes out even. Display the number of pieces of pizza each person should get. If there are leftovers, show the number of leftover pieces.

check_whole_number() {
### Checks if input is a whole number i.e. {0, 1, 2, ...}
# USE INSIDE LOOP
if [[ "$1" =~ ^[0-9]+$ ]]; then
break
else
echo -e "\033[0;31m'$1' is not a valid number.\033[0m"
fi
}


while read -p "How many people? " people; do
check_whole_number $people
done

while read -p "How many pizzas do you have? " pizzas; do
check_whole_number $pizzas
done

while read -p "How many slices per pizza? " slices; do
check_whole_number $slices
done

totalslices=$(awk "BEGIN {print $slices * $pizzas}")
slicesperperson=$(awk "BEGIN {print $totalslices / $people}")

echo

if (( $totalslices % $people == 0 )); then
	echo "$people people with $pizzas pizzas"
	echo "Each person gets $slicesperperson pieces of pizza"
	echo "There are 0 leftover pieces"
break
	else
	subtotalslices=$(awk "BEGIN {print $totalslices - 1}")
	leftover=1
	slicesperperson=$(awk "BEGIN {print $subtotalslices / $people}")
		while [ $subtotalslices -lt $totalslices ]; do
			if (( $subtotalslices % $people == 0 )); then
				echo "$people people with $pizzas pizzas"
				echo "Each person gets $slicesperperson pieces of pizza"
				echo "There are $leftover leftover pieces"
			break
				else
		subtotalslices=$(awk "BEGIN {print $subtotalslices - 1}")
		leftover=$(awk "BEGIN {print $leftover + 1}")
		slicesperperson=$(awk "BEGIN {print $subtotalslices / $people}")
				fi
		done
fi