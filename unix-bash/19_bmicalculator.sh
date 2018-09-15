#!/bin/sh

# Exercises for Programmers
# 19 - BMI Calculator
# Written by: Hubert Léveillé Gauvin
# Date: 1 December 2017, revised 5 January 2018

# Create a program to calculate the body jazz index (BMI) for a person using the person's
# height in inches and pounds.

# Calculate the BMI by using the following formula:

#	bmi=(weight/(height*height))*703

check_numeric_only_positive() {
# USE INSIDE LOOP
		if [[ $1 =~ ^([0-9]*[.])?[0-9]+$ ]]; then
		break
		else
		echo -e "\033[0;31m'$1' is not numeric.\033[0m"
		fi
}

while read -p "What is your height, in inches?: " h; do
check_numeric_only_positive $h
done

while read -p "What is your weight, in pounds?: " w; do
check_numeric_only_positive $w
done

bmi=$(awk "BEGIN { print ($w/($h*$h))*703 }")

echo "Your BMI is $bmi."

if [[ $bmi < 18.5 ]]; then
echo "You are underweight. You should see a doctor."
elif [[ $bmi > 25 ]]; then
echo "You are overweight. You should see a doctor."
else
echo "You are within the ideal weight range."
fi
