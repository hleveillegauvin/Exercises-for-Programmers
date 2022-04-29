// Exercises for Programmers
// 3 - Printing Quotes
// Written by : Hubert Léveillé Gauvin
// Date : 29 April 2022

// Create a program that prompts for a quoteand an author.Display the quotation using quotation marks.


#include <iostream>
#include <string>

// Function declaration
std::string repeatPromptIfUserInputEmpty(std::string prompt);

// The main method
int main()
{
    std::string quote;
    std::string author;

    quote = repeatPromptIfUserInputEmpty("What is the quote?: ");
    author = repeatPromptIfUserInputEmpty("Who said it?: ");

    std::cout << author << " says, \"" << quote << "\"" << std::endl;

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
