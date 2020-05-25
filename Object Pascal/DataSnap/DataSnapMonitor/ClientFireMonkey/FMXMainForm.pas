//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit FMXMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit,
  IPPeerClient, IndyPeerImpl, Data.DBXCommon, Data.DB, Data.SqlExpr, CMClientClassesUnit,
  FMX.Layouts, FMX.Memo, DbxDataSnap, FMX.StdCtrls, FMX.EditBox, FMX.NumberBox,
  FMX.Controls.Presentation;

type

  TServerThrasher = class(TThread)
  private
    FProxyInst : TServerConnMonitorMethodsClient;
    FThrashBox: TMemo;
    FInterval: Integer;
    FRunning: Boolean;

    function GetStringToReverse: String;
    procedure AddReversedString(Str: String);
    procedure SetRequestCount(Count: Integer);
  public
    constructor Create(ProxyInst: TServerConnMonitorMethodsClient;
                       ThrashBox: TMemo;
                       Interval: Integer); virtual;
    procedure Execute; override;
    property IsRunning: Boolean read FRunning write FRunning;
  end;

  TFmxMonitorClient = class(TForm)
    startButton: TButton;
    HostEdit: TEdit;
    CMCSQLConnection: TSQLConnection;
    IOMemo: TMemo;
    ReqCountLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    PortEdit: TNumberBox;
    Label3: TLabel;
    HammerEdit: TNumberBox;
    Label4: TLabel;
    procedure startButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FProxyInst, FServerConnMonitorMethodsClient: TServerConnMonitorMethodsClient;
    FIsStarted: Boolean;
    FThrasher: TServerThrasher;
    procedure SetUIAsDisabled;
    function GetConnectionMethodsClient : TServerConnMonitorMethodsClient;

  end;

var
  FmxMonitorClient: TFmxMonitorClient;

implementation

{$R *.fmx}

procedure UpdateReqCount(ReqCount: Integer);
Const
  ReqStr : String = 'Request Count: %d';
begin
  FmxMonitorClient.ReqCountLabel.Text := Format(ReqStr, [ReqCount]);
end;

procedure TFmxMonitorClient.startButtonClick(Sender: TObject);
var
  Interval: Integer;
begin
  if FIsStarted then
  begin
    if FThrasher <> nil then
      FThrasher.IsRunning := False;

    FThrasher := nil;

    FreeAndNil(FServerConnMonitorMethodsClient);
    FProxyInst := nil;

    FIsStarted := False;
    HammerEdit.Enabled := True;
    HostEdit.Enabled := True;
    PortEdit.Enabled := True;
    startButton.Text := 'START';

    CMCSQLConnection.Close;
  end
  else
  begin
    CMCSQLConnection.Params.Values['HostName'] := HostEdit.Text;
    CMCSQLConnection.Params.Values['Port'] := PortEdit.Text;
    CMCSQLConnection.Open;

    HammerEdit.Enabled := False;
    HostEdit.Enabled := False;
    PortEdit.Enabled := False;
    startButton.Text := 'STOP';

    UpdateReqCount(0);

    Interval := StrToInt(HammerEdit.Text);
    FIsStarted := True;

    FProxyInst := GetConnectionMethodsClient;

    FThrasher := TServerThrasher.Create(FProxyInst, IOMemo, Interval);
  end;
end;

procedure TFmxMonitorClient.FormActivate(Sender: TObject);
begin
  FThrasher := nil;
//  HostEdit.Text := EmptyStr;
end;


{ TServerThrasher }

constructor TServerThrasher.Create(ProxyInst: TServerConnMonitorMethodsClient;
                                   ThrashBox: TMemo;
                                   Interval: Integer);
begin
  inherited Create;

  FProxyInst := ProxyInst;
  FThrashBox := ThrashBox;
  FInterval := Interval;

  FRunning := True;
end;

procedure TServerThrasher.AddReversedString(Str: String);
begin
  TThread.Synchronize(nil, procedure
    begin
      FThrashBox.Lines.Add(Str);
    end);
end;

procedure TServerThrasher.SetRequestCount(Count: Integer);
begin
  TThread.Synchronize(nil, procedure
    begin
      UpdateReqCount(Count);
    end);
end;

function TServerThrasher.GetStringToReverse: String;
var
  Resp: String;
begin
  TThread.Synchronize(nil, procedure
    var
      Count: Integer;
    begin
      Count := FThrashBox.Lines.Count;
      if Count > 0 then
        Resp := FThrashBox.Lines.Strings[Count - 1];
    end);
  Result := Resp;
end;

procedure TServerThrasher.Execute;
var
  Str: String;
  Count: Integer;
begin
  inherited;
  FreeOnTerminate := True;

  Str := GetStringToReverse;

  try
    Count := 0;
    while IsRunning do
    begin
      Str := FProxyInst.ReverseString(Str);

      Inc(Count);

      AddReversedString(Str);
      SetRequestCount(Count);

      Sleep(FInterval);
    end;
  except
    //an exception happened in the proxy call
    if IsRunning then
      FmxMonitorClient.SetUIAsDisabled;
  end;
end;

function TFmxMonitorClient.GetConnectionMethodsClient: TServerConnMonitorMethodsClient;
begin
  if FServerConnMonitorMethodsClient = nil then
  begin
    CMCSQLConnection.Open;
    FServerConnMonitorMethodsClient :=
        TServerConnMonitorMethodsClient.Create(CMCSQLConnection.DBXConnection, True);
  end;
  Result := FServerConnMonitorMethodsClient;
end;

procedure TFmxMonitorClient.SetUIAsDisabled;
begin
  if FIsStarted then
  begin
    TThread.Synchronize(nil, procedure
      begin
        startButtonClick(nil);
      end);
  end;
end;


end.
