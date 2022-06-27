

// Exercises for Programmers
// 6 - Retirement Calculator
// Written by : Hubert Léveillé Gauvin
// Date : 27 June 2022

// Create a program that determines how many years you have left until retirement and the year you can retire.


#include <iostream>
#include <string>
#include <ctime>

// Function declaration
float repeatPromptIfUserInputIsNotFloat(std::string prompt);
int getYear();

// Main Method
int main()
{

	float currentAge;
	float retirementAge;

	for (;;) {
		currentAge = repeatPromptIfUserInputIsNotFloat("What is your current age?: ");
		if (currentAge > 0) {
			break;
		}
		else {
			std::cout << "Please enter a positive number." << std::endl;
		}
	}

	for (;;) {
		retirementAge = repeatPromptIfUserInputIsNotFloat("At what age would you like to retire?: ");
		if (retirementAge > 0) {
			break;
		}
		else {
			std::cout << "Please enter a positive number." << std::endl;
		}
	}

	if ((retirementAge - currentAge) < 0) {
		std::cout << "You can already retire!";
	}
	else {
		
		int difference = (retirementAge - currentAge); // converting to int to round output

		std::cout << "You have " << difference << " years left until you can retire." << std::endl;
		std::cout << "It's " << getYear() << ", so you can retire in " << getYear() + difference << "." << std::endl;
	
	}

	



	return 0;
}

	// Function definition
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

	int getYear()
	{
		struct tm newtime;
		time_t now = time(0);
		localtime_s(&newtime, &now);
		int Year = 1900 + newtime.tm_year;
		return Year;
	}

