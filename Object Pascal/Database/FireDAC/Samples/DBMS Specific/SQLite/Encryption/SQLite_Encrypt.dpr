program SQLite_Encrypt;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
