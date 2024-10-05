@echo off
setlocal enabledelayedexpansion

:: Set the output file name as the current folder name
for %%F in (.) do set output_file=%%~nxF

:: Create the output file with the correct name format
echo name: %output_file% > %output_file%.obp
echo combinations: >> %output_file%.obp
echo   [] >> %output_file%.obp
echo sessions: >> %output_file%.obp

:: Loop through directories in the current folder
for /d %%D in (*) do (
    :: Get the folder name
    set "foldername=%%~nD"

    :: Get the first character of the folder name
    set "firstchar=!foldername:~0,1!"

    :: Check if the first character is "s"
    if /i "!firstchar!"=="s" (
        echo   - !foldername! >> %output_file%.obp
    )
)

:: Add platform section
echo platform: windows >> %output_file%.obp

echo File %output_file%.obp has been created.

endlocal
