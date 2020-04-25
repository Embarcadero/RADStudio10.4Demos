program EdgeBrowser;

uses
  Vcl.Forms,
  MainFormU in 'MainFormU.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
