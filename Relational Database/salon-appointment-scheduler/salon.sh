#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

# Define the range for available services
MIN_SERVICE_ID="$($PSQL "SELECT MIN(service_id) FROM services")"
MAX_SERVICE_ID="$($PSQL "SELECT MAX(service_id) FROM services")"

while [[ $SERVICE_ID_SELECTED -lt $MIN_SERVICE_ID || $SERVICE_ID_SELECTED -gt $MAX_SERVICE_ID ]]
do
	# List available services
	echo "$($PSQL "SELECT * FROM services")" | while IFS="|" read SERVICE_ID SERVICE
	do
		echo "$SERVICE_ID) $SERVICE"
	done

	# Read users selection
	read SERVICE_ID_SELECTED
	echo

	if [[ $SERVICE_ID_SELECTED -lt $MIN_SERVICE_ID || $SERVICE_ID_SELECTED -gt $MAX_SERVICE_ID ]]
	then
		# Request a valid service id
		echo "I could not find that service. What would you like today?"
	else
		# Set selected service name for later
		SERVICE_SELECTED="$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")"
	fi
done

# Request customer phone number
echo -e "What's your phone number?"

read CUSTOMER_PHONE


# Determine if customer already exists
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# If not found
if [[ -z $CUSTOMER_NAME ]]
then
	# Ask for customer name
	echo -e "\nI don't have a record for that phone number, what's your name?"
	
	read CUSTOMER_NAME

	# Add new customer
	INSERT_CUSTOMER_NAME=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
fi

# Ask customer for time
echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME?"

read SERVICE_TIME

# Get customer ID
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# Create new appointment
INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."