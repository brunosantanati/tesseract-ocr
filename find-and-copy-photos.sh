#!/bin/bash

# Set the directory containing photos (replace with your actual path)
photo_dir=$2

# Specify the word to search for
search_word=$1
destination=$3

# Check if Tesseract is installed
if ! command -v tesseract &> /dev/null; then
  echo "Error: Tesseract is not installed. Please install Tesseract before running this script."
  exit 1
fi

# Loop through all files in the directory
for file in "$photo_dir"/*.jpg; do
  # Check if it's a regular file (not a directory or hidden file)
  if [[ -f "$file" ]]; then

    # Use Tesseract to perform OCR and store the output in a variable
    text=$(tesseract "$file" stdout --dpi 2400 | tr '\n' ' ')  # Remove newlines and convert to space-separated words

    # Search for the word "Conquista" (case-insensitive)
    if grep -qi "$search_word" <<< "$text"; then
      echo "Found '$search_word' in: $file"
      if [[ ! -d "$destination" ]]; then
        # Create the folder using mkdir with the -p (parents) option
        mkdir -p "$destination"
        echo "Folder '$destination' created!"
      fi
      cp "$file" "$destination"
    fi
  fi
done

