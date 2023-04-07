@echo off
color 0A
cls

setlocal EnableDelayedExpansion

set /A steps=5
set /A counter=0

echo.
echo               Maintenance Toolkit
echo  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
echo.
echo.

echo Step 1: Clearing temporary files...
set /A counter+=1
del /S /Q %TEMP%\*.*
echo Temporary files cleared.
echo.
echo !counter! out of !steps! steps completed.
echo.

echo Step 2: Running Disk Cleanup utility...
set /A counter+=1
cleanmgr.exe /sagerun:1
echo Disk Cleanup completed.
echo.
echo !counter! out of !steps! steps completed.
echo.

echo Step 3: Updating the system...
set /A counter+=1
powershell.exe -Command "Update-Help"
wuauclt.exe /updatenow
echo System update completed.
echo.
echo !counter! out of !steps! steps completed.
echo.

echo Step 4: Defragmenting the hard drive...
set /A counter+=1
defrag.exe C: /U /V
echo Hard drive defragmentation completed.
echo.
echo !counter! out of !steps! steps completed.
echo.

echo Step 5: Displaying summary report...
set /A counter+=1
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Boot Time"
echo.
echo !counter! out of !steps! steps completed.
echo.

echo  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
echo  Maintenance Toolkit has completed all tasks successfully.
echo  Press any key to exit.
pause >nul
