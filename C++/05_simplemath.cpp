// 05_simplemath.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <string>

// Function declaration
float repeatPromptIfUserInputIsNotFloat(std::string prompt);


// Main method
int main()
{
   
    
    float first;  
    float second;


    for (;;) {
        first = repeatPromptIfUserInputIsNotFloat("What is the first number?: ");
        if (first > 0) {
            break;
        }
        else { 
            std::cout << "Please enter a positive number." << std::endl; 
        }
    } 


    for (;;) {
        second = repeatPromptIfUserInputIsNotFloat("What is the second number?: ");
        if (second > 0) {
            break;
        }
        else {
            std::cout << "Please enter a positive number." << std::endl;
        }
    }

   
    std::cout << first << "+" << second << "=" << first + second << std::endl;
    std::cout << first << "-" << second << "=" << first - second << std::endl;
    std::cout << first << "*" << second << "=" << first * second << std::endl;
    
    if (second == 0) { 
        std::cout << "Can't divide by zero." << std::endl;
    }
    else {
        std::cout << first << "/" << second << "=" << first / second << std::endl;
    }

    return 0;
}


// Function definition
float  repeatPromptIfUserInputIsNotFloat(std::string prompt)
{
    float num;

    //executes loop if the input fails (e.g., no characters were read)
    while (std::cout << prompt && (!(std::cin >> num) )) {
        std::cin.clear(); //clear bad input flag
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); //discard input
        std::cout << "Invalid input; please re-enter.\n";
    }
    return num;
}




// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
