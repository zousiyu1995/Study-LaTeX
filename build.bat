:: Copyright (c) 2012-2016 Zousiyu

@echo off
:: compile the tex file
xelatex.exe --synctex=-1 main.tex

::pause
biber main

::pause
xelatex.exe --synctex=-1 main.tex

:: clear aux files
call clear