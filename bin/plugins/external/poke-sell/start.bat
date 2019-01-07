@echo off
set root=%cd%
cd bin
echo.You want poke list??
choice
IF %ERRORLEVEL% == 1 call poke-list\start.bat
echo.
echo.Paste text like...
echo./----------------------------------------------\
echo.^|Meowth ^| Level: 16 ^| Number: 3625 ^| IV: 72.58%% ^|
echo.^|Meowth ^| Level: 29 ^| Number: 2883 ^| IV: 72.58%% ^|
echo.^|Meowth ^| Level: 4 ^| Number: 4281 ^| IV: 63.44%%  ^|
echo.^|Meowth ^| Level: 25 ^| Number: 2527 ^| IV: 62.9%%  ^|
echo.^|Meowth ^| Level: 10 ^| Number: 6370 ^| IV: 61.83%% ^|
echo.^|Meowth ^| Level: 2 ^| Number: 1413 ^| IV: 59.68%%  ^|
echo.^|Meowth ^| Level: 30 ^| Number: 4010 ^| IV: 58.6%%  ^|
echo.^|Meowth ^| Level: 11 ^| Number: 2902 ^| IV: 58.06%% ^|
echo.^|Meowth ^| Level: 22 ^| Number: 4170 ^| IV: 57.53%% ^|
echo.^|Meowth ^| Level: 38 ^| Number: 3072 ^| IV: 56.99%% ^|
echo.^|Meowth ^| Level: 9 ^| Number: 3048 ^| IV: 55.91%%  ^|
echo.^|Meowth ^| Level: 17 ^| Number: 623 ^| IV: 54.84%%  ^|
echo.^|Meowth ^| Level: 36 ^| Number: 1736 ^| IV: 54.84%% ^|
echo.^|Meowth ^| Level: 5 ^| Number: 824 ^| IV: 54.84%%   ^|
echo.^|Meowth ^| Level: 39 ^| Number: 5613 ^| IV: 53.76%% ^|
echo.^|Meowth ^| Level: 40 ^| Number: 3483 ^| IV: 51.61%% ^|
echo.^|Meowth ^| Level: 28 ^| Number: 5398 ^| IV: 51.08%% ^|
echo.\----------------------------------------------/
copy nul input.txt >nul
notepad input.txt
copy input.txt tmp0.tmp >nul
fart --quiet --remove tmp0.tmp "| Level: "
fart --quiet tmp0.tmp "| Number: " "#"
fart --quiet --remove tmp0.tmp "| IV: "
fart --quiet --remove tmp0.tmp "%%"
fart --quiet --remove tmp0.tmp "Your pokémon:"
fart --quiet tmp0.tmp " " "           "
if exist tmp1.tmp del tmp1.tmp
for /f "delims=# tokens=1*" %%A in (tmp0.tmp) do echo %%B >> tmp1.tmp
type tmp1.tmp | findstr /v Showing > tmp2.tmp
echo.Step 1 finished.
setlocal enabledelayedexpansion
set presetLoad=tmp2
set cuppy=2
set cuppy2=1
set /p s1=<"%presetLoad%.tmp"
:loadMoreLines
IF EXIST "%presetLoad%.tmp" set lastnum=%cuppy%& for /f "usebackq skip=%cuppy2% delims=" %%i in ("%presetLoad%.tmp") do if not defined s%cuppy% set "s%cuppy%=%%i"
IF NOT DEFINED s%cuppy% set /a Lastnum=%lastnum%-2& goto loadFinished
set /a cuppy=%cuppy%+1
set /a cuppy2=%cuppy2%+1
goto loadMoreLines
:loadFinished
echo.Step 2 finished.
set cuppy=%lastnum%
if exist %root%\vbs.vbs del %root%\vbs.vbs
echo.WScript.Sleep 4000>%root%\vbs.vbs
:loadWrite
set var=!s%cuppy%!
set var=%var:~0,7%
set var=%var: =%
echo.WScript.Sleep 2500>>%root%\vbs.vbs
if defined oldcuppy if "%oldcuppy%" == "0" echo.WScript.CreateObject("WScript.Shell").SendKeys "p^!confirmlist">> %root%\vbs.vbs & echo.WScript.CreateObject("WScript.Shell").SendKeys "{ENTER}">> %root%\vbs.vbs & echo.WScript.Sleep 4000>>%root%\vbs.vbs
IF %cuppy% LEQ 1 goto stop
echo.WScript.CreateObject("WScript.Shell").SendKeys "p^!market list %var% 1">> %root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "{ENTER}">> %root%\vbs.vbs
set oldcuppy=%cuppy:~1,2%
set /a cuppy=%cuppy%-1
goto loadWrite
:stop
echo.WScript.Sleep 3500>>%root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "p^!confirmlist" >> %root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "{ENTER}">> %root%\vbs.vbs
echo.Step 3 finished. You ready?
:stop
pause >nul
cscript //nologo vbs.vbs