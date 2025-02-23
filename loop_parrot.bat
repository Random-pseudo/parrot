@echo off
set PARROT_DIR=%USERPROFILE%\parrot

:loop
start cmd /k "curl parrot.live"
timeout /t 15
goto loop
