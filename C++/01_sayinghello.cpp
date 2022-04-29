// Exercises for Programmers
// 1 - Saying Hello
// Written by : Hubert Léveillé Gauvin
// Date : 29 April 2022

// Create a program that prompts for your name and prints a greeting using your name.


#include <iostream>
#include <string>

int main(){
    std::string name;
    
    std::cout << "What is your name?" << std::endl;
    std::getline (std::cin, name);
    std::cout << "Hello " << name << ", nice to meet you!";
}
