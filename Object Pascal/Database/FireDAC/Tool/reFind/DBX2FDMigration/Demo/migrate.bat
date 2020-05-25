cd Forms
md FireDAC_MeetingOrg
del /Q FireDAC_MeetingOrg\*.*
copy *.* FireDAC_MeetingOrg\*.*
reFind.exe FireDAC_MeetingOrg\*.pas FireDAC_MeetingOrg\*.dfm FireDAC_MeetingOrg\*.fmx /X:..\..\FireDAC_Migrate_DBX.txt
