#!/bin/sh

# Exercises for Programmers
# 20 - Multistate Sales Tax Calculator
# Written by: Hubert Léveillé Gauvin
# Date: 2 December 2017

# Create a tax calculator that handles multiple states and multiple counties within
# each state. The program prompts the user for the order amount and the state where the
# order will be shipped.

# For Wisconsin residents, prompt for the county of residence.

#	For Eau Claire county residents, add an additional 0.05 tax.
#	For Dunn county residents, add an additional 0.04 tax.

# Illinois residents must be charged 8% sales tax with no additional county-level charge.
# All other sates are not charged tax.

check_numeric_only_positive() {
# USE INSIDE LOOP
		if [[ $1 =~ ^([0-9]*[.])?[0-9]+$ ]]; then
		break
		else
		echo -e "\033[0;31m'$1' is not numeric.\033[0m"
		fi
}

orderamount() {
while read -p "What is the order amount? " order; do
	order=$(sed 's/[\$\ ,]//g'<<< $order) 	# Single quotes are needed here to preserve the literal value of the '$' character.
	check_numeric_only_positive $order
	done
}

whichstate(){
read -p "What state do you live in? " state
	if [[ $state =~ ([Ww]isconsin|[Ww][Ii]) ]]; then
		read -p "What county do you live in? " county
		if [[ $county =~ [Ee]au\ [Cc]laire ]]; then
		tax=0.05
		elif [[ $county =~ [Dd]unn ]]; then
		tax=0.04
		else
		tax=0
		fi
	elif [[ $state =~ ([Ii]llinois|[Ii][Ll]) ]]; then
	tax=0.08
	else
	tax=0
	fi
}

calculate(){
taxamount=$(awk "BEGIN { print ($order * $tax)}")
taxamount=$(printf "%.2f" $taxamount) # keeps 2 digits after the decimal point. 
total=$(awk "BEGIN { print ($order + $taxamount)}")
total=$(printf "%.2f" $total)  # keeps 2 digits after the decimal point.
}

printoutput(){
echo "The tax is \$"$taxamount"."
echo "The total is \$"$total"."
}


main(){
orderamount
whichstate
calculate
printoutput
}

main
