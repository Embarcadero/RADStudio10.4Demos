1. About.

This folder contains several subfolders with reFind configuration files for migration 
from different data access libraries to FireDAC. reFind is a command line utility for:
* search and replacement of Perl RegEx text patterns in a text file;
* applying of reFind specific migration rules to a PAS and DFM files.
It is located in the RAD Studio bin directory. 

2. Configuration files

* AD2FDMigration directory contains configuration files for AnyDAC to FireDAC migration.
See http://docwiki.embarcadero.com/RADStudio/en/Migrating_AnyDAC_Applications_to_FireDAC
for more details.
* AD2FDMigration\Demo directory contains migrate.bat file to demonstrate the migration of a project 
from AnyDAC (the .orig files) to FireDAC.

* BDE2FDMigration directory contains configuration file for BDE to FireDAC migration.
See http://docwiki.embarcadero.com/RADStudio/en/Migrating_BDE_Applications_to_FireDAC
for more details.
* BDE2FDMigration\Demo directory contains migrate.bat file to demonstrate the migration of a project 
(MastApp) from BDE to FireDAC.

* DBX2FDMigration directory contains configuration file for dbExpress to FireDAC migration.
See http://docwiki.embarcadero.com/RADStudio/en/Migrating_DBX_Applications_to_FireDAC
for more details.
* DBX2FDMigration\Demo directory contains migrate.bat file to demonstrate the migration of a project 
(MastApp) from dbExpress to FireDAC.

3. reFind utility

3.1. Abstract.
reFind is a command line utility for search and replacement of Perl RegEx text patterns in a text file.

3.2. Usage.
RegEx (PCRE) search and replace utility, v 2.7.2
Copyright (c) 2013-2015 Embarcadero Technologies, Inc.

Usage: reFind <filemasks> [/S] [/Y] [/B:0|1|2] [/Q] [/I] [/W] [/L]
              [/P:<searchpattern>] [/R:<replacepattern>] [/X:<rule filename>

  <filemasks> Specifies the file maks or file names to process.

  /?          Displays help.
  /S          Search this directory with all subdirectories.
  /Y          Modify also read-only files.
  /B:0        if .bak file exists no replace will be performed (default).
  /B:1        if .bak file exists, it is overwritten.
  /B:2        No .bak file is created.
  /Q          Quiet operation. No output to console.

  /I          Ignore case.
  /W          Whole words.
  /L          Multi line search.
  /P          Perl RegEx search pattern.
  /R          Perl RegEx replacement pattern.
  /X          Specifies rule file with multiple Perl RegEx search and replace patterns.

The rule formats:
  #unuse <unit>                       - remove unit from the PAS uses clause
  #remove <property>                  - remove property from PAS and DFM
  #migrate [<class> :] [<obj> .] <old> -> <new> [, <unit>]  - replace old with new identifier,
                                        optionally add unit to uses clause,
                                        optionally restricts migration to the specified class,
                                        or optionally restricts migration to the specified object
  <searchpattern> -> <replacepattern> - find searchpattern and replace with replacepattern

3.3. Patterns format.
reFind uses Perl compatible regular expressions (PCRE) for search and replacement patterns. For more details, please visit:
English: http://www.regular-expressions.info/pcre.htm
Russian: http://citforum.ru/internet/perl/regexp

3.4. Examples.

3.4.1 Replace all "TQuery" with "TFDQuery" in pas files:
  refind *.pas /I /W /P:TQuery /R:TFDQuery

3.4.2 Replace all "TxxxQuery" with "TFDQuery" in pas and dfm files:
  refind *.pas *.dfm /I /W "/P:T[A-Za-z]+Query" /R:TFDQuery

3.4.3 Replace all "TxxxQuery" with "TQueryxxx" in pas and dfm files:
  refind *.pas *.dfm /I /W "/P:T([A-Za-z]+)Query" /R:TQuery\1

3.4.4 Remove all "Origin = xxxx" from DFM files:
  refind *.dfm /L "/P:\n +Origin =.+$" "/R:"
