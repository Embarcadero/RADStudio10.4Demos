md FireDAC_MastApp
del /Q FireDAC_MastApp\*.*
copy *.* FireDAC_MastApp\*.*
reFind.exe FireDAC_MastApp\*.pas FireDAC_MastApp\*.dfm /X:..\FireDAC_Migrate_BDE.txt
