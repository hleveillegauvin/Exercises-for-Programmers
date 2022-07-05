// Exercises for Programmers
// 9 - Paint Calculator
// Written by : Hubert Léveillé Gauvin
// Date : 05 July 2022

// Calculate gallons of paint needed to paint the ceiling of a room. Prompt for the lengthand width, and assume one gallon covers 350 square feet. Display the numbers of gallons needed to paint the ceiling as a whole number.


#include <iostream>
#include <string>
#include <cmath>

using namespace std;


class room {
public:
    string nameOfRoom;
    float length{};
    float width{};

    float area() {
        return length * width;
    }
};


// Function Definition
int paintCalculator(float area);
float  repeatPromptIfUserInputIsNotFloat(string prompt);

// Main Method
int main()
{

    

    room myRoom;
    
    cout << "What room do you want to paint?: ";
    getline(cin,myRoom.nameOfRoom);
    myRoom.length = repeatPromptIfUserInputIsNotFloat("What is the length of your " + myRoom.nameOfRoom + " in feet? : ");
    myRoom.width = repeatPromptIfUserInputIsNotFloat("What is the width of your " + myRoom.nameOfRoom + " in feet? : ");

    cout << "You will need to purchase " << paintCalculator(myRoom.area()) << " to cover " << myRoom.area() << " square feet." << endl;
};


//Function Declaration
int paintCalculator(float area) {

    int gallons = ceil(area / 350);

    return gallons;
}


float  repeatPromptIfUserInputIsNotFloat(string prompt)
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


