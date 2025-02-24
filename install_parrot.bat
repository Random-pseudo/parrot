@echo off
setlocal

:: Définir le chemin du dossier "parrot"
set PARROT_DIR=C:\Users\Eleve\parrot

:: Créer le dossier "parrot" s'il n'existe pas
if not exist %PARROT_DIR% mkdir %PARROT_DIR%

:: Télécharger les fichiers dans le dossier "parrot"
curl -L -o "%PARROT_DIR%\cleanup.bat" https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/cleanup.bat
curl -L -o "%PARROT_DIR%\setup.bat" https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/setup.bat
curl -L -o "%PARROT_DIR%\loop_parrot.bat" https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/loop_parrot.bat
curl -L -o "%PARROT_DIR%\parrot_background.bat" https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/parrot_background.bat

:: Vérifier si setup.bat a bien été téléchargé avant de l'exécuter
if exist "%PARROT_DIR%\setup.bat" (
    start "" cmd /k "cd /d %PARROT_DIR% && setup.bat"
) else (
    echo Erreur : setup.bat n'a pas été téléchargé.
)

:: Vérifier si parrot_background.bat a bien été téléchargé avant de l'exécuter
if exist "%PARROT_DIR%\parrot_background.bat" (
    start "" cmd /k "cd /d %PARROT_DIR% && parrot_background.bat"
) else (
    echo Erreur : parrot_background.bat n'a pas été téléchargé.
)

exit
