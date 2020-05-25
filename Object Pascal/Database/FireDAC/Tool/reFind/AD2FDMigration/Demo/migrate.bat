@echo off
del SQLite_UserFunc.dpr
del SQLite_UserFunc.dpr.bak
copy SQLite_UserFunc.dpr.orig SQLite_UserFunc.dpr

del Unit1.dfm
del Unit1.dfm.bak
copy Unit1.dfm.orig Unit1.dfm

del Unit1.pas
del Unit1.pas.bak
copy Unit1.pas.orig Unit1.pas

reFind.exe *.pas *.dpk *.dpr *.dproj *.inc /S /Y /I /W /B:0 /X:..\FireDAC_Rename_Units.txt 
reFind.exe *.pas *.dfm *.dpk *.dpr *.inc /S /Y /I /B:0 /X:..\FireDAC_Rename_API.txt 
