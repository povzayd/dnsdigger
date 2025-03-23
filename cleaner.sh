#!/bin/bash

# Prompt user for input file
read -p "Enter the input text file: " input_file

# Check if the file exists
if [[ ! -f "$input_file" ]]; then
    echo "Error: File '$input_file' not found!"
    exit 1
fi

# Prompt user for output file name
read -p "Enter the output file name: " output_file

# Extract domain name pointers, remove trailing dots, and save to output file
grep -oP '(?<=pointer ).*' "$input_file" | sed 's/\.$//' > "$output_file"

# Print result message
echo "Extracted domains saved to '$output_file'"

