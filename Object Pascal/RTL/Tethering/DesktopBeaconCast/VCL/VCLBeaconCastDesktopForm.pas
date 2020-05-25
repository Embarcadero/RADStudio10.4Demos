//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit VCLBeaconCastDesktopForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Tether.Manager, System.Tether.AppProfile,
  Vcl.Imaging.jpeg, Vcl.Samples.Spin, Vcl.Mask ;

type
  TForm2 = class(TForm)
    DesktopTetherManager: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Image1: TImage;
    ActionManager1: TActionManager;
    actFullShot: TAction;
    Panel1: TPanel;
    EdGUID: TMaskEdit;
    SEdMajor: TSpinEdit;
    SEdMinor: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    actSendGUID: TAction;
    Memo1: TMemo;
    Panel2: TPanel;
    GbxBeaconData: TGroupBox;
    BtnStartStop: TButton;
    Splitter1: TSplitter;
    PnImage: TPanel;
    procedure actFullShotExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSendGUIDExecute(Sender: TObject);
    procedure DesktopTetherManagerNewManager(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
    procedure DesktopTetherManagerPairedToRemote(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
    procedure DesktopTetherManagerPairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
    procedure TetheringAppProfile1Disconnect(const Sender: TObject; const AProfileInfo: TTetheringProfileInfo);
    procedure DesktopTetherManagerUnPairManager(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
    procedure BtnStartStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Capture: TJpegImage;
    LStream: TStream;
    FLastGUID: string;
    procedure ScreenShot(DestBitmap: TBitmap);
    procedure Shot;
    function GetComputerNetName: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  System.Tether.NetworkAdapter;

{$R *.dfm}

procedure TForm2.ScreenShot(DestBitmap: TBitmap);
 var
   DC : HDC;
 begin
   DC := GetDC (GetDesktopWindow) ;
   try
    DestBitmap.Width := GetDeviceCaps(DC, HORZRES) ;
    DestBitmap.Height := GetDeviceCaps(DC, VERTRES) ;
    BitBlt(DestBitmap.Canvas.Handle, 0, 0, DestBitmap.Width, DestBitmap.Height, DC, 0, 0, SRCCOPY) ;
   finally
    ReleaseDC (GetDesktopWindow, DC) ;
   end;
end;

procedure TForm2.Shot;
var
  LCapture: TBitmap;
begin
  LCapture := TBitmap.Create;
  try
    ScreenShot(LCapture) ;
    Capture.Assign(LCapture);
    Image1.Picture.Bitmap.Assign(LCapture) ;
  finally
    LCapture.Free;
  end;
end;

procedure TForm2.TetheringAppProfile1Disconnect(const Sender: TObject; const AProfileInfo: TTetheringProfileInfo);
begin
  Memo1.Lines.Add('Profile disconnect:');
  Memo1.Lines.Add(AProfileInfo.ManagerIdentifier + ' - ' + AProfileInfo.ProfileIdentifier);
end;

procedure TForm2.actFullShotExecute(Sender: TObject);
begin
  Memo1.Lines.Add('Running full shot at ' + DateTimeToStr(Now));
  Shot;
  if LStream = nil then
    LStream := TMemoryStream.Create;
  LStream.Position := 0;
  Capture.SaveToStream(LStream);
  Memo1.Lines.Add('Stream size: ' + LStream.Size.ToString);
  LStream.Position := 0;
  TetheringAppProfile1.Resources.Items[0].Value := LStream;
end;

procedure TForm2.actSendGUIDExecute(Sender: TObject);
begin
  if FLastGUID <> '' then
    TetheringAppProfile1.Resources.Items[1].Value := FLastGUID
  else
    TetheringAppProfile1.Resources.Items[1].Value := 'GUID_NOT_SET';
end;

procedure TForm2.BtnStartStopClick(Sender: TObject);
begin
  DesktopTetherManager.Enabled := not DesktopTetherManager.Enabled;
  EdGUID.Enabled := not DesktopTetherManager.Enabled;
  SEdMajor.Enabled := not DesktopTetherManager.Enabled;
  SEdMinor.Enabled := not DesktopTetherManager.Enabled;
  if BtnStartStop.Caption = 'Start' then
  begin
    TetheringAppProfile1.Resources.Items[1].Value := EdGUID.Text + ';' + SEdMajor.Value.ToString + ';' + SEdMinor.Value.ToString;
    BtnStartStop.Caption := 'Stop';
  end
  else
    BtnStartStop.Caption := 'Start';
end;

procedure TForm2.DesktopTetherManagerNewManager(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Memo1.Lines.Add('New Manager:');
  Memo1.Lines.Add(AManagerInfo.ManagerIdentifier + ' - ' + AManagerInfo.ManagerName + ' - ' + AManagerInfo.ConnectionString);
end;

procedure TForm2.DesktopTetherManagerPairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Memo1.Lines.Add('New Manager PairedFromLocal  :');
  Memo1.Lines.Add(AManagerInfo.ManagerIdentifier + ' - ' + AManagerInfo.ManagerName + ' - ' + AManagerInfo.ConnectionString);
end;

procedure TForm2.DesktopTetherManagerPairedToRemote(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Memo1.Lines.Add('New Manager PairedToRemote:');
  Memo1.Lines.Add(AManagerInfo.ManagerIdentifier + ' - ' + AManagerInfo.ManagerName + ' - ' + AManagerInfo.ConnectionString);
end;

procedure TForm2.DesktopTetherManagerUnPairManager(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Memo1.Lines.Add('Manager UnPaired:');
  Memo1.Lines.Add(AManagerInfo.ManagerIdentifier + ' - ' + AManagerInfo.ManagerName + ' - ' + AManagerInfo.ConnectionString);
end;

function TForm2.GetComputerNetName: string;
var
  LBuffer: array[0..255] of char;
  LSize: dword;
begin
  LSize := 256;
  if GetComputerName(LBuffer, LSize) then
    Result := LBuffer
  else
    Result := ''
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DesktopTetherManager.Enabled := False;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Capture := TJPEGImage.Create;
  TetheringAppProfile1.Text := 'Desktop cast ' + GetComputerNetName;
  Caption := TetheringAppProfile1.Text;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  Capture.Free;
end;

end.

