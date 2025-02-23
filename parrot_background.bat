@echo off
powershell -WindowStyle Hidden -Command "Start-Process cmd -ArgumentList '/c loop_parrot.bat' -WindowStyle Hidden"
exit
