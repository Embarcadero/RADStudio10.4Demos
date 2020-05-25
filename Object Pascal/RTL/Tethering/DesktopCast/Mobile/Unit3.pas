//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile, FMX.ListBox,
  FMX.Layouts, FMX.StdCtrls, System.Tether.TCPProtocol, System.Actions,
  FMX.ActnList, FMX.Objects;

type
  TForm3 = class(TForm)
    CommandManager: TTetheringManager;
    CommandApp: TTetheringAppProfile;
    ActionList1: TActionList;
    Action1: TAction;
    Image1: TImage;
    Action2: TAction;
    Action3: TAction;
    ToolBar1: TToolBar;
    lbStatus: TLabel;
    ToolBar2: TToolBar;
    Label1: TLabel;
    Button2: TButton;
    ToolBar3: TToolBar;
    TakeShot: TButton;
    Button1: TButton;
    Button3: TButton;
    tmCheckConnection: TTimer;
    procedure Button2Click(Sender: TObject);
    procedure CommandAppResources0ResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure CommandManagerRequestManagerPassword(const Sender: TObject;
      const RemoteIdentifier: string; var Password: string);
    procedure CommandManagerEndManagersDiscovery(const Sender: TObject;
      const RemoteManagers: TTetheringManagerInfoList);
    procedure tmCheckConnectionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsConnected: Boolean;
    procedure CheckRemoteProfiles;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  System.DateUtils;

{$R *.fmx}

procedure TForm3.Button2Click(Sender: TObject);
begin
  CommandManager.AutoConnect;
  tmCheckConnection.Enabled := true;
end;

procedure TForm3.CommandAppResources0ResourceReceived(const Sender: TObject;
  const AResource: TRemoteResource);
begin
  TThread.Synchronize(nil,procedure
  var
    LSize: Int64;begin
  try
    LSize := Aresource.Value.AsStream.Size;
    lbStatus.Text := 'Resource received at ' + DateTimeToStr(now) + ' size ' + InttoStr(LSize);
    Aresource.Value.AsStream.Position := 0;
    Image1.Bitmap.LoadFromStream(Aresource.Value.AsStream);
    Image1.Repaint;
  except
  end;
  end );
end;

procedure TForm3.CommandManagerEndManagersDiscovery(const Sender: TObject;
  const RemoteManagers: TTetheringManagerInfoList);
begin
  TakeShot.Enabled := True;
end;

procedure TForm3.CommandManagerRequestManagerPassword(const Sender: TObject;
  const RemoteIdentifier: string; var Password: string);
begin
  Password := 'Desktop';
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  FIsConnected := false;
end;

procedure TForm3.CheckRemoteProfiles;
var
  I: Integer;
  ConnectedProfiles : String;
begin
  if CommandManager.RemoteProfiles.Count > 0 then
  begin
    for I := 0 to CommandManager.RemoteProfiles.Count - 1 do
    begin
      ConnectedProfiles := ConnectedProfiles + ' - ' + CommandManager.RemoteProfiles.Items[I].ProfileText;
    end;
    Label1.Text := 'Working with :' + ConnectedProfiles;
    FIsConnected := true;
  end
  else
  begin
    Label1.Text := 'You are not connected';
    FIsConnected := false;
  end;
end;

procedure TForm3.tmCheckConnectionTimer(Sender: TObject);
begin
  CheckRemoteProfiles;
end;

end.
