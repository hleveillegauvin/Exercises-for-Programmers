#!/bin/sh

# Exercises for Programmers
# 14 - Tax Calculator
# Written by: Hubert Léveillé Gauvin
# Date: 12 August 2017

# Write a simple program to compute the tax on an order amount. The program should prompt for the order amount and the state. If the state is "WI," then the order must be charged 5.5% tax.

while read -p "What is the order amount? " amount; do

	if [[ $amount = *[[:digit:]]* ]]; then
 	:		# The no-op command in shell is :
	break	# if variable is numeric, break loop
	else
 	echo "$amount is not numeric. Enter a numeric value. "
	fi
	done

read -p "What is the state? " state

state_lowercase=$( echo $state | tr '[:upper:]' '[:lower:]')

	if [ $state_lowercase = "wi" ] || [ $state_lowercase = "wisconsin" ] ; then
	tax=0.055
	else
	tax=0
	fi

tax_amount=$(awk "BEGIN {print $amount * $tax}")

amount_clean=$(printf "%0.2f" $amount)
tax_amount_clean=$(printf "%0.2f" $tax_amount)

total=$(awk "BEGIN {print $amount + $tax_amount}")
total_clean=$(printf "%0.2f" $total)

echo
echo "The subtotal is \$$amount_clean."
echo "The tax is \$$tax_amount_clean."
echo "The total is \$$total_clean."	
	



