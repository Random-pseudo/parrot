@echo off
set REG_KEY=HKCU\Software\Microsoft\Windows\CurrentVersion\Run
set FILE_PATH=C:\Users\Eleve\parrot\parrot_background.bat
set LOG_FILE=C:\Users\Eleve\parrot\install_log.txt

:: Ajout au registre
reg add "%REG_KEY%" /v Parrot /t REG_SZ /d "\"%FILE_PATH%\"" /f > "%LOG_FILE%" 2>&1

:: Vérification si l'ajout a réussi
if %errorlevel% equ 0 (
    echo [%date% %time%] Le script Parrot a été ajouté au démarrage avec succès ! >> "%LOG_FILE%"
) else (
    echo [%date% %time%] Erreur lors de l'ajout du script Parrot au démarrage. >> "%LOG_FILE%"
)

exit

