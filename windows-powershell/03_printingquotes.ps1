# Exercises for Programmers
# 3 - Printing Quotes
# Written by: Hubert Léveillé Gauvin
# Date: 11 November 2018

# Create a program that prompts for a quote and an author. Display the quotation using quotation marks.

$quote = Read-Host 'What is the quote? '
$who = Read-Host 'Who said it? '
Write-Host "$who says, `"$quote`""