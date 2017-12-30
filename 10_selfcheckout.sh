#!/bin/sh

# Exercises for Programmers
# 10 - Self-Checkout
# Written by: Hubert Léveillé Gauvin
# Date: 10 August 2017

# Create a simple self-checkout system. Prompt for the prices and quantities of three items. Calculate the tax using a tax rate of 5.5%. Print out the line itmes with the quantity and total, and then print out the subtotal, tax amount, and total.

check_numeric_only_positive() {
### Checks if input is a numeric value e.g. 1, -1, 2.0, etc
# USE INSIDE LOOP
		if [[ $1 =~ ^([0-9]*[.])?[0-9]+$ ]]; then
		break
		else
		echo -e "\033[0;31m'$1' is not numeric.\033[0m"
		fi
}

check_whole_number() {
### Checks if input is a whole number i.e. {0, 1, 2, ...}
# USE INSIDE LOOP
if [[ "$1" =~ ^[0-9]+$ ]]; then
break
else
echo -e "\033[0;31m'$1' is not a valid number.\033[0m"
fi
}

subtotal=0

for i in {1..3}
do
while read -p "Enter the price of item $i: $" price; do
check_numeric_only_positive $price
	done


while read -p "Enter the quantity of item $i: " quantity; do
check_whole_number $quantity
	done

subtotal=$(awk "BEGIN {print $subtotal + ($price * $quantity)}")
done

subtotal_clean=$(printf "%0.2f\n" $subtotal)
tax=$(awk "BEGIN {print $subtotal * 0.055}")
tax_clean=$(printf "%0.2f\n" $tax)
total=$(awk "BEGIN {print $subtotal + $tax}")
total_clean=$(printf "%0.2f\n" $total)

echo "Subtotal: \$$subtotal_clean"
echo "Tax: \$$tax_clean"
echo "Total: \$$total_clean"