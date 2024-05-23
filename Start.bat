@echo off
setlocal

:: Define the source and destination paths
set "sourceFile=%~dp0DailyAppUsage.jar"
set "sourceFolder=%~dp0Images"
set "destinationFile=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\DailyAppUsage.jar"
set "destinationFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Images"

:: Check if the source file exists
if not exist "%sourceFile%" (
    echo ERROR: Source file not found.
    pause
    exit /b 1
)

:: Check if the source folder exists
if not exist "%sourceFolder%" (
    echo ERROR: Source folder not found.
    pause
    exit /b 1
)

:: Move the file
move "%sourceFile%" "%destinationFile%"

:: Check if the file move was successful
if %errorlevel% equ 0 (
    echo File moved successfully.
) else (
    echo ERROR: Failed to move file.
    pause
    exit /b 1
)

:: Copy the folder
xcopy "%sourceFolder%" "%destinationFolder%" /E /I /H /Y

:: Check if the folder copy was successful
if %errorlevel% equ 0 (
    echo You need to restart the system for the application to take effect.
) else (
    echo ERROR: Failed to copy folder.
)

pause
