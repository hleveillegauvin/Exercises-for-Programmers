#!/bin/sh

# Exercises for Programmers
# 5 - Simple Math
# Written by: Hubert Léveillé Gauvin
# Date: 22 December 2016

# Write a program that prompts for two numbers. Print the sum, difference, product, and quotient of those numbers.

while read -p "What is the first number? " first; do

if [[ $first = *[[:digit:]]* ]]; then
 :		# The no-op command in shell is :
break	# if $first is numeric, break loop
else
 echo "$first is not numeric. Enter a numeric value. "
fi
done


while read -p "What is the second number? " second; do 

if [[ $second = *[[:digit:]]* ]]; then
 :		# The no-op command in shell is :
break	# if $second is numeric, break loop
else
 echo "$second is not numeric. Enter a numeric value."
fi
done

sum=$(awk "BEGIN {print $first + $second}")
difference=$(awk "BEGIN {print $first - $second}")
product=$(awk "BEGIN {print $first * $second}")
quotient=$(awk "BEGIN {print $first / $second}")

echo "$first + $second = $sum"
echo "$first - $second = $difference"
echo "$first * $second = $product"
echo "$first / $second = $quotient"
