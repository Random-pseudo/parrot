@echo off
set REG_KEY="HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
set FILE_PATH="C:\Utilisateurs\Eleve\Téléchargements\parrot_background.bat"

reg add %REG_KEY% /v Parrot /t REG_SZ /d "%FILE_PATH%" /f

echo Le script Parrot a été ajouté au démarrage !
exit
