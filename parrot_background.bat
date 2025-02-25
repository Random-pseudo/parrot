@echo off
cd /d "C:\Users\Eleve\parrot"

:loop
:: Lancer loop_parrot.bat en arrière-plan et cacher la fenêtre
powershell -WindowStyle Hidden -Command "Start-Process cmd -ArgumentList '/c C:\Users\Eleve\parrot\loop_parrot.bat' -WindowStyle Hidden"

:: Générer un temps aléatoire entre 60 et 180 secondes
set /a WAIT_TIME=(%RANDOM% %% 121) + 60

:: Pause pour un temps aléatoire
timeout /t %WAIT_TIME% /nobreak > nul

goto loop

