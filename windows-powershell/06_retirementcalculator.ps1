# Exercises for Programmers
# 6 - Retirement Calculator
# Written by: Hubert Léveillé Gauvin
# Date: 28 December 2018

# Create a program that determines how many years you have left until retirement and the year you can retire.

[int]$currentyear = get-date -Format yyyy

While ($age = (Read-Host -Prompt "What is your current age?")) {
    if ( ($age -as [int]) -eq $null) { Write-Warning -Message "Please enter a numeric value." }
    else { break }
}

While ($retirement = (Read-Host -Prompt "At what age would you like to retire?")) {
    if ( ($retirement -as [int]) -eq $null) { Write-Warning -Message "Please enter a numeric value." }
    else { break }
}

$age = [int]$age
$retirement = [int]$retirement

$yearsleft = $retirement - $age
$retirementyear = $currentyear + $yearsleft

# yearsleft=$(awk "BEGIN {print $retirement - $age}")
# retirementyear=$(awk "BEGIN {print $currentyear + $yearsleft}")

# Write-Host "It's $currentyear, so you can retire in $retirementyear."

switch($yearsleft) {
 {$_ -lt 0 } {"You can already retire!"}
 {$_ -eq 0} {"You can retire this year!"}
 {$_ -eq 1 } {"You can retire next year!"}
 {$_ -gt 1 } {"You have $yearsleft years left until you can retire."}
}
