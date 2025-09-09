#!/bin/bash

# Function to count files in current directory
function file_count() {
    echo $(ls -1 | wc -l)
}

# Store actual count
actual_count=$(file_count)

echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

# Loop until correct guess
while true
do
    read -p "Enter your guess: " guess

    if [[ ! $guess =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        continue
    fi

    if [ $guess -lt $actual_count ]; then
        echo "Too low! Try again."
    elif [ $guess -gt $actual_count ]; then
        echo "Too high! Try again."
    else
        echo "🎉 Congratulations! You guessed it right."
        echo "There are $actual_count files in the current directory."
        break
    fi
done
