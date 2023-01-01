@echo off

REM Xbox Game Bar calls amebarpresencewrite.exe automatically, this script can disable it once and for all.
REM Source & Credit for NSudo: https://github.com/M2Team/NSudo

set nscexe="%CD%\nsudoc.exe"
if NOT exist %nscexe% (
  echo nsudoc.exe was not found. 
  echo. 
  echo Please download NSudo and place it in the same directory as this script. 
  echo. 
  echo Press any key to exit . . . 
  pause >nul & exit
)

:check_admin
echo Elevating to Administrator permissions . . . 
echo.
NET FILE >nul 2>&1 || goto elevate
goto elevated

:elevate
echo.
echo.
echo This script requires Administrator permissions to run.
echo.
echo Please enter an Administrator username and password.
echo.
echo.CreateObject^("Shell.Application"^).ShellExecute%0,,,"RunAs",1 >"%CD%\runas.vbs"
cscript //Nologo "%CD%\runas.vbs" >nul
del /q "%CD%\runas.vbs"
exit

:elevated
NET FILE >nul 2>&1 || (echo Failed to elevate to Administrator permissions. Exiting... & exit)
echo Elevating to TrustedInstaller permissions . . . 
echo.

if not "%1" == "1" (
  %nscexe% -U:T -P:E "%~dp0%~n0.bat" 1
  echo.
  echo The process has been disabled. 
  echo.
) else (
  %nscexe% -U:T -P:E "%~dp0%~n0.bat" 0
  echo.
  echo The process has been re-enabled. 
  echo.
)

echo Press any key to exit . . . 
pause >nul
exit
