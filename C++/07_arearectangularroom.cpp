// Exercises for Programmers
// 7 - Area of a Rectangular Room
// Written by : Hubert Léveillé Gauvin
// Date : 27 June 2022

// Create a program that calculates the area of a room. Prompt the user for the lengthand width of the room in feet. Then display the area in both square feet and square meters.


#include <iostream>
#include<cmath>


// Function Declaration
float repeatPromptIfUserInputIsNotFloat(std::string prompt);
float convertFeetToMeters(float feet);

// Main Method
int main()
{
    float firstNum;
    float secondNum;
    float meterSquared;

    for (;;) {
        firstNum = repeatPromptIfUserInputIsNotFloat("What is the length of the room in feet?: ");
        if (firstNum > 0) {
            break;
        }
        else {
            std::cout << "Please enter a positive number." << std::endl;
        }
    }

    for (;;) {
        secondNum = repeatPromptIfUserInputIsNotFloat("What is the length of the room in feet?: ");
        if (secondNum > 0) {
            break;
        }
        else {
            std::cout << "Please enter a positive number." << std::endl;
        }
    }
    
    std::cout << "You entered dimensions of " << firstNum << " feet by " << secondNum << " feet." << std::endl;
    std::cout << "The area is:" << std::endl;
    std::cout << (firstNum * secondNum) << " square feet." << std::endl;
    std::cout << (convertFeetToMeters(firstNum) * convertFeetToMeters(secondNum)) << " square meters." << std::endl;
}

// Function Definition
float  repeatPromptIfUserInputIsNotFloat(std::string prompt)
{
    float num;

    //executes loop if the input fails (e.g., no characters were read)
    while (std::cout << prompt && (!(std::cin >> num))) {
        std::cin.clear(); //clear bad input flag
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); //discard input
        std::cout << "Invalid input; please re-enter.\n";
    }
    return num;
}

float convertFeetToMeters(float feet)
{
   
    float meter;

    meter = sqrt(pow(feet, 2) * 0.09290304);
    return meter;
}