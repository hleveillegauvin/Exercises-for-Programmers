#!/bin/sh

# Exercises for Programmers
# 3 - Printing Quotes
# Written by: Hubert Léveillé Gauvin
# Date: 17 December 2016

# Create a program that prompts for a quote and an author. Display the quotation using quotation marks.

read -p "What is the quote? " quote
read -p "Who said it? " who
echo "$who says, \"$quote\""