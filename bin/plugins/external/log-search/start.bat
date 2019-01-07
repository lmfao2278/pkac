@echo on
if exist bin\pokenames.zip call :pokenames
set nope=::
title Pokecord Auto Catcher! Explorer Edition
cd bin
set dataroot=..\data
for /f "tokens=1,2 delims==" %%G in (%dataroot%\options\options.ini) do set %%G=%%H
:top
set search=
cls
echo.What ya lookin for ma boi?
echo.
cd pokenames
set /p search=: 
if not defined search set Nope=
%nope%echo.Searching with preset queries...
%nope%echo.
cd ..
%nope%echo.Using %look-for-default-1% as search list!
%nope%echo.
%nope%set /p search=<%dataroot%\%look-for-default-1%
%nope%set search="%search: = has" /c:"%
type %log% | findstr /i /c:%search%
%nope%if defined look-for-default-2 echo.
%nope%if defined look-for-default-2 echo.Using %look-for-default-2% as search list!
%nope%if defined look-for-default-2 echo.
%nope%if defined look-for-default-2 set /p search=<%dataroot%\%look-for-default-2%
%nope%if defined look-for-default-2 set search="%search: = has" /c:"%
%nope%if defined look-for-default-2 type %log% | findstr /i /c:%search%
%nope%if defined look-for-default-3 echo.
%nope%if defined look-for-default-3 echo.Using %look-for-default-3% as search list!
%nope%if defined look-for-default-3 echo.
%nope%if defined look-for-default-3 set /p search=<%dataroot%\%look-for-default-3%
%nope%if defined look-for-default-3 set search="%search: = has" /c:"%
%nope%if defined look-for-default-3 type %log% | findstr /i /c:%search%
%nope%if defined look-for-default-4 echo.
%nope%if defined look-for-default-4 echo.Using %look-for-default-4% as search list!
%nope%if defined look-for-default-4 echo.
%nope%if defined look-for-default-4 set /p search=<%dataroot%\%look-for-default-4%
%nope%if defined look-for-default-4 set search="%search: = has" /c:"%
%nope%if defined look-for-default-4 type %log% | findstr /i /c:%search%
set search=
pause >nul
goto :top

:pokenames
cd bin\
tar -xf pokenames.zip
del pokenames.zip
@exit /b