#!/bin/bash

# Ensure script has executable permissions
# chmod +x salon.sh

# Function to display services with numbers
display_services() {
    echo "Services offered:"
    psql -U freecodecamp -d salon -c "SELECT service_id, name FROM services" | awk '{print $1")", $2}'
}

# Display services with numbers
display_services

# Prompt for service selection
while true; do
    read -p "Enter the service number you'd like: " SERVICE_ID_SELECTED
    if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
        service_count=$(psql -U freecodecamp -d salon -t -c "SELECT COUNT(*) FROM services WHERE service_id=$SERVICE_ID_SELECTED")
        if [ $service_count -eq 0 ]; then
            echo "Invalid service number. Please try again."
            display_services
        else
            break
        fi
    else
        echo "Invalid input. Please enter a number."
    fi
done

# Prompt for customer phone number
while true; do
    read -p "Enter your phone number: " CUSTOMER_PHONE
    customer_count=$(psql -U freecodecamp -d salon -t -c "SELECT COUNT(*) FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [ $customer_count -eq 0 ]; then
        read -p "Enter your name: " CUSTOMER_NAME
        psql -U freecodecamp -d salon -c "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
        break
    else
        break
    fi
done

# Prompt for appointment time
read -p "Enter appointment time: " SERVICE_TIME

# Insert appointment into appointments table
psql -U freecodecamp -d salon -c "INSERT INTO appointments (customer_id, service_id, time) SELECT customer_id, $SERVICE_ID_SELECTED, '$SERVICE_TIME' FROM customers WHERE phone='$CUSTOMER_PHONE'"

# Display confirmation message
CUSTOMER_NAME=$(psql -U freecodecamp -d salon -t -c "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
SERVICE_NAME=$(psql -U freecodecamp -d salon -t -c "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
