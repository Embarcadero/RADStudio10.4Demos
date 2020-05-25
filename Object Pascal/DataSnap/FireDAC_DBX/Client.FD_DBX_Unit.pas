//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Client.FD_DBX_Unit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, Data.FMTBcd, REST.Backend.EMSServices,
  REST.Backend.EMSFireDAC, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DbxDatasnap,
  IPPeerClient, Data.DBXCommon, FireDAC.Comp.Client, FMX.Controls.Presentation,
  FMX.StdCtrls, System.Actions, FMX.ActnList, System.Rtti, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.Layouts, FMX.Grid,
  FireDAC.Phys.DSDef, FireDAC.Phys.TDBXBase, FireDAC.Phys.DS,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Data.DbxHTTPLayer, Datasnap.DSClientRest,
  DataSnap.DSProxyRest, FMX.Grid.Style, FMX.ScrollBox;

type
  TClientForm = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    ActionList1: TActionList;
    ActionGetTables: TAction;
    ActionPostUpdates: TAction;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Panel2: TPanel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    SQLConnection1: TSQLConnection;
    httpCheckBox: TCheckBox;
    DSRestConnection1: TDSRestConnection;
    RESTCheckBox: TCheckBox;
    Button4: TButton;
    ActionCancelUpdates: TAction;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionGetTablesExecute(Sender: TObject);
    procedure ActionPostUpdatesExecute(Sender: TObject);
    procedure ActionPostUpdatesUpdate(Sender: TObject);
    procedure httpCheckBoxChange(Sender: TObject);
    procedure RESTCheckBoxChange(Sender: TObject);
    procedure ActionCancelUpdatesExecute(Sender: TObject);
  private
    { Private declarations }
    function CanPost: Boolean;
    function CreateServerConnection: TObject;
  public
    { Public declarations }
    procedure GetTables;
    procedure PostTables;
  end;

var
  ClientForm: TClientForm;

implementation

{$R *.fmx}

uses
  ClientModule.FD_DBX_Unit,
  Client.ServerMethods.FD_DBX_Unit, Client.ServerMethodsREST.FD_DBX_Unit, FMX.DialogService;


function TClientForm.CreateServerConnection: TObject;
begin
  if RESTCheckBox.IsChecked then
    Result := TServerRESTMethodsClient.Create(DSRestConnection1)
  else
    Result := TServerMethodsClient.Create(SQLConnection1.DBXConnection);
end;

procedure TClientForm.ActionCancelUpdatesExecute(Sender: TObject);
begin
  DataModuleFDClient.FDSchemaAdapter.CancelUpdates;
end;

procedure TClientForm.ActionGetTablesExecute(Sender: TObject);
begin
  GetTables;
end;

procedure TClientForm.ActionPostUpdatesExecute(Sender: TObject);
begin
  PostTables
end;

procedure TClientForm.FormCreate(Sender: TObject);
begin
    SQLConnection1.Connected := True;
end;

// Copy stream without using .Size or .Seek
function CopyStream(const AStream: TStream): TMemoryStream;
var
  LBuffer: TBytes;
  LCount: Integer;
begin
  Result := TMemoryStream.Create;
  try
    SetLength(LBuffer, 1024 * 32);
    while True do
    begin
      LCount := AStream.Read(LBuffer, Length(LBuffer));
      Result.Write(LBuffer, LCount);
      if LCount < Length(LBuffer) then
        break;
    end;
  except
    Result.Free;
    raise;
  end;
end;

procedure TClientForm.httpCheckBoxChange(Sender: TObject);
begin
  if httpCheckBox.IsChecked then
  begin
    SQLConnection1.Params.Values['Port'] := '8080';
    SQLConnection1.Params.Values['CommunicationProtocol'] := 'http';
  end
  else
  begin
    SQLConnection1.Params.Values['Port'] := '211';
    SQLConnection1.Params.Values['CommunicationProtocol'] := 'tcp/ip';
  end;
end;

procedure TClientForm.RESTCheckBoxChange(Sender: TObject);
begin
  httpCheckBox.Enabled := not RESTCheckBox.IsChecked;
end;

function TClientForm.CanPost: Boolean;
var
  I: Integer;
  LDataSet: TFDAdaptedDataSet;
begin
  Result := (DataModuleFDClient.FDSchemaAdapter <> nil);
  if Result then
  begin
    Result := False;
    for I := 0 to DataModuleFDClient.FDSchemaAdapter.Count - 1 do
    begin
      LDataSet := DataModuleFDClient.FDSchemaAdapter.DataSets[I];
      if (LDataSet.ChangeCount > 0) or (LDataSet.State in dsEditModes) then
      begin
        Result := True;
        break;
      end;
    end;
  end;
end;

procedure TClientForm.ActionPostUpdatesUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := CanPost;
end;

procedure TClientForm.Button1Click(Sender: TObject);
var
  AString: string;
  Server: TObject;
begin
  TDialogService.InputQuery('Reverse String', ['Enter a String'], [''],
    procedure(const AResult: TModalResult; const AValues: array of string)
    begin
      if not AValues[0].IsEmpty then
      begin
        AString := AValues[0];
        try
          Server := CreateServerConnection;
          if Server is TServerRESTMethodsClient then
            ShowMessage(TServerRESTMethodsClient(Server).ReverseString(AString))
          else
            ShowMessage(TServerMethodsClient(Server).ReverseString(AString));
        finally
          Server.Free;
        end;
      end;
    end);
end;

procedure TClientForm.GetTables;
var
  LMemStream: TMemoryStream;
  Server: TObject;
begin
  Server := CreateServerConnection;
  if Server is TServerRESTMethodsClient then
    LMemStream := CopyStream(TServerRESTMethodsClient(Server).StreamGet)
  else
    LMemStream := CopyStream(TServerMethodsClient(Server).StreamGet);
  try
    if LMemStream <> nil then
    begin
      LMemStream.Position := 0;
      DataModuleFDClient.FDSchemaAdapter.LoadFromStream(LMemStream, TFDStorageFormat.sfBinary);
    end;
  finally
    LMemStream.Free;
  end;
end;

procedure TClientForm.PostTables;
var
  LMemStream: TMemoryStream;
  Server: TObject;
  I: integer;
  LDataSet: TDataSet;
  LResponseMessage: string;
begin
  for I := 0 to DataModuleFDClient.FDSchemaAdapter.Count - 1 do
  begin
    LDataSet := DataModuleFDClient.FDSchemaAdapter.DataSets[I];
    if LDataSet <> nil then
      if LDataSet.State in dsEditModes then
        LDataSet.Post;
  end;

  LMemStream := TMemoryStream.Create;
  Server := CreateServerConnection;
  try
    DataModuleFDClient.FDSchemaAdapter.ResourceOptions.StoreItems := [siDelta, siMeta];
    DataModuleFDClient.FDSchemaAdapter.SaveToStream(LMemStream, TFDStorageFormat.sfBinary);
    LMemStream.Position := 0;
    try
      if Server is TServerRESTMethodsClient then
        LResponseMessage := TServerRESTMethodsClient(Server).StreamPost(LMemStream)
      else
        LResponseMessage := TServerMethodsClient(Server).StreamPost(LMemStream);
    except
      On E: Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    if LResponseMessage <> '' then
      raise Exception.Create(LResponseMessage);
    Server.Free;
  end;
end;

end.
