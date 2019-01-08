@echo off
if not defined oldsize set oldsize=0

set input=%~1
if "%input%" == "log" call :loadLog
if "%input%" == "hide-common" call :hide1
if "%input%" == "hide-common-ish" call :hide2

:loadLog
if not exist "%root%\log.log" @exit /b
FOR /F "usebackq" %%A IN ('%root%\log.log') DO set size=%%~zA
IF "%size%" gtr "%oldsize%" call :log
set oldsize=%size%
@exit /b

:log
cls
if not defined hide1 if not defined hide2 type "%root%\log.log" & @exit /b
findstr %hide1%%hide2%"%root%\log.log"
@exit /b

:hide1
if defined hide1 set hide1=& call :log & @exit /b
set "hide1=/v /c:"[BORING]" "
call :log
@exit /b

:hide2
if defined hide2 set hide2=& call :log & @exit /b
set "hide2=/v /c:"[EH OKAY IG]" "
call :log
@exit /b
