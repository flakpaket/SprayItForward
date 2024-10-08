#!/bin/bash
# First generated by ChatGPT, prompted by flakpaket (Jon Gorenflo): 
# https://chatgpt.com/share/66e99771-dab8-800b-bc77-6f519f230a61

# Initialize variable for minimum password length with a default value
MIN_PASSWORD_LENGTH=8

# Parse named parameters
while [ $# -gt 0 ]; do
    case "$1" in
        --min-password-length|-m)
            MIN_PASSWORD_LENGTH="$2"
            shift 2
            ;;
        --help|-h)
            echo "Usage: $0 [options]"
            echo "Options:"
            echo "  -m, --min-password-length  Set the minimum password length (default: 8)"
            echo "  -h, --help                 Display this help message"
            exit 0
            ;;
        *)
            echo "Unknown parameter: $1"
            echo "Use -h or --help for usage information."
            exit 1
            ;;
    esac
done

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

# Function to generate passwords based on a season and year with min 8 chars
generate_passwords() {
    SEASON=$1
    COMBINATIONS=(
        "${SEASON}${YEAR_SHORT}"
        "${SEASON}${YEAR}"
        "${SEASON}${YEAR_SHORT}!"
        "${SEASON}${YEAR}!"
    )

    for COMBINATION in "${COMBINATIONS[@]}"; do
        if [ ${#COMBINATION} -ge ${MIN_PASSWORD_LENGTH} ]; then
            echo "$COMBINATION"
        fi
    done
}

# Generate passwords in order of likelihood based on the current month
if [ "$MONTH" -eq 3 ] || [ "$MONTH" -eq 6 ] || [ "$MONTH" -eq 9 ] || [ "$MONTH" -eq 12 ]; then
    # For March, June, September, and December, list the previous season first
    generate_passwords "$PREVIOUS_SEASON"
    if [ "$PREVIOUS_SEASON" == "Autumn" ]; then
        generate_passwords "$PREVIOUS_SEASON_FALL"
    fi
    generate_passwords "$CURRENT_SEASON"
    if [ "$CURRENT_SEASON" == "Autumn" ]; then
        generate_passwords "$CURRENT_SEASON_FALL"
    fi
else
    # For other months, list the current season first, then the next season
    generate_passwords "$CURRENT_SEASON"
    if [ "$CURRENT_SEASON" == "Autumn" ]; then
        generate_passwords "$CURRENT_SEASON_FALL"
    fi
    generate_passwords "$NEXT_SEASON"
    if [ "$NEXT_SEASON" == "Autumn" ]; then
        generate_passwords "$NEXT_SEASON_FALL"
    fi
fi
