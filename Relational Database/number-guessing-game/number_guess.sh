#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Request username
echo -n "Enter your username: " 
read -n 22 USERNAME

# Check if user exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# If user not found
if [[ -z $USER_ID ]]
then
	# New users
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
	USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
	# Existing users
	GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id = '$USER_ID'")
	BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = '$USER_ID'")
	echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Initialise required variables
SECRET_NUMBER=$((1 + $RANDOM % 1000))
NUMBER_OF_GUESSES=1

echo -n "Guess the secret number between 1 and 1000: " 

while read USER_GUESS
do
	if [[ ! "$USER_GUESS" =~ ^[0-9]+$ ]]
	then
		# Invalid input
		echo "That is not an integer, guess again:"
	else
		if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
		then
			# Guess is too high
			echo -n "It's lower than that, guess again: "
			NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
		elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
		then
			# Guess is too low
			echo -n "It's higher than that, guess again: "
			NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
		elif [[ $USER_GUESS -eq $SECRET_NUMBER ]]
		then
			# Guess is correct
			echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
			
			# Insert details into databse
			GAME_RESULTS=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
			
			# Finish
			exit
		fi
	fi
done

