//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ReverseStringServerContainer;

interface

uses
  SysUtils, Classes, 
  DSTCPServerTransport,
  DSServer, DSCommonServer, DSHTTPCommon, DSHTTP, IPPeerServer, IndyPeerImpl;

type
  TServerContainer3 = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    DSHTTPService1: TDSHTTPService;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
  end;

procedure RunDSServer;

implementation

uses Windows, ReverseStringServerMethods;

{$R *.dfm}

procedure TServerContainer3.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ReverseStringServerMethods.TServerMethods;
end;

procedure RunDSServer;
var
  LModule: TServerContainer3;
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
begin
  LModule := TServerContainer3.Create(nil);
  try
  Writeln(Format('DataSnap 2010 server on TCP/ip port %d, HTTP port %d',
    [LModule.DSTCPServerTransport1.Port, LModule.DSHTTPService1.HttpPort]));
    LModule.DSServer1.Start;
    try
      Writeln('Press ESC to stop the server');
      LHandle := GetStdHandle(STD_INPUT_HANDLE);
      while True do
      begin
        Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
        if (LInputRecord.EventType = KEY_EVENT) and
        LInputRecord.Event.KeyEvent.bKeyDown and
        (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
          break;
      end;
    finally
      LModule.DSServer1.Stop;
    end;
  finally
    LModule.Free;
  end;
end;

end.




