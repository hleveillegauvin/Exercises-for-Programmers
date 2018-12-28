# Exercises for Programmers
# 5 - Simple Math
# Written by: Hubert Léveillé Gauvin
# Date: 28 December 2018

# Write a program that prompts for two numbers. Print the sum, difference, product, and quotient of those numbers.

While ($first = (Read-Host "What is the first number?")) {
    if ( ($first -as [double]) -eq $null) { Write-Host "Please enter a numeric value." }
    else { break }
}

While ($second = (Read-Host "What is the second number?")) {
    if ( ($second -as [double]) -eq $null) { Write-Host "Please enter a numeric value." }
    else { break }
}	

$first = [double]$first
$second = [double]$second


$sum = $first + $second
$difference = $first - $second
$product = $first * $second
$quotient = $first / $second

Write-Host "$first + $second = $sum" 
Write-Host "$first - $second = $difference" 
Write-Host "$first * $second = $product" 
Write-Host "$first / $second = $quotient" 

