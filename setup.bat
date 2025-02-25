@echo off
set REG_KEY=HKCU\Software\Microsoft\Windows\CurrentVersion\Run
set FILE_PATH=C:\Users\Eleve\parrot\parrot_background.bat
set LOG_FILE=C:\Users\Eleve\parrot\install_log.txt

:: Vérifier et créer le dossier parrot si nécessaire
if not exist "C:\Users\Eleve\parrot" mkdir "C:\Users\Eleve\parrot"

:: Ajout au registre avec redirection vers le log
reg add "%REG_KEY%" /v Parrot /t REG_SZ /d "\"C:\Users\Eleve\parrot\parrot_launcher.vbs\"" /f


:: Vérification si l'ajout a réussi
if %errorlevel% equ 0 (
    echo [%date% %time%] Le script Parrot a été ajouté au démarrage avec succès ! >> "%LOG_FILE%"
) else (
    echo [%date% %time%] Erreur lors de l'ajout du script Parrot au démarrage. >> "%LOG_FILE%"
)

exit
