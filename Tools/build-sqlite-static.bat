@echo off
if not exist "..\db\sqlite\lib\" mkdir ..\db\sqlite\lib\

cl -nologo -MT -TC -O2 -c sqlite\sqlite3.c
lib -nologo sqlite3.obj -out:..\..\db\sqlite\lib\sqlite3.lib

del *.obj