// 03_printingquotes.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

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




// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
