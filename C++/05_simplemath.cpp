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
