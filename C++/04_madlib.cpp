// 04_madlib.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

// Exercises for Programmers
// 4 - Mad Lib
// Written by : Hubert Léveillé Gauvin
// Date : 02 May 2022

// Create a simple mad - lib program that prompts for a noun, a verb, an adverb, and an adjectiveand injects those into a story.


#include <iostream>
#include <string>
#include <sstream>

// Function declaration
std::string repeatPromptIfUserInputEmpty(std::string prompt);

// The main method
int main()
{

    std::string noun;
    std::string verb;
    std::string adjective;
    std::string adverb;
    std::stringstream outputString;

    noun = repeatPromptIfUserInputEmpty("Enter a noun: ");
    verb = repeatPromptIfUserInputEmpty("Enter a verb: ");
    adjective = repeatPromptIfUserInputEmpty("Enter an adjective: ");
    adverb = repeatPromptIfUserInputEmpty("Enter an adverb: ");

    outputString << "Do you " << verb << " your " << adjective << " " << noun << " " << adverb << "? That\'s hilarious!" << std::endl;

    std::cout << outputString.str();

    return 0;
}

// Function definition
std::string repeatPromptIfUserInputEmpty(std::string prompt)
{
    std::string answer;
    do
    {
        std::cout << prompt;
        std::getline(std::cin, answer);
        if (answer.length() == 0) {
            std::cout << "Input string must be at least 1 character. Please try again." << std::endl;
        }
    } while (answer.length() == 0);
    return answer;
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
