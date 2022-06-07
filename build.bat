@echo off

:: Screenshot
call google-chrome --headless --disable-gpu --enable-logging "--screenshot=%cd%\resume.png" --window-size=1536,1000 --no-margins "%cd%\index.html"

:: Full PDF
call google-chrome --headless --disable-gpu --enable-logging "--print-to-pdf=%cd%\resume.pdf" --run-all-compositor-stages-before-draw --window-size=1536,1000 --virtual-time-budget=20000 --no-margins "%cd%\index.html"

:: Mini PDF
COPY style.css style.css.old
echo:>> style.css
echo .value { display: none; } >> style.css
call google-chrome --headless --disable-gpu --enable-logging "--print-to-pdf=%cd%\resume-mini.pdf" --run-all-compositor-stages-before-draw --window-size=1536,1000 --virtual-time-budget=20000 --no-margins "%cd%\index.html"
MOVE style.css.old style.css