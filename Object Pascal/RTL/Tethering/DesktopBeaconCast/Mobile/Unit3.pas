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
  FMX.ActnList, FMX.Objects, FMX.Controls.Presentation, System.Beacon, System.Beacon.Components,
  System.Generics.Collections, FMX.ScrollBox, FMX.Memo;

type

  TBeaconItem = record
    ProfileID: string;
    GUID: TGUID;
    Major: Integer;
    Minor: Integer;
    procedure Parse(AString: string);
  end;

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
    tmCheckConnection: TTimer;
    Beacon1: TBeacon;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure CommandAppResources0ResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure CommandManagerRequestManagerPassword(const Sender: TObject;
      const RemoteIdentifier: string; var Password: string);
    procedure CommandManagerEndManagersDiscovery(const Sender: TObject;
      const RemoteManagers: TTetheringManagerInfoList);
    procedure tmCheckConnectionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CommandAppResources1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
    procedure FormDestroy(Sender: TObject);
    procedure Beacon1BeaconProximity(const Sender: TObject; const ABeacon: IBeacon; Proximity: TBeaconProximity);
    procedure CommandManagerEndAutoConnect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CommandManagerPairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
    procedure CommandManagerPairedToRemote(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
    procedure CommandAppDisconnect(const Sender: TObject; const AProfileInfo: TTetheringProfileInfo);
    procedure CommandManagerUnPairManager(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
  private
    FIsConnected: Boolean;
    FProfilesBeacon: TList<TBeaconItem>;
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

procedure TForm3.Beacon1BeaconProximity(const Sender: TObject; const ABeacon: IBeacon; Proximity: TBeaconProximity);
var
  I: Integer;
  LProfileID: string;
  LBeaconItem: TBeaconItem;
begin
  if Proximity = TBeaconProximity.Inmediate then
  begin
    for I := 0 to FProfilesBeacon.Count - 1 do
    begin
      LBeaconItem := FProfilesBeacon.Items[I];
      if (LBeaconItem.GUID = ABeacon.GUID) and (LBeaconItem.Major = ABeacon.Major)
        and (LBeaconItem.Minor = ABeacon.Minor) then
      begin
        LProfileID := LBeaconItem.ProfileID;
        Break;
      end;
    end;
    if LProfileID <> '' then
    begin
      for I:=0 to CommandApp.ConnectedProfiles.Count -1 do
      begin
        if CommandApp.ConnectedProfiles.Items[I].ProfileIdentifier = LProfileID then
        begin
          CommandApp.RunRemoteAction(CommandApp.ConnectedProfiles.Items[I], 'acFullShot');
          Break;
        end;
      end;
    end;
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  Lcuenta: Integer;
begin
  Lcuenta := CommandApp.ConnectedProfiles.Count;

end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  CommandManager.AutoConnect(5000);
  tmCheckConnection.Enabled := true;
end;

procedure TForm3.CommandAppDisconnect(const Sender: TObject; const AProfileInfo: TTetheringProfileInfo);
begin
  Memo1.Lines.Add('Profile disconnect:');
  Memo1.Lines.Add(AProfileInfo.ManagerIdentifier + ' - ' + AProfileInfo.ProfileIdentifier);
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

procedure TForm3.CommandAppResources1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
var
  LBeaconRegion: TBeaconRegionItem;
  LBeaconInfo: TBeaconItem;
  LIdentifier: String;
  I: Integer;
  NeedAdd: Boolean;
begin
  NeedAdd := True;
//  LIdentifier := AResource.Profile.Identifier;
  LIdentifier := AResource.Profile.ConnectedProfiles.Items[0].ProfileIdentifier;

  LBeaconInfo.Parse(AResource.Value.AsString);
  LBeaconInfo.ProfileID := LIdentifier;

  for I:= 0 to FProfilesBeacon.Count - 1 do
  begin
    if FProfilesBeacon[I].ProfileID = LIdentifier then
    begin
      FProfilesBeacon[I] := LBeaconInfo;
      NeedAdd := False;
    end;
  end;

  if NeedAdd then
    FProfilesBeacon.Add(LBeaconInfo);

  Beacon1.Enabled := False;
  LBeaconRegion := TBeaconRegionItem(Beacon1.MonitorizedRegions.Add);
  LBeaconRegion.GUID := LBeaconInfo.GUID;
  LBeaconRegion.Major := MAJOR_REGION_ALL;
  LBeaconRegion.Minor := MINOR_REGION_ALL;
  Beacon1.Enabled := True;
  TThread.Synchronize(nil, procedure begin
    lbStatus.Text := 'Beacon info received:' + AResource.Value.AsString;
  end);
end;

procedure TForm3.CommandManagerEndAutoConnect(Sender: TObject);
begin
  Memo1.Lines.Add('End autoconnect');
  TakeShot.Enabled := True;
  CheckRemoteProfiles;
end;

procedure TForm3.CommandManagerEndManagersDiscovery(const Sender: TObject;
  const RemoteManagers: TTetheringManagerInfoList);
begin
  Memo1.Lines.Add('End managersdiscovery');
  TakeShot.Enabled := True;
  CheckRemoteProfiles;
end;

procedure TForm3.CommandManagerPairedFromLocal(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Memo1.Lines.Add('New Manager PairedFromLocal  :');
  Memo1.Lines.Add(AManagerInfo.ManagerIdentifier + ' - ' + AManagerInfo.ManagerName + ' - ' + AManagerInfo.ConnectionString);
end;

procedure TForm3.CommandManagerPairedToRemote(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Memo1.Lines.Add('New Manager PairedToRemote:');
  Memo1.Lines.Add(AManagerInfo.ManagerIdentifier + ' - ' + AManagerInfo.ManagerName + ' - ' + AManagerInfo.ConnectionString);
end;

procedure TForm3.CommandManagerRequestManagerPassword(const Sender: TObject;
  const RemoteIdentifier: string; var Password: string);
begin
  Password := 'Desktop';
end;

procedure TForm3.CommandManagerUnPairManager(const Sender: TObject; const AManagerInfo: TTetheringManagerInfo);
begin
  Memo1.Lines.Add('Manager UnPaired:');
  Memo1.Lines.Add(AManagerInfo.ManagerIdentifier + ' - ' + AManagerInfo.ManagerName + ' - ' + AManagerInfo.ConnectionString);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  FIsConnected := false;
  FProfilesBeacon := TList<TBeaconItem>.Create;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  FProfilesBeacon.Free;
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
      if CommandManager.RemoteProfiles[I].ProfileGroup = CommandApp.Group then
      begin
        try
//          CommandApp.Connect(CommandManager.RemoteProfiles[I]);
//          CommandApp.RunRemoteAction(CommandManager.RemoteProfiles[I], 'acNotifyGUID');
          ConnectedProfiles := ConnectedProfiles + ' - ' + CommandManager.RemoteProfiles[I].ProfileText;
        except
        end;
      end;
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
//  CheckRemoteProfiles;
end;

{ TBeaconItem }

procedure TBeaconItem.Parse(AString: string);
var
  LInfoArray: TArray<string>;
begin
  LInfoArray := Astring.Split([';']);
  GUID := TGUID.Create(LInfoArray[0]);
  Major := LInfoArray[1].ToInteger;
  Minor := LInfoArray[2].ToInteger;
end;

end.
