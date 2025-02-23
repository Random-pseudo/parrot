@echo off
setlocal

:: Définir le chemin du dossier "parrot"
set PARROT_DIR=%USERPROFILE%\parrot

:: Créer le dossier "parrot" s'il n'existe pas
if not exist "%PARROT_DIR%" mkdir "%PARROT_DIR%"

:: Télécharger les fichiers dans le dossier "parrot"
curl -L -o "%PARROT_DIR%\cleanup.bat" https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/cleanup.bat
curl -L -o "%PARROT_DIR%\setup.bat" https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/setup.bat
curl -L -o "%PARROT_DIR%\loop_parrot.bat" https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/loop_parrot.bat
curl -L -o "%PARROT_DIR%\parrot_background.bat" https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/parrot_background.bat

:: Exécuter setup.bat et lancer parrot_background.bat
call "%PARROT_DIR%\setup.bat"
start "" "%PARROT_DIR%\parrot_background.bat"

exit
