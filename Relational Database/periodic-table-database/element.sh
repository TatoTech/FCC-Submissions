#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Determine if argument has been provided
if [[ $1 == "" ]]
then
	echo "Please provide an element as an argument."
else
	# Determine if numeric or text value
	if [[ $1 =~ ^[0-9]+$ ]]
	then
		ELEMENT_ATOMIC_NUMBER="$1"
	else
    	# Determine if symbol or name
    	if [[ ${#1} -le 2 ]]
		then
			ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
		else    		
			ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
		fi
	fi
	ELEMENT_EXISTS=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$ELEMENT_ATOMIC_NUMBER'")

	if [[ -z "$ELEMENT_EXISTS" ]]
	then
		echo "I could not find that element in the database."
	else		
		ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$ELEMENT_ATOMIC_NUMBER'")
		ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$ELEMENT_ATOMIC_NUMBER'")
		ELEMENT_TYPE=$($PSQL "SELECT type FROM properties WHERE atomic_number = '$ELEMENT_ATOMIC_NUMBER'")
		ELEMENT_ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$ELEMENT_ATOMIC_NUMBER'")
		ELEMENT_MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$ELEMENT_ATOMIC_NUMBER'")
		ELEMENT_BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$ELEMENT_ATOMIC_NUMBER'")

		echo "The element with atomic number $ELEMENT_ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a nonmetal, with a mass of $ELEMENT_ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
	fi	
fi