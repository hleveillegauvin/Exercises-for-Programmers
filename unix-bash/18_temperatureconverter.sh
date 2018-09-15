#!/bin/sh

# Exercises for Programmers
# 18 - Temperature Converter
# Written by: Hubert Léveillé Gauvin
# Date: 1 December 2017

# Create a program that onverts temperatures from Fahrenheit to Celsius (or vice versa).
# Prompt for the starting temperature. The program should prompt for the type
# of conversion and then perform the conversion.

# The formulas are

#	C=(F-32)*5/9
#	F=(C*9/5)+32

check_numeric() {
### Checks if input is a numeric value e.g. 1, -1, 2.0, etc
# USE INSIDE LOOP
		if [[ $1 =~ ^[+-]?([0-9]*[.])?[0-9]+$ ]]; then
		break
		else
		echo -e "\033[0;31m'$1' is not numeric.\033[0m"
		fi
}


RED='\033[0;31m'
NC='\033[0m' # No Color


echo

while :
do

	while :
	do
		echo "Press C to convert from Celcius to Fahrenheit."
		echo "Press F to convert from Fahrenheit to Celcius."
		read -p "Your choice: " choice
			if [[ $choice =~ ^([cC]|[cC]elsius)$ ]]; then
			choice="Celsius"
			other="Fahrenheit"
			break
			elif [[ $choice =~ ^([fF]|[fF]ahrenheit)$ ]]; then
			choice="Fahrenheit"
			other="Celsius"
			break
			else 
			echo "${RED}$choice is not a valid answer.${NC}"
		fi
	done


	while read -p "Please enter the temperature in $choice: " value; do
	check_numeric $value
	done

	if [[ $choice = "Celsius" ]]; then
	output=$(awk "BEGIN { print (($value*9/5)+32) }")
	elif [[ $choice = "Fahrenheit" ]]; then
	output=$(awk "BEGIN { print (($value-32)*5/9) }")
	fi

	echo "The temperature in $other is $output."
	echo

done
