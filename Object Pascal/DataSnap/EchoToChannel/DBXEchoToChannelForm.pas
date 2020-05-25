//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit DBXEchoToChannelForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSHTTPCommon, System.JSON, AppEvnts,
  Data.DBXJSON, Datasnap.DSCommon;

type
  TForm4 = class(TForm)
    DSClientCallbackChannelManager1: TDSClientCallbackChannelManager;
    ButtonConnect: TButton;
    ButtonDisconnect: TButton;
    Memo1: TMemo;
    ButtonClearLog: TButton;
    ButtonEcho: TButton;
    Edit1: TEdit;
    ApplicationEvents1: TApplicationEvents;
    LabelManagerId: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure ButtonConnectClick(Sender: TObject);
    procedure ButtonClearLogClick(Sender: TObject);
    procedure ButtonEchoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonDisconnectClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCallbackChannelRegistered: Boolean;
    function GetCallbackName: string;
    procedure UnregisterCallback;
    procedure RegisterCallback;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses DBXEchoToChannelClientModule;

type
  TCallbackClient = class(TDBXNamedCallback)
  public
    destructor Destroy; override;
    function Execute(const Arg: TJSONValue): TJSONValue; overload; override;
  end;

// Non-blocking call to write to Memo1.  Avoids possible deadlock when multiple
// threads are using SendMessage (e.g.; SendMessage for button click, SendMessage to
// write to Memo control).
procedure QueueLogValue(const AValue: string);
begin
  TThread.Queue(nil,
    procedure begin if Form4 <> nil then Form4.Memo1.Lines.Add(AValue) end)
end;

procedure LogValue(const AValue: string);
begin
  if Form4 <> nil then Form4.Memo1.Lines.Add(AValue);
end;

procedure TForm4.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonConnect.Enabled := not FCallbackChannelRegistered;
  ButtonDisconnect.Enabled := FCallbackChannelRegistered;
end;

procedure TForm4.ButtonClearLogClick(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm4.ButtonConnectClick(Sender: TObject);
begin
  RegisterCallback;
end;

procedure TForm4.RegisterCallback;
var
  LCallback: TDBXNamedCallback;
begin
  Assert(not FCallbackChannelRegistered);
  LCallback := TCallbackClient.Create(
    GetCallbackName);
  FCallbackChannelRegistered :=
    DSClientCallbackChannelManager1.RegisterCallback(LCallback)
end;

procedure TForm4.ButtonDisconnectClick(Sender: TObject);
begin
  UnregisterCallback;
end;

procedure TForm4.UnregisterCallback;
begin
  Assert(FCallbackChannelRegistered);
  FCallbackChannelRegistered := False;
  DSClientCallbackChannelManager1.UnregisterCallback(
      GetCallbackName);
end;

procedure TForm4.ButtonEchoClick(Sender: TObject);
var
  LResult: Boolean;
begin
  LResult := ClientModule1.ServerMethods1Client.EchoStringToChannel(
    DSClientCallbackChannelManager1.ChannelName, Edit1.Text);
  if LResult then
    LogValue('OK')
  else
    LogValue('Fail');
end;

function TForm4.GetCallbackName: string;
begin
  // Can use any name.  To keep it simple, just use the same name as the channel.
  Result := DSClientCallbackChannelManager1.ChannelName;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FCallbackChannelRegistered then
    // Clean up
    UnregisterCallback;

end;

procedure TForm4.FormCreate(Sender: TObject);
var
  LGuid: TGuid;
begin
  // Every client needs a unique identifier.
  // Use a guid.
  CreateGuid(LGuid);
  DSClientCallbackChannelManager1.ManagerId :=
    GuidToString(LGuid);
  LabelManagerId.Caption := DSClientCallbackChannelManager1.ManagerId;
end;

{ TCallbackClient }

destructor TCallbackClient.Destroy;
begin
  //
  inherited;
end;

// Called when a message is received by the channel
function TCallbackClient.Execute(const Arg: TJSONValue): TJSONValue;
begin
  QueueLogValue(Format('Channel/Callback: %s, received %s', [
    Self.Name, Arg.ToString]));
  Result := TJSONTrue.Create;

end;

end.
