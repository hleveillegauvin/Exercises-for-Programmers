// Exercises for Programmers
// 2 - Counting the Number of Characters
// Written by : Hubert Léveillé Gauvin
// Date : 29 April 2022

// Create a program that prompts for an input and returns the number of characters.


#include <iostream>
#include <string>

int main() {
    std::string inputString; 
 
    do {
        std::cout << "What is the input string?: ";
        std::getline(std::cin, inputString);
    
        if (inputString.length() == 0) {
            std::cout << "Input string must be at least 1 character. Please try again." << std::endl;
        }


    } while (inputString.length() == 0); // repeat if length is 0


    std::cout << "The string \"" << inputString << "\" has " << inputString.length() << " characters." << std::endl;
    return 0;

}
