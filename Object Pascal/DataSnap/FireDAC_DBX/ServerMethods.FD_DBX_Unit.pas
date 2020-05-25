//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ServerMethods.FD_DBX_Unit;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Stan.Param, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageJSON, FireDAC.Comp.UI,
  FireDAC.Stan.StorageBin, System.Generics.Collections;

type
  TServerMethods = class(TDSServerModule)
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    FDSchemaAdapter: TFDSchemaAdapter;
    qCustomers: TFDQuery;
    qOrders: TFDQuery;
    dsCustomers: TDataSource;
    dsOrders: TDataSource;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure DataSetUpdateError(ASender: TDataSet; AException: EFDException;
      ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction);
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FErrorsList: TList<TJSONObject>;
    function GenerateErrorMessage: string;
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function StreamGet: TStream;
    function StreamPost(AStream: TStream): string;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses
  System.Variants, System.StrUtils;

const
    sErrorsOnApplyUpdates = 'Unexpected errors applying updates:'#10#13'%s';

procedure TServerMethods.DataSetUpdateError(ASender: TDataSet;
  AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction);
var
  LFieldsList: TStringList;
  I: integer;
  LDataStr: string;
  LDataStrOldValue: string;
  LJSONObject, LJSONArrayItem: TJSONObject;
  LJSONArray: TJSONArray;
begin
  LFieldsList := TStringList.create;
  try
    LJSONObject := TJSONObject.Create;
    try
      LJSONObject.AddPair('ErrorMessage', AException.Message);
      LJSONObject.AddPair('DataSource', ASender.Name);
      ASender.GetFieldNames(LFieldsList);
      LJSONArray := TJSONArray.Create;
      try
        for I := 0 to LFieldsList.Count - 1 do
        begin
          LDataStr := '';
          LDataStrOldValue := '';
          if not VarIsNull(ARow.GetData(LFieldsList[I])) then
            LDataStr := ARow.GetData(LFieldsList[I]);
          if not VarIsNull(ASender.FieldByName(LFieldsList[I]).OldValue) then
            LDataStrOldValue := ASender.FieldByName(LFieldsList[I]).OldValue;

          if LDataStr <> LDataStrOldValue then
          begin
            LJSONArrayItem := TJSONObject.Create;
            try
              LJSONArrayItem.AddPair('RowID', ARow.RowID.ToString);
              LJSONArrayItem.AddPair('FieldName', LFieldsList[I]);
              LJSONArrayItem.AddPair('OldValue', TJSONstring.Create(LDataStrOldValue));
              LJSONArrayItem.AddPair('NewValue', TJSONstring.Create(LDataStr));
              LJSONArray.AddElement(LJSONArrayItem);
            except
              LJSONArrayItem.Free;
              raise;
            end;
          end;
        end;
      except
        LJSONArray.Free;
        raise;
      end;
      LJSONObject.AddPair('Changes', LJSONArray);
      FErrorsList.Add(LJSONObject);
    except
      LJSONObject.Free;
    end;
  finally
    LFieldsList.Free;
  end;
end;

procedure TServerMethods.DSServerModuleCreate(Sender: TObject);
begin
  FErrorsList := TList<TJSONObject>.create;
end;

procedure TServerMethods.DSServerModuleDestroy(Sender: TObject);
begin
  FErrorsList.Free;
end;

function TServerMethods.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods.GenerateErrorMessage: string;
var
  I: integer;
  LJSONObject : TJSONObject;
  LJSONArray: TJSONArray;
begin
  LJSONObject := TJSONObject.Create;
  try
    LJSONArray := TJSONArray.Create;
    try
      for I := FErrorsList.Count - 1 downto 0 do
        LJSONArray.Add(FErrorsList[I]);

      LJSONObject.AddPair('Errors', LJSONArray);
      Result := LJSONObject.ToJSON;
    except
      LJSONArray.Free;
    end;
  except
    LJSONObject.Free
  end;
  FErrorsList.Clear;
end;

function TServerMethods.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
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

function TServerMethods.StreamGet: TStream;
begin
  Result := TMemoryStream.Create;
  try
    qCustomers.Close;
    qCustomers.Open;
    qOrders.Close;
    qOrders.Open;
    FDSchemaAdapter.SaveToStream(Result, TFDStorageFormat.sfBinary);
    Result.Position := 0;
  finally
//
  end;
end;

function TServerMethods.StreamPost(AStream: TStream): string;
var
  LMemStream: TMemoryStream;
  LErrors: Integer;
begin
  Result := '';
  // Retreive entire stream from client
  LMemStream := CopyStream(AStream);
  LMemStream.Position := 0;
  try
    FDSchemaAdapter.LoadFromStream(LMemStream, TFDStorageFormat.sfBinary);
    LErrors := FDSchemaAdapter.ApplyUpdates
  finally
    LMemStream.Free;
    if LErrors > 0 then
      Result := Format(sErrorsOnApplyUpdates , [GenerateErrorMessage]);
  end;
end;


end.

