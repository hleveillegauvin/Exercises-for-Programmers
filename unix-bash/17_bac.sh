#!/bin/sh

# Exercises for Programmers
# 17 - Blood Alcohol Calculator
# Written by: Hubert Léveillé Gauvin
# Date: 21 November 2017

# Create a program that prompts for your weight, gender, number of drink, 
# the amount of alcohol by volume of the drinks consumed, and the amount 
# of time since your last drink. Calculate your blood alcohol content (BAC) 
# using the formula:

# BAC = (A * 5.14/W * r) - .015 * H    where

# A is total alcohol consumed, in oz
# W is body weight in pounds
# r is the alcohol distribute ratio
#	- .68 for men
#	- .55 for women
# H is the number of hours since your last drink

# Display whether or not it's legal to drive by comparing the blood alcohol content to 0.08

check_numeric_only_positive() {
# USE INSIDE LOOP
		if [[ $1 =~ ^([0-9]*[.])?[0-9]+$ ]]; then
		break
		else
		echo -e "\033[0;31m'$1' is not numeric.\033[0m"
		fi
}


GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

while read -p "What's your drink's alcohol level (ABV), in %? " abv; do 
check_numeric_only_positive $abv
done

while read -p "How many ounces did you drink? " oz; do 
check_numeric_only_positive $oz
done


abv=$(awk "BEGIN { print $abv / 100}")

A=$(awk "BEGIN { print $abv * $oz}")
	
while read -p "What is your body weight, in pounds? " W; do
check_numeric_only_positive $W
done

while read -p "What is your gender (M/W)? " S; do

if [[ $S =~ ^([Mm]an|[Mm])$ ]]; then
	r=0.73
	break
	elif [[ $S =~ ^([Ww]oman|[Ww])$ ]]; then
	r=0.66
	break
	else
	echo "$S is not a valid gender."
fi
done

while read -p "How many hours since your last drink? " H; do
check_numeric_only_positive $H
done


bac=$(awk "BEGIN {print ($A * 5.14/ $W * $r) - .015 * $H}")

if [[ $bac < 0 ]]; then
bac=0
fi

echo "Your BAC is $bac."

if [[ $bac < 0.05 ]]; then
 echo "${GREEN} You are OK to drive.${NC}"
 elif
 [[ $bac > 0.08 ]]; then
 echo "${RED} It is NOT legal for you to drive.${NC}"
 else
 echo "${YELLOW} You should not drive.${NC}"
 fi

