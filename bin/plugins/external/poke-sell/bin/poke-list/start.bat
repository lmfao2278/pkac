 @echo off
set root=%cd%
echo.
echo.What is the pokemon's name?
set /p name=: 
echo.How many you got?
set /p amount=: 
for /f "tokens=*" %%p in ('powershell %amount%/20') do set num=%%p
if not "%num%" == "%num:~0,1%" set /a pages=1
set num=%num:.=%
set /a pages=%pages%+%num:~0,1%
echo.Searching for %name% through %pages% pages.
:pre-builder
set uppy=0
echo.WScript.Sleep 3000>%root%\vbs.vbs
:builder
set /a uppy=%uppy%+1
if %uppy% gtr %pages% goto pre-builder-delete
echo.WScript.CreateObject("WScript.Shell").SendKeys "p!pokemon %uppy% --name %name%">> %root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "{ENTER}">> %root%\vbs.vbs
echo.WScript.Sleep 1700>>%root%\vbs.vbs
goto builder
:pre-builder-delete
set uppy=0
echo.WScript.Sleep 450>>%root%\vbs.vbs
:builder-delete
set /a uppy=%uppy%+1
if %uppy% gtr %pages% goto stop
echo.WScript.Sleep 350>>%root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "{UP}">> %root%\vbs.vbs
echo.WScript.Sleep 145>>%root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "^{a}">> %root%\vbs.vbs
echo.WScript.Sleep 75>>%root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "{DELETE}">> %root%\vbs.vbs
echo.WScript.Sleep 250>>%root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "{ENTER}">> %root%\vbs.vbs
echo.WScript.Sleep 450>>%root%\vbs.vbs
echo.WScript.CreateObject("WScript.Shell").SendKeys "{ENTER}">> %root%\vbs.vbs
goto builder-delete
:stop
echo.Go to discord ASAP.
cscript //nologo vbs.vbs
pause >nul