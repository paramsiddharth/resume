@echo off
call google-chrome --headless --disable-gpu --enable-logging "--print-to-pdf=%cd%\resume.pdf" --run-all-compositor-stages-before-draw --window-size=1536,1000 --virtual-time-budget=20000 --no-margins "%cd%\index.html"
call google-chrome --headless --disable-gpu --enable-logging "--screenshot=%cd%\resume.png" --window-size=1536,1000 --no-margins "%cd%\index.html"