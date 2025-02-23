@echo off
setlocal

set REPO_URL=https://raw.githubusercontent.com/username/repository/main

curl -L -o loop_parrot.bat %REPO_URL%/loop_parrot.bat
curl -L -o parrot_background.bat %REPO_URL%/parrot_background.bat
curl -L -o setup.bat %REPO_URL%/setup.bat
curl -L -o cleanup.bat %REPO_URL%/cleanup.bat



call setup.bat
start parrot_background.bat

exit
