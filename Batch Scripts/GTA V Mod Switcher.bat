:: GTA V Mod Switcher
:: Kurt Grosser
:: August 19, 2017
@echo off

:START
echo Welcome to the GTA V Mod Switcher tool
echo Created by Kurt Grosser (2017)
echo.

:SELECTION
echo What are you trying to do?
echo 1. Run Modded Version of GTA V
echo 2. Run Clean Version of GTA V
echo 3. Setup Multiple GTA V Versions
echo 4. Uninstall the Symlinks
echo 5. Exit
echo.

set /p selector=Please make a selection from the following list. [1-5] 

if %selector%==1 GOTO MOD
if %selector%==2 GOTO CLEAN
if %selector%==3 GOTO SETUP
if %selector%==4 GOTO UNINSTALL
if %selector%==5 GOTO END else GOTO SELECTION

:MOD
echo Enabling the Modded Version of GTA V

if EXIST %GTAVCLEAN% (
    rmdir %GTAVLINK%
)

mklink /D %GTAVLINK% %GTAVMOD%

echo Modded Version of GTA V Enabled
echo Exercise Caution and DO NOT Enter GTA: Online
echo.
GOTO END

:CLEAN
echo Enabling the Clean Version of GTA V

rmdir %GTAVLINK%

if EXIST %GTAVCLEAN% (
    mklink /D %GTAVLINK% %GTAVCLEAN%
)

echo Clean Version of GTA V Enabled
echo You are now safe to enter GTA: Online
echo.
GOTO END

:SETUP
echo There are two methods to setting up the Mod Switcher
echo 1. Complete Copy Symlink
echo 2. Modified Files Symlink
echo.
echo The Complete Copy Symlink requires a full copy of the entire GTA V folder
echo This consumes an extra 70GB of HDD Space
echo This makes adding files that must be added to the main folder easier at the cost of space
echo.
echo The Modified Files Symlink copies in the mods folder to your main GTA folder
echo This consumes as much space as your mods require
echo This method requires less space but means you have to remove files from the main folder
echo.
pause

set /p setupmethod=Which method do you want to use? [1-2] 
echo.

set /p ISINSTALLMODDED=Is your install already modded? [Y/N] 
echo.

if %ISINSTALLMODDED%==Y %ISINSTALLMODDED%==y (
    INSTALLLOCATION=\GTAV.mod
)
if %ISINSTALLMODDED%==N %ISINSTALLMODDED%==n (
    INSTALLLOCATION=\GTA.clean
)

if %setupmethod%==1 GOTO GTACOPY
if %setupmethod%==2 GOTO GTAMOD else GOTO SETUP

:GTACOPY
echo Please enter the location of your GTA V Install folder:
echo ex. C:\Program Files (x86)\Steam\steamapps\common
set /p GTACOPYSOURCEFOLDER=Location of GTA V: 
echo.

GTACOPYSOURCE=%GTACOPYSOURCEFOLDER%\Grand Theft Auto V

echo Please enter the full location of where you want the copy to go
echo ex. C:\Program Files(x86)\Steam\steamapps\common
echo To leave the copy destination the same as the current install location, press 'S'
set /p GTACOPYDEST=GTA Copy Location: 
if %GTACOPYDEST%==S (
    GTACOPYDEST==%GTACOPYSOURCEFOLDER%
)
echo.

GTACOPYLOCATION=%GTACOPYDEST%%INSTALLLOCATION%
echo Please wait while your files are copied to the new folder
echo This can take a long time as the install is 70GB
COPY %GTACOPYSOURCE% %GTACOPYLOCATION%
echo Your files have been copied
echo.

echo Creating variables for Mod Switching
if %INSTALLLOCATION%==\GTAV.mod (
    SETX GTAVMOD %GTACOPYLOCATION%
    REN %GTACOPYSOURCE% %GTACOPYSOURCEFOLDER%\GTAV.clean
    SETX GTAVCLEAN %GTACOPYSOURCEFOLDER%\GTAV.clean
    echo Please note that your new GTAV.clean folder contains mods
    echo It is your job to clean out the mods
)
if %INSTALLLOCATION%==\GTAV.clean (
    SETX GTAVCLEAN %GTACOPYLOCATION%
    REN %GTACOPYSOURCE% %GTACOPYSOURCEFOLDER%\GTAV.mod
    SETX GTAVMOD %GTACOPYSOURCEFOLDER%\GTAV.mod
)
echo.

SETX GTAVLINK %GTACOPYSOURCE%
SETX GTAMODMETHOD 1

echo Variables created, returning to main launch screen
echo.
GOTO START

:GTAMOD

echo Please enter the location of your GTA V Install folder:
echo ex. C:\Program Files(x86)\Steam\steamapps\common
set /p GTALOCATION=Location of GTA V: 

if %ISINSTALLMODDED%==Y %ISINSTALLMODDED%==y (
    GTAMODSLOCATION=%GTALOCATION%\Grand Theft Auto V\mods
    
    echo Please choose another location for your mods folder
    echo ex. D:\Documents\GTAVMods
    set /p NEWMODSLOCATION=Move Mods to this Location: 
    echo Please wait while your mods are copied to their new location
    COPY %GTAMODSLOCATION% %NEWMODSLOCATION%
    echo Your mods have been copied to their new location.
    echo.
    
    echo Creating variables for Mod Switching
    SETX GTAVMOD %NEWMODSLOCATION%
)
if %ISINSTALLMODDED%==N %ISINSTALLMODDED%==n (
    echo Please enter the location of your GTA V Mods folder: 
    echo ex. D:\Documents\GTAVMods
    set /p MODSLOCATION=Location of Mods: 

    echo Creating variables for Mod Switching
    SETX GTAVMOD %MODSLOCATION%
)

SETX GTAVLINK %GTALOCATION%\Grand Theft Auto V\mods
SETX GTAMODMETHOD 2
echo Variables created, returning to main launch screen
echo.
GOTO START

:UNINSTALL

set /p NUKEMODS=Do you want to delete your mods folder? [Y/N] 
if %NUKEMODS%==Y %NUKEMODS%==y (
    rmdir %GTAVMOD%
)

echo Removing all Envrionment Variables
if EXIST %GTAVCLEAN% (
    REG delete HKCU\Environment /F /V GTAVCLEAN
) 

if EXIST %GTAVLINK% (
    REG delete HKCU\Environment /F /V GTAVLINK
)

if EXIST %GTAVMOD% (
    REG delete HKCU\Environment /F /V GTAVMOD
)

if EXIST %GTAMODMETHOD% (
    REG delete HKCU\Environment /F /V GTAMODMETHOD
)
echo Done
echo.

echo Returning to main launch screen
echo.
GOTO START

:END
echo Thank you for using the GTA V Mod Switcher
echo Created by Kurt Grosser (2017)
pause