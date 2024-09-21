#!/bin/bash
# First generated by ChatGPT, prompted by flakpaket (Jon Gorenflo): 
# https://chatgpt.com/share/66e99771-dab8-800b-bc77-6f519f230a61

# Get the current month and year
MONTH=$(date +"%m")
YEAR=$(date +"%Y")
YEAR_SHORT=$(date +"%y")

# Determine the season based on the current month and set previous and next seasons
if [ "$MONTH" -ge 3 ] && [ "$MONTH" -le 5 ]; then
    CURRENT_SEASON="Spring"
    PREVIOUS_SEASON="Winter"
    NEXT_SEASON="Summer"
elif [ "$MONTH" -ge 6 ] && [ "$MONTH" -le 8 ]; then
    CURRENT_SEASON="Summer"
    PREVIOUS_SEASON="Spring"
    NEXT_SEASON="Autumn"
elif [ "$MONTH" -ge 9 ] && [ "$MONTH" -le 11 ]; then
    CURRENT_SEASON="Autumn"
    PREVIOUS_SEASON="Summer"
    NEXT_SEASON="Winter"
else
    CURRENT_SEASON="Winter"
    PREVIOUS_SEASON="Autumn"
    NEXT_SEASON="Spring"
fi

# Handle "Fall" as an alternative to "Autumn"
if [ "$CURRENT_SEASON" == "Autumn" ]; then
    CURRENT_SEASON_FALL="Fall"
fi
if [ "$PREVIOUS_SEASON" == "Autumn" ]; then
    PREVIOUS_SEASON_FALL="Fall"
fi
if [ "$NEXT_SEASON" == "Autumn" ]; then
    NEXT_SEASON_FALL="Fall"
fi

# Function to generate passwords based on a season and year
generate_passwords() {
    SEASON=$1
    echo "${SEASON}${YEAR_SHORT}"
    echo "${SEASON}${YEAR}"
    echo "${SEASON}${YEAR_SHORT}!"
    echo "${SEASON}${YEAR}!"
}

# Generate passwords for the current season
generate_passwords "$CURRENT_SEASON"
if [ "$CURRENT_SEASON" == "Autumn" ]; then
    generate_passwords "$CURRENT_SEASON_FALL"
fi

# Determine if we should generate passwords for the previous or next season
if [ "$MONTH" -eq 3 ] || [ "$MONTH" -eq 6 ] || [ "$MONTH" -eq 9 ] || [ "$MONTH" -eq 12 ]; then
    # For March, June, September, and December, the previous season is closer
    generate_passwords "$PREVIOUS_SEASON"
    if [ "$PREVIOUS_SEASON" == "Autumn" ]; then
        generate_passwords "$PREVIOUS_SEASON_FALL"
    fi
else
    # For other months, the next season is closer
    generate_passwords "$NEXT_SEASON"
    if [ "$NEXT_SEASON" == "Autumn" ]; then
        generate_passwords "$NEXT_SEASON_FALL"
    fi
fi