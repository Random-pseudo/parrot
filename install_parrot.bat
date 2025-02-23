@echo off
setlocal

curl -L -o cleanup.bat https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/cleanup.bat
curl -L -o setup.bat https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/setup.bat
curl -L -o loop_parrot.bat https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/loop_parrot.bat
curl -L -o parrot_background.bat https://raw.githubusercontent.com/Random-pseudo/parrot/refs/heads/main/parrot_background.bat

call setup.bat
start parrot_background.bat

exit
