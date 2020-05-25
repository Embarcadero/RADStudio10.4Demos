//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ServerContainerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DBXPlatform,
  MethodsServerModule,
  DSCommonServer,
  DSNames,
  DSServer,
  DSTCPServerTransport,
  Dialogs, DSTransport, DBXCommon, DBXTrace, WideStrings, DB, SqlExpr,
  DBXDynalink, DBXDynalinkNative, DbxMySql, Grids, DBGrids, DBClient, StdCtrls,
  ParametersServerModule, ProviderServerModule, IPPeerServer, IndyPeerImpl;

type
  TForm8 = class(TForm)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ActiveConnections: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    EventLog: TClientDataSet;
    DataSource2: TDataSource;
    DSServerClass2: TDSServerClass;
    DSServerClass3: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServer1Connect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure InsertEvent(Name: String);
    procedure DSServerClass2GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerClass3GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}




procedure TForm8.DSServer1Connect(DSConnectEventObject: TDSConnectEventObject);
begin
 ActiveConnections.Insert;
 if DSConnectEventObject.ChannelInfo <> nil then
 begin
   ActiveConnections['ID'] := DSConnectEventObject.ChannelInfo.Id;
   ActiveConnections['Info'] := DSConnectEventObject.ChannelInfo.Info;
 end;
 ActiveConnections['UserName'] := DSConnectEventObject.ConnectProperties[TDBXPropertyNames.UserName];
 ActiveConnections['ServerConnection'] := DSConnectEventObject.ConnectProperties[TDBXPropertyNames.ServerConnection];
 ActiveConnections.Post;

 InsertEvent('Connect');

end;

procedure TForm8.DSServer1Disconnect(
  DSConnectEventObject: TDSConnectEventObject);
begin
  if ActiveConnections.Locate('ID', DSConnectEventObject.ChannelInfo.Id,[]) then
    ActiveConnections.Delete;
 InsertEvent('DisConnect');
end;


procedure TForm8.DSServerClass1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TServerModule1;
end;

procedure TForm8.DSServerClass2GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TParametersServerModule1;
end;

procedure TForm8.DSServerClass3GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDSServerModule2;
end;

procedure TForm8.FormDestroy(Sender: TObject);
begin
  DSServer1.Stop;
end;

procedure TForm8.InsertEvent(Name: String);
begin
  EventLog.DisableControls;
  EventLog.Insert;
  EventLog.FieldByName('EventName').AsString := Name;
  EventLog.FieldByName('Time').AsDateTime := Now;
  EventLog.Post;
  EventLog.EnableControls;
end;

end.
