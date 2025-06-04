#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
MIN=1
MAX=1000
RANDOM_NUMBER=$(( $RANDOM % (MAX - MIN + 1) + MIN ))
NUMBER_OF_GUESSES=0
USER_GUESS=0

RANDOM_NUMBER=3
echo -e "\nEnter your username:"
read USERNAME

echo "Welcome, $USERNAME! It looks like this is your first time here."
echo -e "\nGuess the secret number between 1 and 1000:"

while [[ $USER_GUESS -ne $RANDOM_NUMBER ]]
do
  read USER_GUESS
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
  if [[ !  $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $USER_GUESS == $RANDOM_NUMBER ]]
  then
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice Job!"
    # store the number of guesses if its best game and increment number of games played
  fi
done

