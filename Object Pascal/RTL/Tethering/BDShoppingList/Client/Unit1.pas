//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile,
  FMX.ListView.Types, FMX.ListView, FMX.StdCtrls, Fmx.Bind.GenData,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, System.Actions, FMX.ActnList, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    TetherBDTestManager: TTetheringManager;
    TetherBDTestProfile: TTetheringAppProfile;
    ListView1: TListView;
    PrototypeBindSource1: TPrototypeBindSource;
    LinkFillControlToFieldColorsName1: TLinkFillControlToField;
    BindingsList1: TBindingsList;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ToolBar2: TToolBar;
    Label2: TLabel;
    Button1: TButton;
    ActionList1: TActionList;
    actGetList: TAction;
    tmCheckConnection: TTimer;
    procedure TetherBDTestProfileResources0ResourceReceived(
      const Sender: TObject; const AResource: TRemoteResource);
    procedure Button1Click(Sender: TObject);
    procedure TetherBDTestManagerEndAutoConnect(Sender: TObject);
    procedure TetherBDTestManagerRemoteManagerShutdown(const Sender: TObject;
      const ManagerIdentifier: string);
    procedure TetherBDTestManagerRequestManagerPassword(const Sender: TObject;
      const RemoteIdentifier: string; var Password: string);
    procedure FormCreate(Sender: TObject);
    procedure tmCheckConnectionTimer(Sender: TObject);
    procedure ListView1ButtonClick(const Sender: TObject; const AItem: TListItem;
      const AObject: TListItemSimpleControl);
  private
    FIsConnected: Boolean;
    procedure CheckRemoteProfiles;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.TetherBDTestProfileResources0ResourceReceived(
  const Sender: TObject; const AResource: TRemoteResource);
  procedure AddItem(aItem: String);
  var
    LItem: TListViewItem;
    LItemParts: TStringList;
  begin
    LItem := ListView1.Items.Add;
    LItemParts := TStringList.Create;
    try
      LItemParts.Delimiter := '-';
      LItemParts.DelimitedText := AItem;
      LItem.Text := LItemParts[1];
      LItem.Detail := LItemParts[0] + ' (needs ' + LItemParts[2] + ')';
    finally
      LItemParts.Free;
    end;
  end;
var
  LStrings: TStringList;
  I: Integer;
begin
  ListView1.Items.Clear;

  if AResource.Value.AsString <> 'NONE' then
  begin
    LStrings := TStringList.Create;
    try
      LStrings.Delimiter := ':';
      LStrings.DelimitedText := AResource.Value.AsString;
      for I := 0 to LStrings.Count - 1 do
        AddItem(Lstrings[I]);
    finally
      LStrings.Free;
    end;
  end;
end;

procedure TForm1.tmCheckConnectionTimer(Sender: TObject);
begin
  CheckRemoteProfiles;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  tmCheckConnection.Enabled := true;
  TetherBDTestManager.AutoConnect;
end;

procedure TForm1.TetherBDTestManagerEndAutoConnect(Sender: TObject);
begin
  CheckRemoteProfiles;
end;

procedure TForm1.CheckRemoteProfiles;
var
  I: Integer;
  ConnectedProfiles : String;
begin
  if TetherBDTestManager.RemoteProfiles.Count > 0 then
  begin
    for I := 0 to TetherBDTestManager.RemoteProfiles.Count - 1 do
    begin
      ConnectedProfiles := ConnectedProfiles + ' - ' + TetherBDTestManager.RemoteProfiles.Items[I].ProfileText;
    end;
    Label2.Text := 'Working with :' + ConnectedProfiles;
    if not FIsConnected then
      actGetList.Execute;
    FIsConnected := true;
  end
  else
  begin
    Label2.Text := 'You are not connected';
    FIsConnected := false;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListView1.Items.Clear;
  FIsConnected := false;
end;

procedure TForm1.ListView1ButtonClick(const Sender: TObject; const AItem: TListItem;
  const AObject: TListItemSimpleControl);
var
  LItem: TListViewItem;
begin
  LItem := TListViewItem(AItem);
  TetherBDTestProfile.SendString(TetherBDTestManager.RemoteProfiles.Items[0], 'Buy item', LItem.Text);
end;

procedure TForm1.TetherBDTestManagerRemoteManagerShutdown(const Sender: TObject;
  const ManagerIdentifier: string);
begin
  CheckRemoteProfiles;
end;

procedure TForm1.TetherBDTestManagerRequestManagerPassword(
  const Sender: TObject; const RemoteIdentifier: string; var Password: string);
begin
  Password := 'TetherBDTest';
end;

end.
