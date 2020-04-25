unit MainFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    btnBrowserIEOnly: TButton;
    btnBrowserEdgeIfAvailable: TButton;
    btnBrowserEdgeOnly: TButton;
    procedure btnBrowserIEOnlyClick(Sender: TObject);
    procedure btnBrowserEdgeIfAvailableClick(Sender: TObject);
    procedure btnBrowserEdgeOnlyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses BrowserFormU, SHDocVw;

procedure TfrmMain.btnBrowserIEOnlyClick(Sender: TObject);
begin
  var BrowserForm := TfrmBrowser.Create(Application);
  BrowserForm.WebBrowser.SelectedEngine := TWebBrowser.TSelectedEngine.IEOnly;
  BrowserForm.Show
end;

procedure TfrmMain.btnBrowserEdgeIfAvailableClick(Sender: TObject);
begin
  var BrowserForm := TfrmBrowser.Create(Application);
  BrowserForm.WebBrowser.SelectedEngine := TWebBrowser.TSelectedEngine.EdgeIfAvailable;
  BrowserForm.Show
end;

procedure TfrmMain.btnBrowserEdgeOnlyClick(Sender: TObject);
begin
  var BrowserForm := TfrmBrowser.Create(Application);
  BrowserForm.WebBrowser.SelectedEngine := TWebBrowser.TSelectedEngine.EdgeOnly;
  BrowserForm.Show
end;

end.
