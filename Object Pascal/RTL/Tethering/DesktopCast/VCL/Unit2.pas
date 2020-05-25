//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.Tether.Manager, System.Tether.AppProfile,
  Vcl.Imaging.jpeg ;

type
  TForm2 = class(TForm)
    DesktopTetherManager: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Image1: TImage;
    ActionManager1: TActionManager;
    actFullShot: TAction;
    actStartCast: TAction;
    actStopCast: TAction;
    tmCast: TTimer;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure actFullShotExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DesktopTetherManagerRequestManagerPassword(const Sender: TObject;
      const RemoteIdentifier: string; var Password: string);
    procedure tmCastTimer(Sender: TObject);
    procedure actStartCastExecute(Sender: TObject);
    procedure actStopCastExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Capture: TJpegImage;
    Lstream: TStream;
    procedure ScreenShot(DestBitmap: TBitmap);
    procedure Shot;
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
    Capture.Assign(Lcapture);
    Image1.Picture.Bitmap.Assign(LCapture) ;
  finally
    LCapture.Free;
  end;
end;

procedure TForm2.tmCastTimer(Sender: TObject);
begin
  actFullShot.Execute;
end;

procedure TForm2.actFullShotExecute(Sender: TObject);
begin
  Shot;
  if LStream = nil then
    Lstream := TMemoryStream.Create;

  LStream.Position := 0;
  Capture.SaveToStream(LStream);
  LStream.Position := 0;
  TetheringAppProfile1.Resources.Items[0].Value := LStream
end;

procedure TForm2.actStartCastExecute(Sender: TObject);
begin
  tmCast.Enabled := True;
end;

procedure TForm2.actStopCastExecute(Sender: TObject);
begin
  tmCast.Enabled := False;
end;

procedure TForm2.DesktopTetherManagerRequestManagerPassword(
  const Sender: TObject; const RemoteIdentifier: string; var Password: string);
begin
  Password := 'Desktop';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Capture := TJPEGImage.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  Capture.Free;
end;

end.

