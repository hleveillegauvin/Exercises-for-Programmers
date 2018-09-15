#!/bin/sh

# Exercises for Programmers
# 7 - Area of a Rectangular Room
# Written by: Hubert Léveillé Gauvin
# Date: 9 May 2017

# Create a program that calculates the area of a room. Prompt the user for the length and width of the room in feet. Then display the area in both square feet and square meters.

check_numeric() {
### Checks if input is a numeric value e.g. 1, -1, 2.0, etc
# USE INSIDE LOOP
		if [[ $1 =~ ^[+-]?([0-9]*[.])?[0-9]+$ ]]; then
		break
		else
		echo -e "\033[0;31m'$1' is not numeric.\033[0m"
		fi
}


while read -p "What is the length of the room in feet? " length; do
check_numeric $length
done

while read -p "What is the width of the room in feet? " width; do
check_numeric $width
done

areafeet=$(awk "BEGIN {print $length * $width}")
areameter=$(awk "BEGIN {print sqrt($length^2 * 0.09290304) * sqrt($width^2 * 0.09290304)}")

echo "You entered dimensions of $length feet by $width feet."
echo "The area is: "
echo "$areafeet square feet"
echo "$areameter square meters"
