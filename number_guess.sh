#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
MIN=1
MAX=1000
RANDOM_NUMBER=$(( $RANDOM % (MAX - MIN + 1) + MIN ))
NUMBER_OF_GUESSES=0
USER_GUESS=0

# Uncomment the next line to debug with a fixed number
# RANDOM_NUMBER=3
echo "Enter your username:"
read USERNAME

USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

if [[ -z $USERNAME_RESULT ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL);")
  GAMES_PLAYED=0
  BEST_GAME=
else
  # Existing user
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

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
  else

    # Update games played
    GAMES_PLAYED=$((GAMES_PLAYED + 1))
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME';")

    # Update best game if it's better or not set
    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME';")
    fi
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice Job!"

    break
  fi
done

