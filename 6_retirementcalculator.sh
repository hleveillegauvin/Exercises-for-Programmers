#!/bin/sh

# Exercises for Programmers
# 6 - Retirement Calculator
# Written by: Hubert Léveillé Gauvin
# Date: 26 December 2016

# Create a program that determines how many years you have left until retirement and the year you can retire.

currentyear=$(date "+%Y")

read -p "What is your current age? " age
read -p "At what age would you like to retire? " retirement

yearsleft=$(awk "BEGIN {print $retirement - $age}")
retirementyear=$(awk "BEGIN {print $currentyear + $yearsleft}")



if [ "$yearsleft" -lt 0 ]; then
echo "You can already retire!"
exit

elif [ "$yearsleft" -eq 0 ]; then 
echo "You can retire this year!"
exit

elif [ "$yearsleft" == 1 ]; then
echo "You have $yearsleft year left until you can retire."

else
echo "You have $yearsleft years left until you can retire."
fi

echo "It's $currentyear, so you can retire in $retirementyear."