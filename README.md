# File Organizer Scripts

This repository provides scripts in Bash, Python, and VBScript to help you automatically organize files within a directory. All scripts categorize files by moving them into subdirectories based on predefined categories.

## Common Features

All scripts in this repository share the following core functionality:

*   **Category-Based Organization**: Files are moved into folders named after specific categories.
*   **Standard Categories**: The scripts use the following predefined categories:
    *   **Photos**: `jpg`, `jpeg`, `png`, `gif`, `heic`, `raw`, `svg`, `bmp`, `tiff`
    *   **Videos**: `mp4`, `mov`, `avi`, `mkv`, `wmv`, `flv`, `webm`
    *   **Music**: `mp3`, `wav`, `aac`, `flac`, `ogg`, `m4a`
    *   **Documents**: `pdf`, `doc`, `docx`, `xls`, `xlsx`, `ppt`, `pptx`, `txt`, `odt`, `rtf`, `csv`
    *   **Archives**: `zip`, `rar`, `tar`, `gz`, `7z`, `bz2`
    *   **Ebooks**: `epub`, `mobi`, `azw`, `azw3`
    *   **Scripts**: `sh`, `py`, `js`, `rb`, `php`, `pl`, `bat` (each script will avoid moving itself)
*   **"Other" Directory**: Any files not matching the extensions in the defined categories, or files without any extension, will be moved into an `Other` directory.
*   **Current Directory Operation**: The scripts organize files in the directory where they are located.
*   **Self-Preservation**: Each script is designed to avoid moving itself.
*   **Automatic Folder Creation**: Category folders (e.g., `Photos`, `Documents`, `Other`) are created automatically if they don't already exist.

---

## Bash Script (`organize_files.sh`)

This script is designed for Unix-like environments (Linux, macOS).

### How to Use (`organize_files.sh`)

1.  **Place the Script**: Copy or move `organize_files.sh` into the directory with files you want to organize.
2.  **Make it Executable**: Open your terminal, navigate to the directory, and run:
    ```bash
    chmod +x organize_files.sh
    ```
3.  **Run the Script**: Execute from the same directory:
    ```bash
    ./organize_files.sh
    ```
The script will then scan and move files according to the "Common Features" described above.

---

## Python Script (`organize_files.py`)

This script provides a cross-platform solution for file organization, suitable for any system with Python installed.

### Prerequisites (`organize_files.py`)

*   **Python Installation**: Python 3 is recommended.
*   **Standard Libraries**: Uses only standard Python libraries (`os`, `shutil`), so no additional packages are needed.

### How to Use (`organize_files.py`)

1.  **Place the Script**: Copy or move `organize_files.py` into the directory with files to organize.
2.  **Run the Script**: Open your terminal or command prompt, navigate to the directory, and run:
    ```bash
    python organize_files.py
    ```
    or, if you have multiple Python versions, you might need:
    ```bash
    python3 organize_files.py
    ```
The script will output the actions it takes (files moved, skipped) to the console and organize files as per the "Common Features".

---

## VBScript (`organize_files.vbs`)

This script is designed for Windows environments and uses the Windows Script Host.

### Prerequisites (`organize_files.vbs`)

*   **Windows Environment**: Runs on Windows operating systems.
*   **Windows Script Host (WSH)**: Enabled by default on Windows.

### How to Use (`organize_files.vbs`)

1.  **Place the Script**: Copy or move `organize_files.vbs` into the directory with files to organize.
2.  **Run the Script**:
    *   **Double-click**: Simply double-click the `organize_files.vbs` file. This will run the script, but you might not see any output messages.
    *   **Command Line (Recommended)**: For better feedback (to see `WScript.Echo` messages about files being moved or errors), open Command Prompt, navigate to the directory, and run:
        ```bash
        cscript organize_files.vbs
        ```
The script will organize files according to the "Common Features".

---

**Important Note**: Always be cautious when running scripts that modify your file system. It's a good idea to **back up important files** before organizing them, or test any of these scripts in a directory with sample files first.
