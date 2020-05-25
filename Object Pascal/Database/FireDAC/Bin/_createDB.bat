rem Parameters:
rem   1) directory with SQL scripts.
rem   2) connection definition name.
rem   3) says whether need to install Northwind DB.
rem Actions:
rem   * Creates the Northwind DB tables.
rem   * Pumps data from ASCII CSV files to Northwind tables.
rem   * Creates relations between Northwind DB tables.
rem   * Creates Northwind DB stored procedures and functions.
rem   * Creates FireDAC QA tables.
rem   * Creates FireDAC QA stored procedures and functions.

@echo off
cls

set fdroot=..
if not exist %fdroot%\Bin\_createDB.bat (
  echo "To run this script (RAD Studio Demos)\Delphi\Database\FireDAC\Bin directory must be current."
  goto :EOF
)
if "%1"=="" (
  echo "_createDB.bat script cannot be called directly."
  goto :EOF
)

set bin=%fdroot%\Bin
set data=%fdroot%\DB\Data
set sql=%fdroot%\DB\SQL
set North=%sql%\%1\Northwind
set QA=%sql%\%1\QA

set ConnDef=%2
set NorthObj=%3

if /I "%1"=="Access" (
  cscript %North%\tables.vbs "%data%"
  if errorlevel 1 pause
  %bin%\FDExecutor /D %ConnDef% /P %sql% /T %data% LoadData
  if errorlevel 1 pause
  cscript %North%\relations.vbs "%data%"
  if errorlevel 1 pause
  cscript %QA%\tables.vbs "%data%"
  if errorlevel 1 pause

) else (
  if /I not "%NorthObj%"=="False" (
    %bin%\FDExecutor /D %ConnDef% /P %North% tables
    if errorlevel 1 pause
    %bin%\FDExecutor /D %ConnDef% /P %sql% /T %data% LoadData
    if errorlevel 1 pause
    %bin%\FDExecutor /D %ConnDef% /P %North% relations 
    if errorlevel 1 pause
    if exist %North%\procedures.sql (
      %bin%\FDExecutor /D %ConnDef% /P %North% procedures
      if errorlevel 1 pause
    )
  )

  %bin%\FDExecutor /D %ConnDef% /P %QA% tables
  if errorlevel 1 pause
  if exist %QA%\procedures.sql (
    %bin%\FDExecutor /D %ConnDef% /P %QA% procedures
    if errorlevel 1 pause
  )
)
