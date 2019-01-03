# Exercises for Programmers
# 7 - Area of a Rectangular Room
# Written by: Hubert Léveillé Gauvin
# Date: 9 May 2017

# Create a program that calculates the area of a room. Prompt the user for the length and width of the room in feet. Then display the area in both square feet and square meters.

While ($length = (Read-Host -Prompt "What is the length of the room in feet?")) {
    if ( ($length -as [double]) -eq $null) { Write-Warning -Message "Please enter a numeric value." }
    else { break }
}	

While ($width = (Read-Host -Prompt "What is the width of the room in feet?")) {
    if ( ($width -as [double]) -eq $null) { Write-Warning -Message "Please enter a numeric value." }
    else { break }
}	

$length = [double]$length
$width = [double]$width

$areafeet = $length * $width
$areameter = [math]::Sqrt([math]::pow( $length, 2 ) * 0.09290304) * [math]::Sqrt([math]::pow( $width, 2) * 0.09290304)


Write-Host "You entered dimensions of $length feet by $width feet."
Write-Host "The area is: "
Write-Host "$areafeet square feet"
Write-Host "$areameter square meters"