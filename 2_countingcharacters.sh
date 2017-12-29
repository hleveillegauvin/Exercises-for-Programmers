#!/bin/sh

# Exercises for Programmers
# 2 - Counting the Number of Characters
# Written by: Hubert Léveillé Gauvin
# Date: 17 December 2016

# Create a program that prompts for an input and returns the number of characters..

while read -p "What is the input string? " input; 
do

	if [ -z "$input" ]; then	 #verify if $input is empty
	echo "Please enter a word."

	else

		count=$(printf $input | wc -m | awk {'print $1'}) 

# echo has a carriage return, which adds a character. Use printf instead. wc -m counts the number of characters, but the ouput is weird, with a long space followed by the number. We can use awk to print the first field ($1) of the wc output

# Alternatively, we can use the following syntax:

# count=$(printf $input | wc | awk {'print $3'}) 

# The standard wc output has 3 fields: number of lines, number of words, and number of characters. We can then use "awk {'print $3'}" to print the third field (i.e. number of characters.

			echo "$input has $count characters."
			exit		#only exit the while loop if the $input is not empty	
	fi

done

