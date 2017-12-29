#!/bin/sh

# Exercises for Programmers
# 4 - Mad Lib
# Written by: Hubert Léveillé Gauvin
# Date: 17 December 2016

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story.

random_integer_between(){
# Generates a random number between two numbers
python -S -c "import random; print random.randint($1,$2)"
}

dice=$(random_integer_between 1 2) #Generate a random number between 1 and 2

if [ "$dice" == 1 ]; then
	funny="That's hilarious!"
else
	funny="That's crazy!"
fi

read -p "Enter a noun: " noun
read -p "Enter a verb: " verb
read -p "Enter an adjective: " adjective
read -p "Enter an adverb: " adverb
echo "Do you $verb your $adjective $noun $adverb? $funny"

