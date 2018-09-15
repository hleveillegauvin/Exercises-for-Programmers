#!/bin/bash

# Exercises for Programmers
# 15 - Password Validation
# Written by: Hubert Léveillé Gauvin
# Date: 13 August 2017

# Create a simple program that validates user login credentials.

# Dependencies:
#	o passwords.json

check_dependency_command(){
if command -v $1 >/dev/null 2>&1 ; then
:
else
    echo -e "\033[0;31m'$1': command not found.\033[0m"
    exit
fi
}

check_dependency_file(){ 
if [ -f "$1" ];
then
   :
else
   echo -e "\033[0;31mFile "$1" is missing.\033[0m" >&2
   exit
fi
}

check_dependency_command jq
check_dependency_file passwords.json


RED='\033[0;31m'
NC='\033[0m' # No Color

while read -p "What is your username?: " user; do

password=$(cat passwords.json | jq -r ".user_passwords.$user" ) #needs double quote to use shell variable

	if [[ "$password" != "null" ]]; then	#if the username does not exist, jq prints "null"
	:
	break
	else
	echo "$user is not a valid username."
	fi
	done

try=3

while read -sp "What is the password? " password_typed; do

	if [[ "$password" = "$password_typed" ]]; then
	echo
	echo "Welcome!"
	break
	else

	try=$(awk "BEGIN {print $try - 1 }")		
	echo
	echo "Wrong password."
		if [[ "$try" = 1 ]]; then
		echo -e "${RED}Warning: Last attempt.${NC}" #last
		elif [[ "$try" = 0 ]]; then
		echo "Too many attempts."
		break
		fi
	echo
	fi
	done
