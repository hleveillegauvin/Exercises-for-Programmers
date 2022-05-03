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
