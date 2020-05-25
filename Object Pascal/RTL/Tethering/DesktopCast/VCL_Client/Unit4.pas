//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit4;
//
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Tether.AppProfile, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    Image1: TImage;
    DesktopTetherManager: TTetheringManager;
    ActionManager1: TActionManager;
    actFullShot: TAction;
    actStartCast: TAction;
    actStopCast: TAction;
    TetheringAppProfile1: TTetheringAppProfile;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    tmCheckConnection: TTimer;
    Label1: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure TetheringAppProfile1Resources0ResourceReceived(
      const Sender: TObject; const AResource: TRemoteResource);
    procedure DesktopTetherManagerRequestManagerPassword(const Sender: TObject;
      const RemoteIdentifier: string; var Password: string);
    procedure tmCastTimer(Sender: TObject);
    procedure DesktopTetherManagerEndAutoConnect(Sender: TObject);
    procedure tmCheckConnectionTimer(Sender: TObject);
  private
    FIsConnected: Boolean;
    procedure CheckRemoteProfiles;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
  System.DateUtils, Vcl.Imaging.jpeg;

{$R *.dfm}

procedure TForm4.Button4Click(Sender: TObject);
begin
  DesktopTetherManager.AutoConnect;
  tmCheckConnection.Enabled := true;
end;

procedure TForm4.DesktopTetherManagerEndAutoConnect(Sender: TObject);
begin
  CheckRemoteProfiles;
end;

procedure TForm4.DesktopTetherManagerRequestManagerPassword(
  const Sender: TObject; const RemoteIdentifier: string; var Password: string);
begin
  Password := 'Desktop';
end;

procedure TForm4.TetheringAppProfile1Resources0ResourceReceived(
  const Sender: TObject; const AResource: TRemoteResource);
begin
  TThread.Synchronize(nil,procedure
  var
    LSize: Int64;
    LJpegImg: TJPEGImage;
  begin
  try
    LSize := Aresource.Value.AsStream.Size;
    Self.Caption := 'Resource received at ' + DateTimeToStr(now) + ' size ' + InttoStr(LSize);
    Aresource.Value.AsStream.Position := 0;
    LJpegImg := TJPEGImage.Create;
    try
      LJpegImg.LoadFromStream(Aresource.Value.AsStream);
      Image1.Picture.Bitmap.Assign(LJpegImg);
    finally
      LJpegImg.Free;
    end;
    Image1.Invalidate;
  except
  end;
  end );
end;

procedure TForm4.tmCastTimer(Sender: TObject);
begin
  actFullShot.Execute;
end;

procedure TForm4.tmCheckConnectionTimer(Sender: TObject);
begin
  CheckRemoteProfiles;
end;

procedure TForm4.CheckRemoteProfiles;
var
  I: Integer;
  ConnectedProfiles : String;
begin
  if DesktopTetherManager.RemoteProfiles.Count > 0 then
  begin
    for I := 0 to DesktopTetherManager.RemoteProfiles.Count - 1 do
    begin
      ConnectedProfiles := ConnectedProfiles + ' - ' + DesktopTetherManager.RemoteProfiles.Items[I].ProfileText;
    end;
    label1.Caption := 'Working with :' + ConnectedProfiles;
    FIsConnected := true;
  end
  else
  begin
    label1.Caption := 'You are not connected';
    FIsConnected := false;
  end;
end;


end.
