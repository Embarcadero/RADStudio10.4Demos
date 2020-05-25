program WebBrowser;

uses
  Vcl.Forms,
  BrowserFormU in 'BrowserFormU.pas' {frmBrowser},
  MainFormU in 'MainFormU.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
