#!/bin/sh

# Exercises for Programmers
# 13 - Determining Compound Interest
# Written by: Hubert Léveillé Gauvin
# Date: 10 August 2017

# Write a program that compute simple interest. Prompt for the principal amount, the rate as a percentage, and the time, and display the amount accrued (principal + interest)

check_numeric_only_positive() {
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


while read -p "Enter the principal: " principal; do
check_numeric_only_positive $principal
done


while read -p "Enter the rate of interest (in %): " rate_percentage; do
check_numeric_only_positive $rate_percentage
done	

while read -p "Enter the number of years: " years; do
check_whole_number $years
	done	

while read -p "Enter the number of times the interest is compounded per year: " timesperyear; do
check_whole_number $timesperyear
	done	

amount=0

rate=$(awk "BEGIN {print $rate_percentage / 100}")

for i in $(seq 1 $years); do
	for j in $(seq 1 $timesperyear); do
	amount=$(awk "BEGIN {print $principal * (1 + ($rate / $j)) ** ($j * $i)}")
	amount_clean=$(printf "%0.2f" $amount)
	done

echo
echo "After $i year(s) at $rate_percentage%, the investment will be worth \$$amount_clean"
done

### Comparing to Simple Interest

simpleinterest_amount=0

simpleinterest_rate=$(awk "BEGIN {print $rate_percentage / 100}")

for k in $(seq 1 $years); do
amount=$(awk "BEGIN {print $principal * (1 +$rate * $k)}")
simpleinterest_amount_clean=$(printf "%0.2f" $amount)
done

difference=$(awk "BEGIN {print $amount_clean - $simpleinterest_amount_clean}")

echo
echo "By using compound interest rather than simple inteterest, you made an extra \$$difference. Congratulations!"

echo
