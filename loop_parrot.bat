@echo off
set PARROT_DIR=%USERPROFILE%\parrot

:loop
start cmd /k "curl parrot.live"

:: Générer un temps aléatoire entre 60 et 180 secondes
set /a WAIT_TIME=(%RANDOM% %% 12) + 5

:: Pause pour un temps aléatoire
timeout /t %WAIT_TIME% /nobreak > nul

goto loop
