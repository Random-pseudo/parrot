@echo off
:loop
powershell -Command "Start-Process cmd -ArgumentList '/c loop_parrot.bat'"
:: Générer un temps aléatoire entre 60 et 180 secondes
set /a WAIT_TIME=(%RANDOM% %% 60) * 1

:: Pause pour un temps aléatoire
timeout /t %WAIT_TIME% /nobreak > nul


goto loop
