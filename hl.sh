#!/bin/bash

##########################################################################
#
# Patrick Tsai - PA3 - due 11/1/2019 8am
#
# The High Low program -
# 1. User thinks of a number between 1 and 100
# 2. Computer will choose a number halfway between 1 and 100
# 3. User types h if the computer's guess is higher than the number the user is thinking of
# 4. If computer's number is too low, the user will type l
# 5. Computer takes into account high and low guesses
# 6. And will eventually guess the correct number
# 7. When the computer guesses the correct answer, the user types c
#
# If user enters a numeric comand line argument
# Then the steps are the same, but the number from the commandline argument becomes
# the highest number the user can guess to.
#
##########################################################################

  # Set initial variable values for the low and the computer's guess
  low=1
  guessNumber=0

if [[ $# -eq 0 ]]
then
  # if the user has not entered any command line arguments, then set the high value to 100
  high=100
else
  # if the user has entered a command line argument, then set the argument as the high value
  high=$1
fi

 # Welcome message and some instructions
 echo "Welcome to High Low -"
 echo "Think of a number between $low and $high"
 echo "press any key after you have thought of it"
 echo "the computer will try to guess your number"
 echo "if the guess was incorrect high, type h"
 echo "if the guess was incorrect low, type l"
 echo "if the guess is correct, type c"

 read -n1 next  # This will wait for the user to think of number

while [[ $answer != "c" ]]
do
 # the following is a loop for making the guesses

 sum=$((high+low))
 middleGuess=$((sum/2))
 
 echo -e "\nThe Computer guesses: $middleGuess"
 read -n1 answer
 guessNumber=$((guessNumber+1))

 while [[ $answer != "h" ]] && [[ $answer != "l" ]]  && [[ $answer != "c" ]]
 do
  # Error Handling for invalid input
  echo -e "\nYou entered an Invalid choice"
  echo "Please enter 'h' for high, 'l' for low, or 'c' for correct:"
  read -n1 answer
 done 

 if [[ $answer == "h" ]]
 then
  # handling for a high guess change the 'high' variable to guess minus 1
  high=$((middleGuess-1))
 elif [[ $answer == "l" ]]
 then
  # handling for a low guess change the 'low' variable to guess plus 1
  low=$((middleGuess+1))
 elif [[ $answer == "c"  ]]
 then
  # if the user signifies a correct guess break out of the main while loop
   break
 fi

 # Check if the the user has given correct guess assignments, if not, exit the program
 if [[ $low -gt $high ]] || [[ $high -lt $low ]]
 then
  echo -e "\nYou are a cheater"
  echo "GOODBYE!"
  exit 1
 fi
 
done

# End by thanking the user and letting them know how many guesses it took the computer to guess their number
echo -e "\nYour Number Was $middleGuess"
echo "It took $guessNumber Guesses"
echo "Thanks for playing"
exit 1
