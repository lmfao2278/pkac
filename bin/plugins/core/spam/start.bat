cd %~dp0
title AfkSpam
:top
start /b node catch.js
start /b node 1.js
start /b node 2.js
start /b node 3.js
start /b node 4.js
start /b node 5.js
start /b node 6.js
start /b node 7.js
start /b node 8.js

set uppy=0
:timebomb
timeout 5
set /a uppy=%uppy%+1
if "%uppy%" == "120" goto restart
goto timebomb

:restart
taskkill /f /im node.exe
goto top
