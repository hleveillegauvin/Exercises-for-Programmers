# Exercises for Programmers
# 2 - Counting the Number of Characters
# Written by: Hubert Léveillé Gauvin
# Date: 16 September 2018

# Create a program that prompts for an input and returns the number of characters.

$string = Read-Host 'What is the input string?'

if ($string.Length -eq 0){
Write-Host "Please enter a word."
}

Write-Host "$string has $($string.Length) characters."