# File Organizer Script

## Description

This script, `organize_files.sh`, automatically organizes files within the directory where it is located. It categorizes files by moving them into subdirectories named after their respective file extensions. For files that do not have an extension, it moves them into a dedicated directory named `no_extension`.

## How to Use

1.  **Place the Script**: Copy or move the `organize_files.sh` script into the directory containing the files you wish to organize.
2.  **Make it Executable**: If you haven't already, you'll need to give the script execution permissions. Open your terminal, navigate to the directory where the script is, and run:
    ```bash
    chmod +x organize_files.sh
    ```
3.  **Run the Script**: Execute the script from the same directory by running:
    ```bash
    ./organize_files.sh
    ```

The script will then:
*   Scan all files in the current directory (excluding itself).
*   Create new subdirectories for each unique file extension found (e.g., `jpg`, `pdf`, `txt`).
*   Move each file into the subdirectory corresponding to its extension.
*   Move any files without a discernible extension into a subdirectory named `no_extension`.

**Note**: Always be cautious when running scripts that modify your file system. It's a good idea to back up important files before organizing them, or test the script in a directory with sample files first.
