import os
import shutil

CATEGORIES = {
    "Photos": ["jpg", "jpeg", "png", "gif", "heic", "raw", "svg", "bmp", "tiff"],
    "Videos": ["mp4", "mov", "avi", "mkv", "wmv", "flv", "webm"],
    "Music": ["mp3", "wav", "aac", "flac", "ogg", "m4a"],
    "Documents": ["pdf", "doc", "docx", "xls", "xlsx", "ppt", "pptx", "txt", "odt", "rtf", "csv"],
    "Archives": ["zip", "rar", "tar", "gz", "7z", "bz2"],
    "Ebooks": ["epub", "mobi", "azw", "azw3"],
    "Scripts": ["sh", "js", "rb", "php", "pl", "bat"], # .py will be handled by self-skip
    # "Other" is the default
}

def organize_files():
    current_dir = os.getcwd()
    script_name = os.path.basename(__file__)

    print(f"Organizing files in: {current_dir}")
    print(f"Script name: {script_name}")

    for item_name in os.listdir(current_dir):
        item_path = os.path.join(current_dir, item_name)

        # Skip the script itself and any directories
        if item_name == script_name:
            print(f"Skipping script: {item_name}")
            continue
        if not os.path.isfile(item_path):
            print(f"Skipping directory: {item_name}")
            continue

        # Get file extension
        _, extension_with_dot = os.path.splitext(item_name)
        extension = extension_with_dot.lower().lstrip('.')

        target_category = "Other" # Default category

        if not extension: # No extension
            target_category = "Other"
        else:
            for category, extensions_list in CATEGORIES.items():
                if extension in extensions_list:
                    target_category = category
                    break
        
        # Create category directory if it doesn't exist
        category_dir_path = os.path.join(current_dir, target_category)
        os.makedirs(category_dir_path, exist_ok=True)

        # Move the file
        destination_path = os.path.join(category_dir_path, item_name)
        try:
            shutil.move(item_path, destination_path)
            print(f"Moved '{item_name}' to '{target_category}/'")
        except Exception as e:
            print(f"Error moving '{item_name}': {e}")

    print("File organization complete.")

if __name__ == "__main__":
    organize_files()
