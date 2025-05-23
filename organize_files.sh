#!/bin/bash

# Create 'no_extension' directory if it doesn't exist
mkdir -p no_extension

# Iterate over all items in the current directory
for ITEM in *; do
  # Check if it's a regular file and not the script itself
  if [ -f "$ITEM" ] && [ "$ITEM" != "organize_files.sh" ]; then
    # Get the filename and extension
    FILENAME=$(basename -- "$ITEM")
    EXTENSION="${FILENAME##*.}"

    # Check if the file has an extension
    if [ "$FILENAME" = "$EXTENSION" ] || [ "$EXTENSION" = "" ]; then
      # No extension or empty extension, move to 'no_extension'
      mv -- "$ITEM" "no_extension/"
      echo "Moved $ITEM to no_extension/"
    else
      # File has an extension
      # Create directory for extension if it doesn't exist
      mkdir -p "$EXTENSION"
      # Move the file to the extension directory
      mv -- "$ITEM" "$EXTENSION/"
      echo "Moved $ITEM to $EXTENSION/"
    fi
  fi
done

echo "File organization complete."
