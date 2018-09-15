#!/bin/bash

# Exercises for Programmers
# 11 - Currency Conversion
# Written by: Hubert Léveillé Gauvin
# Date: 26 July 2017

# Write a program that converts currency.

check_dependency(){
if command -v $1 >/dev/null 2>&1 ; then
:
else
    echo -e "\033[0;31m'$1': command not found.\033[0m"
    exit
fi
}

check_dependency jq

rate=$(curl -s "http://api.fixer.io/latest?base=USD" | jq '.rates.CAD') #Get current USD/CAD from the fixer.io API.

read -p "How many USD are you exchanging? " USD

CAD=$(awk "BEGIN {print $USD * $rate}")

echo "$USD USD at an exchange rate or $rate is $(printf "%.2f\n" $rate) CAD." #printf "%.2f\n" $rate rounds up $rate  to 2 decimal places
