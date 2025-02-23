@echo off
setlocal

set REPO_URL=https://raw.githubusercontent.com/Random-pseudo/repository/main
set PARROT_DIR=%USERPROFILE%\parrot

if not exist "%PARROT_DIR%" mkdir "%PARROT_DIR%"

curl -L -o "%PARROT_DIR%\loop_parrot.bat" %REPO_URL%/loop_parrot.bat
curl -L -o "%PARROT_DIR%\parrot_background.bat" %REPO_URL%/parrot_background.bat
curl -L -o "%PARROT_DIR%\setup.bat" %REPO_URL%/setup.bat

cd /d "%PARROT_DIR%"
call setup.bat
start parrot_background.bat

exit
