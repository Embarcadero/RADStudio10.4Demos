//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ClientUnit;

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
  FireDAC.Comp.DataSet, Datasnap.DSClientRest, FireDAC.FMXUI.Wait,
  System.Generics.Collections, FMX.Grid.Style, FMX.ScrollBox;

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
    FDPhysDSDriverLink1: TFDPhysDSDriverLink;
    FDConnection1: TFDConnection;
    FDStoredProcReverse: TFDStoredProc;
    FDStoredProcGet: TFDStoredProc;
    FDStoredProcPost: TFDStoredProc;
    Button4: TButton;
    ActionCancelUpdates: TAction;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionGetTablesExecute(Sender: TObject);
    procedure ActionPostUpdatesExecute(Sender: TObject);
    procedure ActionPostUpdatesUpdate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionCancelUpdatesExecute(Sender: TObject);
  private
    { Private declarations }
    function CanPost: Boolean;
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
  ClientModuleUnit, FMX.DialogService;

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

procedure TClientForm.ActionPostUpdatesUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := CanPost;
end;

procedure TClientForm.Button1Click(Sender: TObject);
var
  AString: string;
begin
  TDialogService.InputQuery('Reverse String', ['Enter a String'], [''],
    procedure(const AResult: TModalResult; const AValues: array of string)
    begin
      if not AValues[0].IsEmpty then
      begin
        AString := AValues[0];
        FDStoredProcReverse.Params[0].Value := AString;
        FDStoredProcReverse.ExecProc;
        ShowMessage(FDStoredProcReverse.Params[1].AsWideString);
      end
    end);
end;

procedure TClientForm.FormCreate(Sender: TObject);
begin
  FDConnection1.Connected := True;
end;

procedure TClientForm.FormDestroy(Sender: TObject);
begin
  FDConnection1.Connected := False;
end;

procedure TClientForm.GetTables;
var
  LStringStream: TStringStream;
begin
  FDStoredProcGet.ExecProc;
  LStringStream := TStringStream.Create(FDStoredProcGet.Params[0].asBlob);
  try
    if LStringStream <> nil then
    begin
      LStringStream.Position := 0;
      DataModuleFDClient.FDSchemaAdapter.LoadFromStream(LStringStream, TFDStorageFormat.sfBinary);
    end;
  finally
    LStringStream.Free;
  end;
end;

procedure TClientForm.PostTables;
var
  LMemStream: TMemoryStream;
  I: integer;
  LDataSet: TDataSet;
begin
  for I := 0 to DataModuleFDClient.FDSchemaAdapter.Count - 1 do
  begin
    LDataSet := DataModuleFDClient.FDSchemaAdapter.DataSets[I];
    if LDataSet <> nil then
      if LDataSet.State in dsEditModes then
        LDataSet.Post;
  end;

  LMemStream := TMemoryStream.Create;
  try
    DataModuleFDClient.FDSchemaAdapter.ResourceOptions.StoreItems := [siDelta, siMeta];
    DataModuleFDClient.FDSchemaAdapter.SaveToStream(LMemStream, TFDStorageFormat.sfBinary);
    LMemStream.Position := 0;
    FDStoredProcPost.Params[0].asStream:= LMemStream;
    FDStoredProcPost.ExecProc;
  except
    On E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

end.
