#!/bin/sh

# Exercises for Programmers
# 9 - Paint Calculator
# Written by: Hubert Léveillé Gauvin
# Date: 16 May 2017

# Calculate gallons of paint needed to paint the ceiling of a room. Prompt for the length and width, and assume one gallon covers 350 square feet. Display the numbers of gallons needed to paint the ceiling as a whole number.

check_numeric() {
### Checks if input is a numeric value e.g. 1, -1, 2.0, etc
# USE INSIDE LOOP
		if [[ $1 =~ ^[+-]?([0-9]*[.])?[0-9]+$ ]]; then
		break
		else
		echo -e "\033[0;31m'$1' is not numeric.\033[0m"
		fi
}

while read -p "What is the length of the ceiling, in feet? " length; do
check_numeric $length
done

while read -p "What is the width of the ceiling, in feet? " width; do
check_numeric $width
done


area=$(awk "BEGIN {print $length * $width}")
gallons=$(awk "BEGIN {print $area / 350}")


if [ "$gallons" -eq "$gallons" ] 2>/dev/null; then  # if $gallons is integer; do nothing
  :		
else	# else, divide $gallons into two parts using the character . : before and after decimal point. Print only the first part (i.e. before decimal point)
  gallons=$(echo $gallons | awk 'BEGIN {FS="."}{print $1}')
  gallons=$(awk 'BEGIN {print $gallons + 1}') # add 1 to the number to always round up
fi

echo "You will need to purchase $gallons gallon(s) of paint to cover $area square feet."
