#!/bin/bash

# Define categories and their associated extensions
declare -A CATEGORIES
CATEGORIES=(
  [Photos]="jpg jpeg png gif heic raw svg bmp tiff"
  [Videos]="mp4 mov avi mkv wmv flv webm"
  [Music]="mp3 wav aac flac ogg m4a"
  [Documents]="pdf doc docx xls xlsx ppt pptx txt odt rtf csv"
  [Archives]="zip rar tar gz 7z bz2"
  [Ebooks]="epub mobi azw azw3"
  [Scripts]="sh py js rb php pl bat"
)

# Create 'Other' directory if it doesn't exist
mkdir -p "Other"

# Iterate over all items in the current directory
for ITEM in *; do
  # Check if it's a regular file and not the script itself
  if [ -f "$ITEM" ] && [ "$ITEM" != "organize_files.sh" ]; then
    FILENAME=$(basename -- "$ITEM")
    EXTENSION_FULL="${FILENAME##*.}"
    EXTENSION_LOWER=$(echo "$EXTENSION_FULL" | tr '[:upper:]' '[:lower:]')

    TARGET_DIR="Other" # Default target directory

    # Check if the file has an extension
    if [ "$FILENAME" = "$EXTENSION_FULL" ] || [ "$EXTENSION_FULL" = "" ]; then
      # No extension or empty extension
      TARGET_DIR="Other"
    else
      # File has an extension, try to find a category
      for CATEGORY_NAME in "${!CATEGORIES[@]}"; do
        for EXT in ${CATEGORIES[$CATEGORY_NAME]}; do
          if [ "$EXT" = "$EXTENSION_LOWER" ]; then
            TARGET_DIR="$CATEGORY_NAME"
            break 2 # Break out of both loops
          fi
        done
      done
    fi

    # Create target category directory if it doesn't exist
    mkdir -p "$TARGET_DIR"

    # Move the file to the target directory
    mv -- "$ITEM" "$TARGET_DIR/"
    echo "Moved $ITEM to $TARGET_DIR/"
  fi
done

echo "File organization complete."
