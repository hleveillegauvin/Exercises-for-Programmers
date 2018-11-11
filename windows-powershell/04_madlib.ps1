# Exercises for Programmers
# 4 - Mad Lib
# Written by: Hubert Léveillé Gauvin
# Date: 11 November 2018

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story.

$noun = Read-Host "Enter a noun: "
$verb = Read-Host "Enter a verb: "
$adjective = Read-Host "Enter an adjective: "
$adverb = Read-Host "Enter an adverb: "

if ((Get-Random 2) -eq -0){
$funny = "That's hilarious"
}
else {
$funny = "That's crazy!"
}
write-host "`n"
Write-Host "Do you $verb your $adjective $noun $adverb`? $funny"