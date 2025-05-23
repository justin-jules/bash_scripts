# File Organizer Script

## Description

This script, `organize_files.sh`, automatically organizes files within the directory where it is located. It categorizes files by moving them into subdirectories based on predefined **categories**. For files that do not fit into any defined category or lack an extension, it moves them into a dedicated directory named `Other`.

## File Categories

The script uses the following predefined categories to organize files:

*   **Photos**:
    *   Extensions: `jpg`, `jpeg`, `png`, `gif`, `heic`, `raw`, `svg`, `bmp`, `tiff`
*   **Videos**:
    *   Extensions: `mp4`, `mov`, `avi`, `mkv`, `wmv`, `flv`, `webm`
*   **Music**:
    *   Extensions: `mp3`, `wav`, `aac`, `flac`, `ogg`, `m4a`
*   **Documents**:
    *   Extensions: `pdf`, `doc`, `docx`, `xls`, `xlsx`, `ppt`, `pptx`, `txt`, `odt`, `rtf`, `csv`
*   **Archives**:
    *   Extensions: `zip`, `rar`, `tar`, `gz`, `7z`, `bz2`
*   **Ebooks**:
    *   Extensions: `epub`, `mobi`, `azw`, `azw3`
*   **Scripts**:
    *   Extensions: `sh`, `py`, `js`, `rb`, `php`, `pl`, `bat`
*   **Other**:
    *   Any files not matching the extensions in the categories above, or files without any extension, will be moved into an `Other` directory.

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
*   Create new subdirectories for each category (e.g., `Photos`, `Documents`, `Other`) if they don't already exist.
*   Move each file into the subdirectory corresponding to its determined category.

**Note**: Always be cautious when running scripts that modify your file system. It's a good idea to back up important files before organizing them, or test the script in a directory with sample files first.
