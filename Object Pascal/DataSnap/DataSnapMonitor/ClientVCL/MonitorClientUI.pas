//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MonitorClientUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CMClientClassesUnit, Menus;

type

  TServerThrasher = class(TThread)
  private
    FProxyInst: TServerConnMonitorMethodsClient;
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

  TClientUIForm = class(TForm)
    Label1: TLabel;
    HammerEdit: TEdit;
    Label2: TLabel;
    IOMemo: TMemo;
    startButton: TButton;
    Label3: TLabel;
    HostEdit: TEdit;
    Label4: TLabel;
    PortEdit: TEdit;
    CMPopupMenu: TPopupMenu;
    ClearLogItem: TMenuItem;
    ReqCountLabel: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure startButtonClick(Sender: TObject);
    procedure ClearLogItemClick(Sender: TObject);
  private
    FIsStarted: Boolean;
    FProxyInst: TServerConnMonitorMethodsClient;
    FThrasher: TServerThrasher;
//    procedure UpdateReqCount( ReqCount : Integer);
  public
    procedure SetUIAsDisabled;
  end;

var
  ClientUIForm: TClientUIForm;

implementation

uses Winsock, CMClientModuleUnit;

{$R *.dfm}

function GetIPAddress:String;
type
  pu_long = ^u_long;
var
  varTWSAData: TWSAData;
  varPHostEnt: PHostEnt;
  varTInAddr: TInAddr;
  namebuf: Array[0..255] of AnsiChar;
begin
  if WSAStartup($101, varTWSAData) <> 0 then
    Result := '127.0.0.1'
  else
  begin
    gethostname(namebuf, sizeof(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    Result := '' + inet_ntoa(varTInAddr);
  end;
  WSACleanup;
end;

procedure UpdateReqCount(ReqCount: Integer);
Const
  ReqStr : String = 'Request Count: %d';
begin
  ClientUIForm.ReqCountLabel.Caption := Format(ReqStr, [ReqCount]);
end;

procedure TClientUIForm.ClearLogItemClick(Sender: TObject);
begin
  IOMemo.Text := 'Hello world, this is a line of text to reverse.';
end;

procedure TClientUIForm.FormActivate(Sender: TObject);
begin
  FThrasher := nil;
  HostEdit.Text := GetIPAddress;
end;

procedure TClientUIForm.SetUIAsDisabled;
begin
  if FIsStarted then
  begin
    TThread.Synchronize(nil, procedure
      begin
        startButtonClick(nil);
      end);
  end;
end;

procedure TClientUIForm.startButtonClick(Sender: TObject);
var
  Interval: Integer;
begin
  if FIsStarted then
  begin
    if FThrasher <> nil then
      FThrasher.IsRunning := False;

    FThrasher := nil;

    FIsStarted := False;
    HammerEdit.Enabled := True;
    HostEdit.Enabled := True;
    PortEdit.Enabled := True;
    startButton.Caption := 'START';

    CMClientModule.CloseCMClient;
  end
  else
  begin
    CMClientModule.CMCSQLConnection.Params.Values['HostName'] := HostEdit.Text;
    CMClientModule.CMCSQLConnection.Params.Values['Port'] := PortEdit.Text;

//    try
      HammerEdit.Enabled := False;
      HostEdit.Enabled := False;
      PortEdit.Enabled := False;
      startButton.Caption := 'STOP';

      UpdateReqCount(0);

      Interval := StrToInt(HammerEdit.Text);
      FIsStarted := True;

      FProxyInst := CMClientModule.ServerConnMonitorMethodsClient;

      FThrasher := TServerThrasher.Create(FProxyInst, IOMemo, Interval);
//    finally
//    end;
  end;
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

//  try
    Count := 0;
    while IsRunning do
    begin
      Str := FProxyInst.ReverseString(Str);

      Inc(Count);

      AddReversedString(Str);
      SetRequestCount(Count);

      Sleep(FInterval);
    end;
//  except
    //an exception happened in the proxy call
//    if IsRunning then
//      ClientUIForm.SetUIAsDisabled;
//  end;
end;


end.
