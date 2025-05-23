Option Explicit

Dim fso, currentFolder, scriptPath, scriptName
Dim filesEnum, fileItem, fileName, fileExt, fileExtLower
Dim categories, categoryKey, categoryExtensions, extArray, ext
Dim targetCategory, targetFolderPath

' Initialize FileSystemObject
Set fso = CreateObject("Scripting.FileSystemObject")

' Get current folder and script name
scriptPath = WScript.ScriptFullName
scriptName = WScript.ScriptName
currentFolder = fso.GetParentFolderName(scriptPath)

WScript.Echo "Organizing files in: " & currentFolder
WScript.Echo "Script name: " & scriptName

' Define Categories using Scripting.Dictionary
Set categories = CreateObject("Scripting.Dictionary")
categories.CompareMode = vbTextCompare ' Case-insensitive keys for category names if needed, not for extensions here

categories.Add "Photos", "jpg jpeg png gif bmp tiff"
categories.Add "Videos", "mp4 mov avi mkv wmv flv webm" ' Corrected flg to flv, added webm
categories.Add "Music", "mp3 wav aac ogg m4a"
categories.Add "Documents", "pdf doc docx xls xlsx ppt pptx txt rtf csv"
categories.Add "Archives", "zip rar tar gz 7z"
categories.Add "Ebooks", "epub mobi"
categories.Add "Scripts", "bat sh py js" ' vbs will be skipped by scriptName check

' Get files in the current folder
Set filesEnum = fso.GetFolder(currentFolder).Files

For Each fileItem In filesEnum
    fileName = fileItem.Name

    ' Skip the script itself
    If LCase(fileName) = LCase(scriptName) Then
        WScript.Echo "Skipping script: " & fileName
        Continue For
    End If
    
    ' Check if it's a file (though .Files collection should only return files)
    ' This is more of a safeguard if the source of items changes
    If Not fso.FileExists(fileItem.Path) Then
        WScript.Echo "Skipping non-file item (or already moved): " & fileName
        Continue For
    End If

    fileExt = fso.GetExtensionName(fileName)
    fileExtLower = LCase(fileExt)

    targetCategory = "Other" ' Default category

    If fileExtLower = "" Then
        targetCategory = "Other"
    Else
        For Each categoryKey In categories.Keys
            categoryExtensions = categories(categoryKey)
            extArray = Split(categoryExtensions, " ")
            For Each ext In extArray
                If ext = fileExtLower Then
                    targetCategory = categoryKey
                    Exit For ' Exit inner loop (extensions)
                End If
            Next
            If targetCategory <> "Other" And targetCategory = categoryKey Then
                Exit For ' Exit outer loop (categories)
            End If
        Next
    End If

    ' Create category folder if it doesn't exist
    targetFolderPath = fso.BuildPath(currentFolder, targetCategory)
    If Not fso.FolderExists(targetFolderPath) Then
        fso.CreateFolder targetFolderPath
        WScript.Echo "Created folder: " & targetFolderPath
    End If

    ' Move the file
    On Error Resume Next ' Basic error handling for MoveFile
    fso.MoveFile fileItem.Path, fso.BuildPath(targetFolderPath, fileName)
    If Err.Number <> 0 Then
        WScript.Echo "Error moving '" & fileName & "'. It might be in use or locked. Error: " & Err.Description
        Err.Clear
    Else
        WScript.Echo "Moved '" & fileName & "' to '" & targetCategory & "/'"
    End If
    On Error GoTo 0 ' Disable error handling

Next

WScript.Echo "File organization complete."

' Clean up
Set filesEnum = Nothing
Set categories = Nothing
Set fso = Nothing
