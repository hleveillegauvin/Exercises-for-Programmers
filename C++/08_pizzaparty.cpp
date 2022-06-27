// Exercises for Programmers
// 8 - Pizza Party
// Written by : Hubert Léveillé Gauvin
// Date : 27 June 2012

// Write a program to evenly divide pizzas.Prompt for the number of people, the number of pizzas, and the number of slices per pizza. Ensure that the number of pieces comes out even. Display the number of pieces of pizza each person should get.If there are leftovers, show the number of leftover pieces.


#include <iostream>
#include<cmath>

// Function Declaration
int IsWholePositive(float number);
float  repeatPromptIfUserInputIsNotFloat(std::string prompt);

// Main Method
int main()
{

    float people;
    float pizza;
    float slices;
    std::string peopleWord;
    std::string pizzaWord;
    std::string slicesWord;
    std::string toBe;



    for (;;) {
        people = repeatPromptIfUserInputIsNotFloat("How many people?: ");
        if (IsWholePositive(people) == 0) {
            break;
        }
        else {
            std::cout << "Please enter a positive whole number." << std::endl;
        }

    }

    for (;;) {
        pizza = repeatPromptIfUserInputIsNotFloat("How many pizzas do you have?: ");
        if (IsWholePositive(pizza) == 0) {
            break;
        }
        else {
            std::cout << "Please enter a positive whole number." << std::endl;
        }

    }

    for (;;) {
        slices = repeatPromptIfUserInputIsNotFloat("How many slices per pizza?: ");
        if (IsWholePositive(slices) == 0) {
            break;
        }
        else {
            std::cout << "Please enter a positive whole number." << std::endl;
        }

    }

    int ipeople = people; // Casting
    int ipizza = pizza;
    int islices = slices;


    if (people > 1) {
        peopleWord = "people";
    }
    else {
        peopleWord = "person";
    }

    if (slices > 1) {
        slicesWord = "slices";
    }
    else {
        slicesWord = "slice";
    }
    
    if (pizza > 1) {
        pizzaWord = "pizzas";
    }
    else {
        pizzaWord = "pizza";
    }

    if (ipizza * islices % ipeople > 1) {
        toBe = "are";
    }
    else {
        toBe = "is";
    }



    std::cout << people << " " << peopleWord << " with " << pizza << " " << pizzaWord << "." << std::endl;
    std::cout << "Each person gets " << floor((pizza * slices) / people) << " " << slicesWord << " of pizza." << std::endl;
    std::cout << "There " << toBe << " "  << ipizza * islices % ipeople << " leftover " << slicesWord << "." << std::endl;

}

// Function Definition
int IsWholePositive(float number) 
{
    if (floor(number) == number && number >= 0)
        return 0;
    else
        return 1;
}


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
