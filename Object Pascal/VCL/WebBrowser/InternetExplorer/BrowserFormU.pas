unit BrowserFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SHDocVw, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.OleCtrls, Vcl.Menus,
  Vcl.ExtCtrls;

type
  TfrmBrowser = class(TForm)
    tbToolbar: TToolBar;
    tbBack: TToolButton;
    tbForward: TToolButton;
    tbReload: TToolButton;
    tbCancel: TToolButton;
    edtAddress: TEdit;
    tbGo: TToolButton;
    WebBrowser: TWebBrowser;
    StatusBar: TStatusBar;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tbBackClick(Sender: TObject);
    procedure tbForwardClick(Sender: TObject);
    procedure tbReloadClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure edtAddressKeyPress(Sender: TObject; var Key: Char);
    procedure tbGoClick(Sender: TObject);
    procedure WebBrowserNavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    procedure WebBrowserCommandStateChange(ASender: TObject; Command: Integer; Enable: WordBool);
    procedure WebBrowserBeforeNavigate2(ASender: TObject; const pDisp: IDispatch; const URL, Flags, TargetFrameName,
      PostData, Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowserNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame,
      StatusCode: OleVariant; var Cancel: WordBool);
    procedure WebBrowserTitleChange(ASender: TObject; const Text: WideString);
    procedure TimerTimer(Sender: TObject);
    procedure WebBrowserDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    procedure WebBrowserNewWindow2(ASender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);
    procedure WebBrowserNewWindow3(ASender: TObject; var ppDisp: IDispatch; var Cancel: WordBool; dwFlags: Cardinal;
      const bstrUrlContext, bstrUrl: WideString);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FBrowserHWnd: HWND;
  public
    { Public declarations }
  end;

implementation

uses
  Winapi.ActiveX, System.UITypes, System.StrUtils;

{$R *.dfm}

procedure TfrmBrowser.FormCreate(Sender: TObject);
begin
  tbReload.Enabled := True;
  tbGo.Enabled := True;
  edtAddress.Enabled := True;
  Timer.Enabled := True;
end;

procedure TfrmBrowser.FormShow(Sender: TObject);
begin
  WebBrowser.Navigate('http://bing.com');
end;

procedure TfrmBrowser.FormResize(Sender: TObject);
begin
  edtAddress.Width := tbToolbar.ClientWidth - edtAddress.Left - tbGo.Width;
end;

procedure TfrmBrowser.tbBackClick(Sender: TObject);
begin
  WebBrowser.GoBack
end;

procedure TfrmBrowser.tbForwardClick(Sender: TObject);
begin
  WebBrowser.GoForward
end;

procedure TfrmBrowser.tbReloadClick(Sender: TObject);
begin
  WebBrowser.Refresh
end;

procedure TfrmBrowser.tbCancelClick(Sender: TObject);
begin
  WebBrowser.Stop;
  tbCancel.Enabled := True;
end;

procedure TfrmBrowser.edtAddressKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    tbGo.Click
  end;
end;

procedure TfrmBrowser.tbGoClick(Sender: TObject);
begin
  tbCancel.Enabled := True;
  var URL := edtAddress.Text;
  if not StartsText('http', URL) then
    URL := 'http://' + URL;
  WebBrowser.Navigate(URL)
end;

procedure TfrmBrowser.TimerTimer(Sender: TObject);
begin
  // Is browser busy?
  if WebBrowser.Busy then
    StatusBar.Panels[0].Text := 'Busy'
  else
    StatusBar.Panels[0].Text := 'Not Busy';
  // Get the browser control's window handle
  if FBrowserHWnd = 0 then
  begin
    try
      // With IE browser control the HWND property seems to simply generate:
      //   EOleException: Unspecified error
      // We'll therefore not call it here
      // Instead for IE we get the HWND in the OnDocumentComplete handler
      if WebBrowser.ActiveEngine = TWebBrowser.TActiveEngine.Edge then
      begin
        FBrowserHWnd := WebBrowser.HWND;
        StatusBar.Panels[1].Text := Format('HWND=%x', [FBrowserHWnd]);
      end;
    except
      // Oh, maybe not ready yet...
    end;
  end;
end;

procedure TfrmBrowser.WebBrowserBeforeNavigate2(ASender: TObject; const pDisp: IDispatch; const URL, Flags,
  TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
begin
  tbCancel.Enabled := True;
end;

procedure TfrmBrowser.WebBrowserCommandStateChange(ASender: TObject; Command: Integer; Enable: WordBool);
begin
  case Command of
    CSC_NAVIGATEBACK: tbBack.Enabled := Enable;
    CSC_NAVIGATEFORWARD: tbForward.Enabled := Enable;
  end;
end;

procedure TfrmBrowser.WebBrowserDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
  var Win: IOleWindow;
  if Supports(pDisp, IOleWindow, Win) then
  begin
    Win.GetWindow(FBrowserHWnd);
    StatusBar.Panels[1].Text := Format('HWND=%x', [FBrowserHWnd])
  end;
end;

procedure TfrmBrowser.WebBrowserNavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
  tbCancel.Enabled := False;
  edtAddress.Text := URL;
end;

procedure TfrmBrowser.WebBrowserNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame,
  StatusCode: OleVariant; var Cancel: WordBool);
begin
  tbCancel.Enabled := False;
end;

procedure TfrmBrowser.WebBrowserNewWindow2(ASender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);
begin
  if MessageDlg('Allow new window', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Cancel := True
end;

procedure TfrmBrowser.WebBrowserNewWindow3(ASender: TObject; var ppDisp: IDispatch; var Cancel: WordBool;
  dwFlags: Cardinal; const bstrUrlContext, bstrUrl: WideString);
begin
  if MessageDlg('Allow new window', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Cancel := True
end;

procedure TfrmBrowser.WebBrowserTitleChange(ASender: TObject; const Text: WideString);
begin
  Caption := Text;
end;

end.
