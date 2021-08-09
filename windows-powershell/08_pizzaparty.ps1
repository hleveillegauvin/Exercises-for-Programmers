# Exercises for Programmers
# 8 - Pizza Party
# Written by: Hubert Léveillé Gauvin
# Date: 9 August 2021

# Write a program to evenly divide pizzas. Prompt for the number of people, the number of pizzas, and the number of slices per pizza. Ensure that the number of pieces comes out even. Display the number of pieces of pizza each person should get. If there are leftovers, show the number of leftover pieces.

While ($true){
	try
	{
	[validateRange(0,[int]::MaxValue)] [int] $people = Read-Host "How many people?"
	break
	}
	catch
	{
    Write-Output "This is not a valid number."
	}
}

While ($true){
	try
	{
	[validateRange(0,[int]::MaxValue)] [int] $pizza = Read-Host "How many pizzas do you have?"
	break
	}
	catch
	{
    Write-Output "This is not a valid number."
	}
}

Write-Host ""
Write-Host "$people people with $pizza pizzas"

## 8 slices per pizza
$slicesPerPizza = 8
$slicesPerPerson = [Math]::floor(($pizza*$slicesPerPizza)/$people)
$slicesLeft = ($pizza*$slicesPerPizza)%$people

Write-Host "Each person gets $slicesPerPerson pieces of pizza"
Write-Host "There are $slicesLeft leftover pieces"
Write-Host ""
Read-Host "Press any key to exit "