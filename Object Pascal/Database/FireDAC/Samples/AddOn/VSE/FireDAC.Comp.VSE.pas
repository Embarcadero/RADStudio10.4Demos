
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{     FireDAC Virtual Storage Engine base classes       }
{                                                       }
{ Copyright(c) 2004-2013 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}
{$I ..\..\FireDAC.inc}

unit FireDAC.Comp.VSE;

interface

uses
  Classes, DB,
  FireDAC.Stan.Intf, FireDAC.DatS,
  FireDAC.Comp.DataSet;

type
  TFDVSEFieldDef = class;
  TFDVSEFieldDefs = class;
  TFDVSESchema = class;
  TFDVSESchemas = class;
  TFDVSESessionField = class;
  TFDVSESessionFields = class;
  TFDVSESession = class;
  TFDVSEManager = class;

  TFDVSEFieldDefClass = class of TFDVSEFieldDef;
  TFDVSEFieldDefsClass = class of TFDVSEFieldDefs;
  TFDVSESchemaClass = class of TFDVSESchema;
  TFDVSESchemasClass = class of TFDVSESchemas;
  TFDVSESessionFieldClass = class of TFDVSESessionField;
  TFDVSESessionFieldsClass = class of TFDVSESessionFields;
  TFDVSESessionClass = class of TFDVSESession;
  TFDVSESessionsClass = class of TFDVSESessions;

  {-----------------------------------------------------------------------------}
  // A virtual storage definition classes

  TFDVSEFieldMode = (fmDisabled, fmInvisible, fmVisible);

  // A field definition
  TFDVSEFieldDef = class(TNamedItem)
  private
    FID: Integer;
    FName: String;
    FPrecision: Integer;
    FDataType: TFDDataType;
    FSize: Integer;
    FScale: Integer;
    FMode: TFDVSEFieldMode;
    function GetSchema: TFDVSESchema;
    function GetStorage: TFDVSEManager;
    function GetActualMode: TFDVSEFieldMode;
  protected
    function GetDisplayName: String; override;
  public
    constructor Create(ACollection: TCollection); override;
    procedure Assign(AValue: TPersistent); override;
    property Schema: TFDVSESchema read GetSchema;
    property Storage: TFDVSEManager read GetStorage;
    property ActualMode: TFDVSEFieldMode read GetActualMode;
  published
    property ID: Integer read FID write FID;
    property Name: String read FName write FName;
    property DataType: TFDDataType read FDataType write FDataType default dtUnknown;
    property Size: Integer read FSize write FSize default 0;
    property Precision: Integer read FPrecision write FPrecision default 0;
    property Scale: Integer read FScale write FScale default 0;
    property Mode: TFDVSEFieldMode read FMode write FMode default fmVisible;
  end;

  // A collection of the field definitions
  TFDVSEFieldDefs = class(TOwnedCollection)
  private
    function GetItems(AIndex: integer): TFDVSEFieldDef;
    function GetSchema: TFDVSESchema;
    function GetStorage: TFDVSEManager;
  public
    constructor Create(ASchema: TFDVSESchema);
    function Add: TFDVSEFieldDef;
    property Schema: TFDVSESchema read GetSchema;
    property Storage: TFDVSEManager read GetStorage;
    property Items[AIndex: integer]: TFDVSEFieldDef read GetItems; default;
  end;

  // A named set of the field definitions
  TFDVSESchema = class(TCollectionItem)
  private
    FName: String;
    FFieldDefs: TFDVSEFieldDefs;
    FMode: TFDVSEFieldMode;
    function GetStorage: TFDVSEManager;
    procedure SetFieldDefs(const AValue: TFDVSEFieldDefs);
  protected
    function GetDisplayName: String; override;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(AValue: TPersistent); override;
    property Storage: TFDVSEManager read GetStorage;
  published
    property Name: String read FName write FName;
    property Mode: TFDVSEFieldMode read FMode write FMode default fmVisible;
    property FieldDefs: TFDVSEFieldDefs read FFieldDefs write SetFieldDefs;
  end;

  // A collection of schemas
  TFDVSESchemas = class(TOwnedCollection)
  private
    function GetItems(AIndex: integer): TFDVSESchema;
    function GetStorage: TFDVSEManager;
  public
    constructor Create(AStorage: TFDVSEManager);
    function Add: TFDVSESchema;
    property Storage: TFDVSEManager read GetStorage;
    property Items[AIndex: integer]: TFDVSESchema read GetItems; default;
  end;

  {-----------------------------------------------------------------------------}
  // A virtual storage session (run-time) classes

  // A field-def to column mapping
  TFDVSESessionField = class(TCollectionItem)
  private
    FFieldDef: TFDVSEFieldDef;
    FColumn: TFDDatSColumn;
    FMode: TFDVSEFieldMode;
    function GetSession: TFDVSESession;
    function GetStorage: TFDVSEManager;
  public
    destructor Destroy; override;
    property Session: TFDVSESession read GetSession;
    property Storage: TFDVSEManager read GetStorage;
    property FieldDef: TFDVSEFieldDef read FFieldDef;
    property Column: TFDDatSColumn read FColumn;
    property Mode: TFDVSEFieldMode read FMode write FMode;
  end;

  // A collection of mappings
  TFDVSESessionFields = class(TOwnedCollection)
  private
    function GetItems(AIndex: integer): TFDVSESessionField;
    function GetSession: TFDVSESession;
    function GetStorage: TFDVSEManager;
  public
    constructor Create(ASession: TFDVSESession);

    procedure AddAll;
    function AddField(AFieldDef: TFDVSEFieldDef): TFDVSESessionField;
    function FindField(const AFieldName: String): TFDVSESessionField;
    function FieldByName(const AFieldName: String): TFDVSESessionField;

    property Session: TFDVSESession read GetSession;
    property Storage: TFDVSEManager read GetStorage;
    property Items[AIndex: integer]: TFDVSESessionField read GetItems; default;
  end;

  // A base column & virtual columns & storage engine binding (run-time session)
  TFDVSESession = class(TCollectionItem, IUnknown,
    IFDStanExpressionEvaluator, IFDDataSetListener)
  private
    FOwner: TObject;
    FBaseColumnName: String;

    FTable: TFDDatSTable;
    FBaseColumn: TFDDatSColumn;
    FRow: TFDDatSRow;
    FBuff: Pointer;
    FLen: LongWord;
    FFields: TFDVSESessionFields;
    FDataSource: IFDStanExpressionDataSource;
    function GetStorage: TFDVSEManager;
    function GetDataSet: TFDDataSet;

  protected
    // IUnknown
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    // IFDStanExpressionEvaluator
    function GetSubAggregateCount: Integer;
    function GetSubAggregateKind(AIndex: Integer): TFDAggregateKind;
    function GetDataSource: IFDStanExpressionDataSource;
    function GetDataType: TFDDataType;
    function HandleNotification(AKind: Word; AReason: Word;
      AParam1, AParam2: NativeInt): Boolean;
    function Evaluate: Variant;
    function EvaluateSubAggregateArg(AIndex: Integer): Variant;

    // IFDDataSetListener
    procedure ResultsetDefined(ADataSet: TFDDataSet);
    procedure ResultsetReleasing(ADataSet: TFDDataSet);
    procedure ResultsetActivated(ADataSet: TFDDataSet);

    // introduced
    procedure DoAttaching; virtual;
    procedure DoAttached; virtual;
    procedure DoDetaching; virtual;
    procedure DoDetached; virtual;

  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;

    procedure Attach(ATable: TFDDatSTable = nil);
    procedure Detach;
    procedure ApplyVisibility(ADataSet: TDataSet);

    property Storage: TFDVSEManager read GetStorage;

    property Row: TFDDatSRow read FRow;
    property Buff: Pointer read FBuff;
    property Len: LongWord read FLen;

    property DataSet: TFDDataSet read GetDataSet;
    property Table: TFDDatSTable read FTable;
    property BaseColumn: TFDDatSColumn read FBaseColumn;
    property Fields: TFDVSESessionFields read FFields;
  end;

  // A collection of sessions
  TFDVSESessions = class(TOwnedCollection)
  private
    function GetStorage: TFDVSEManager;
    function GetItems(AIndex: integer): TFDVSESession;
  public
    constructor Create(AStorage: TFDVSEManager);
    function FindSession(AOwner: TObject; const ABaseColumnName: String): TFDVSESession;
    function AddSession(AOwner: TObject; const ABaseColumnName: String): TFDVSESession;
    function EnsureSession(AOwner: TObject; const ABaseColumnName: String): TFDVSESession;
    property Storage: TFDVSEManager read GetStorage;
    property Items[AIndex: integer]: TFDVSESession read GetItems; default;
  end;

  // A decoder and corresponding dictionary
  TFDVSESessionEvent = procedure (ASender: TFDVSEManager;
    ASession: TFDVSESession; ADataSet: TFDDataSet) of object;
  TFDVSEManager = class(TFDComponent)
  private
    FSchemas: TFDVSESchemas;
    FSessions: TFDVSESessions;
    FOnDecode: TFDVSESessionEvent;
    FOnResultsetDefined: TFDVSESessionEvent;
    FOnResultsetReleasing: TFDVSESessionEvent;
    FOnResultsetActivated: TFDVSESessionEvent;
    FAutoManage: Boolean;
    procedure SetSchemas(const AValue: TFDVSESchemas);
  protected
    class function GetFieldDefClass: TFDVSEFieldDefClass; virtual;
    class function GetFieldDefsClass: TFDVSEFieldDefsClass; virtual;
    class function GetSchemaClass: TFDVSESchemaClass; virtual;
    class function GetSchemasClass: TFDVSESchemasClass; virtual;
    class function GetSessionFieldClass: TFDVSESessionFieldClass; virtual;
    class function GetSessionFieldsClass: TFDVSESessionFieldsClass; virtual;
    class function GetSessionClass: TFDVSESessionClass; virtual;
    class function GetSessionsClass: TFDVSESessionsClass; virtual;

    procedure DoResultsetDefined(ASession: TFDVSESession; ADataSet: TFDDataSet); virtual;
    procedure DoResultsetReleasing(ASession: TFDVSESession; ADataSet: TFDDataSet); virtual;
    procedure DoResultsetActivated(ASession: TFDVSESession; ADataSet: TFDDataSet); virtual;
    procedure DoDecode(ASession: TFDVSESession; ADataSet: TFDDataSet); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Sessions: TFDVSESessions read FSessions;
  published
    property AutoManage: Boolean read FAutoManage write FAutoManage;
    property Schemas: TFDVSESchemas read FSchemas write SetSchemas;
    property OnResultsetDefined: TFDVSESessionEvent read FOnResultsetDefined
      write FOnResultsetDefined;
    property OnResultsetReleasing: TFDVSESessionEvent read FOnResultsetReleasing
      write FOnResultsetReleasing;
    property OnResultsetActivated: TFDVSESessionEvent read FOnResultsetActivated
      write FOnResultsetActivated;
    property OnDecode: TFDVSESessionEvent read FOnDecode write FOnDecode;
  end;

implementation

uses
  Variants, SysUtils;

{-------------------------------------------------------------------------------}
{ TFDVSEFieldDef                                                                }
{-------------------------------------------------------------------------------}
constructor TFDVSEFieldDef.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FMode := fmVisible;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSEFieldDef.Assign(AValue: TPersistent);
begin
  if AValue is TFDVSEFieldDef then begin
    ID := TFDVSEFieldDef(AValue).ID;
    Name := TFDVSEFieldDef(AValue).Name;
    DataType := TFDVSEFieldDef(AValue).DataType;
    Size := TFDVSEFieldDef(AValue).Size;
    Precision := TFDVSEFieldDef(AValue).Precision;
    Scale := TFDVSEFieldDef(AValue).Scale;
    Mode := TFDVSEFieldDef(AValue).Mode;
  end
  else
    inherited Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDVSEFieldDef.GetDisplayName: String;
begin
  if Name <> '' then
    Result := Name
  else
    Result := inherited GetDisplayName;
end;

{-------------------------------------------------------------------------------}
function TFDVSEFieldDef.GetSchema: TFDVSESchema;
begin
  Result := (Collection as TFDVSEFieldDefs).Schema;
end;

{-------------------------------------------------------------------------------}
function TFDVSEFieldDef.GetStorage: TFDVSEManager;
begin
  Result := (Collection as TFDVSEFieldDefs).Storage;
end;

{-------------------------------------------------------------------------------}
function TFDVSEFieldDef.GetActualMode: TFDVSEFieldMode;
begin
  Result := fmVisible;
  case Schema.Mode of
  fmDisabled:    Result := fmDisabled;
  fmInvisible:
    case Mode of
    fmDisabled:  Result := fmDisabled;
    fmInvisible,
    fmVisible:   Result := fmInvisible;
    end;
  fmVisible:     Result := Mode;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDVSEFieldDefs                                                               }
{-------------------------------------------------------------------------------}
constructor TFDVSEFieldDefs.Create(ASchema: TFDVSESchema);
begin
  inherited Create(ASchema, ASchema.Storage.GetFieldDefClass);
end;

{-------------------------------------------------------------------------------}
function TFDVSEFieldDefs.GetItems(AIndex: integer): TFDVSEFieldDef;
begin
  Result := TFDVSEFieldDef(inherited Items[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDVSEFieldDefs.Add: TFDVSEFieldDef;
begin
  Result := TFDVSEFieldDef(inherited Add);
end;

{-------------------------------------------------------------------------------}
function TFDVSEFieldDefs.GetSchema: TFDVSESchema;
begin
  Result := (GetOwner as TFDVSESchema);
end;

{-------------------------------------------------------------------------------}
function TFDVSEFieldDefs.GetStorage: TFDVSEManager;
begin
  Result := (GetOwner as TFDVSESchema).Storage;
end;

{-------------------------------------------------------------------------------}
{ TFDVSESchema                                                                  }
{-------------------------------------------------------------------------------}
constructor TFDVSESchema.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FFieldDefs := Storage.GetFieldDefsClass.Create(Self);
  FMode := fmVisible;
end;

{-------------------------------------------------------------------------------}
destructor TFDVSESchema.Destroy;
begin
  FreeAndNil(FFieldDefs);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESchema.Assign(AValue: TPersistent);
begin
  if AValue is TFDVSESchema then begin
    Name := TFDVSESchema(AValue).Name;
    FieldDefs := TFDVSESchema(AValue).FieldDefs;
    Mode := TFDVSESchema(AValue).Mode;
  end
  else
    inherited Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDVSESchema.GetDisplayName: String;
begin
  if Name <> '' then
    Result := Name
  else
    Result := inherited GetDisplayName;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESchema.SetFieldDefs(const AValue: TFDVSEFieldDefs);
begin
  FFieldDefs.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDVSESchema.GetStorage: TFDVSEManager;
begin
  Result := (Collection as TFDVSESchemas).Storage;
end;

{-------------------------------------------------------------------------------}
{ TFDVSESchemas                                                                 }
{-------------------------------------------------------------------------------}
constructor TFDVSESchemas.Create(AStorage: TFDVSEManager);
begin
  inherited Create(AStorage, AStorage.GetSchemaClass);
end;

{-------------------------------------------------------------------------------}
function TFDVSESchemas.GetItems(AIndex: integer): TFDVSESchema;
begin
  Result := TFDVSESchema(inherited Items[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDVSESchemas.Add: TFDVSESchema;
begin
  Result := TFDVSESchema(inherited Add);
end;

{-------------------------------------------------------------------------------}
function TFDVSESchemas.GetStorage: TFDVSEManager;
begin
  Result := GetOwner as TFDVSEManager;
end;

{-------------------------------------------------------------------------------}
{ TFDVSESessionField                                                            }
{-------------------------------------------------------------------------------}
destructor TFDVSESessionField.Destroy;
begin
  FreeAndNil(FColumn);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessionField.GetSession: TFDVSESession;
begin
  Result := (Collection as TFDVSESessionFields).Session;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessionField.GetStorage: TFDVSEManager;
begin
  Result := (Collection as TFDVSESessionFields).Storage;
end;

{-------------------------------------------------------------------------------}
{ TFDVSESessionFields                                                           }
{-------------------------------------------------------------------------------}
constructor TFDVSESessionFields.Create(ASession: TFDVSESession);
begin
  inherited Create(ASession, ASession.Storage.GetSessionFieldClass());
end;

{-------------------------------------------------------------------------------}
function TFDVSESessionFields.GetItems(AIndex: integer): TFDVSESessionField;
begin
  Result := TFDVSESessionField(inherited Items[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDVSESessionFields.GetSession: TFDVSESession;
begin
  Result := GetOwner as TFDVSESession;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessionFields.GetStorage: TFDVSEManager;
begin
  Result := Session.Storage;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessionFields.FindField(
  const AFieldName: String): TFDVSESessionField;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if AnsiCompareText(Items[i].FieldDef.Name, AFieldName) = 0 then begin
      Result := Items[i];
      Break;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessionFields.FieldByName(
  const AFieldName: String): TFDVSESessionField;
begin
  Result := FindField(AFieldName);
  if Result = nil then
    raise Exception.CreateFmt('Virtual storage field [%s] is not found !', [AFieldName]);
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESessionFields.AddAll;
var
  i, j: Integer;
  oSchema: TFDVSESchema;
begin
  BeginUpdate;
  try
    Clear;
    for i := 0 to Storage.Schemas.Count - 1 do begin
      oSchema := Storage.Schemas[i];
      if oSchema.Mode <> fmDisabled then
        for j := 0 to oSchema.FieldDefs.Count - 1 do
          if oSchema.FieldDefs[j].Mode <> fmDisabled then
            AddField(oSchema.FieldDefs[j]);
    end;
  finally
    EndUpdate;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessionFields.AddField(AFieldDef: TFDVSEFieldDef):
  TFDVSESessionField;
begin
  if AFieldDef.Name = '' then
    raise Exception.Create('A field name is not defined !');
  if AFieldDef.DataType = dtUnknown then
    raise Exception.Create('A field data type is not defined !');
  Result := TFDVSESessionField(Add);
  Result.FFieldDef := AFieldDef;
  Result.FColumn := nil;
  Result.Mode := AFieldDef.ActualMode;
end;

{-------------------------------------------------------------------------------}
{ TFDVSESession                                                                 }
{-------------------------------------------------------------------------------}
constructor TFDVSESession.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FFields := Storage.GetSessionFieldsClass().Create(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDVSESession.Destroy;
begin
  Detach;
  if DataSet <> nil then
    DataSet.RemoveListener(Self as IFDDataSetListener);
  FreeAndNil(FFields);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession.GetStorage: TFDVSEManager;
begin
  Result := (Collection as TFDVSESessions).Storage;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession.GetDataSet: TFDDataSet;
begin
  if FOwner is TFDDataSet then
    Result := TFDDataSet(FOwner)
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
// IUnknown

function TFDVSESession.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession._AddRef: Integer;
begin
  Result := -1;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession._Release: Integer;
begin
  Result := -1;
end;

{-------------------------------------------------------------------------------}
// IFDStanExpressionEvaluator

function TFDVSESession.GetDataSource: IFDStanExpressionDataSource;
begin
  Result := FDataSource;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession.GetDataType: TFDDataType;
begin
  Result := FBaseColumn.DataType;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession.GetSubAggregateCount: Integer;
begin
  Result := 0;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession.GetSubAggregateKind(AIndex: Integer): TFDAggregateKind;
begin
  Result := akSum;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession.HandleNotification(AKind, AReason: Word;
  AParam1, AParam2: NativeInt): Boolean;
begin
  Result := False;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession.EvaluateSubAggregateArg(AIndex: Integer): Variant;
begin
  Result := Unassigned;
end;

{-------------------------------------------------------------------------------}
function TFDVSESession.Evaluate: Variant;
var
  i: Integer;
begin
  FRow := TFDDatSRow(FDataSource.Position);
  FBuff := nil;
  FLen := 0;
  try
    if not FRow.GetData(FBaseColumn.Index, rvDefault, FBuff, 0, FLen, False) then
      for i := 0 to Fields.Count - 1 do
        FRow.SetData(Fields[i].Column.Index, nil, 0)
    else
      Storage.DoDecode(Self, DataSet);
  finally
    FRow := nil;
    FBuff := nil;
    FLen := 0;
  end;
end;

{-------------------------------------------------------------------------------}
// IFDDataSetListener

procedure TFDVSESession.ResultsetDefined(ADataSet: TFDDataSet);
begin
  Storage.DoResultsetDefined(Self, ADataSet);
  if Storage.AutoManage and (BaseColumn = nil) then begin
    if Fields.Count = 0 then
      Fields.AddAll;
    Attach;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESession.ResultsetReleasing(ADataSet: TFDDataSet);
begin
  Storage.DoResultsetReleasing(Self, ADataSet);
  if Storage.AutoManage and (BaseColumn <> nil) then
    Detach;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESession.ResultsetActivated(ADataSet: TFDDataSet);
begin
  Storage.DoResultsetActivated(Self, ADataSet);
  if Storage.AutoManage and (BaseColumn <> nil) then
    ApplyVisibility(ADataSet);
end;

{-------------------------------------------------------------------------------}
// Other

procedure TFDVSESession.DoAttaching;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESession.DoAttached;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESession.Attach(ATable: TFDDatSTable);
var
  i: Integer;
  oCol: TFDDatSColumn;
  oDef: TFDVSEFieldDef;
  oFld: TFDVSESessionField;
begin
  Detach;
  try
    DoAttaching;
    if ATable = nil then begin
      if FOwner is TFDDatSTable then
        ATable := TFDDatSTable(FOwner)
      else if FOwner is TFDDataSet then
        ATable := TFDDataSet(FOwner).Table;
    end;
    if ATable = nil then
      raise Exception.Create('Result set is not defined !');
    if FBaseColumnName = '' then
      raise Exception.Create('Base column name is not defined !');
    i := ATable.Columns.IndexOfName(FBaseColumnName);
    if i = -1 then
      raise Exception.CreateFmt('Base column [%s] does not exists !', [FBaseColumnName]);
    if Fields.Count = 0 then
      raise Exception.Create('No columns specified for a session !');
    FBaseColumn := ATable.Columns[i];
    FBaseColumn.Evaluator := Self as IFDStanExpressionEvaluator;
    FBaseColumn.Attributes := FBaseColumn.Attributes - [caCalculated] + [caVirtual];
    FTable := ATable;
    FDataSource := TFDDatSTableExpressionDS.Create(ATable) as IFDStanExpressionDataSource;
    for i := 0 to Fields.Count - 1 do begin
      oFld := Fields[i];
      oDef := oFld.FieldDef;
      if oFld.Mode in [fmInvisible, fmVisible] then begin
        oCol := TFDDatSColumn.Create;
        oFld.FColumn := oCol;
        oCol.Name := oDef.Name;
        oCol.DataType := oDef.DataType;
        oCol.Size := oDef.Size;
        oCol.Precision := oDef.Precision;
        oCol.Scale := oDef.Scale;
        oCol.Attributes := oCol.Attributes + [caCalculated];
        FTable.Columns.Add(oCol);
      end;
    end;
    DoAttached;
  except
    Detach;
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESession.DoDetaching;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESession.DoDetached;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESession.Detach;
var
  i: Integer;
begin
  try
    DoDetaching;
    for i := 0 to Fields.Count - 1 do
      Fields[i].FColumn := nil;
  finally
    if FBaseColumn <> nil then begin
      FBaseColumn.Evaluator := nil;
      FBaseColumn := nil;
    end;
    FTable := nil;
    FDataSource := nil;
    DoDetached;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSESession.ApplyVisibility(ADataSet: TDataSet);
var
  i: Integer;
  oDef: TFDVSESessionField;
  oFld: TField;
begin
  for i := 0 to Fields.Count - 1 do begin
    oDef := Fields[i];
    if oDef.Column <> nil then begin
      oFld := ADataSet.FindField(oDef.Column.Name);
      if oFld <> nil then
        oFld.Visible := (oDef.Mode = fmVisible);
    end;
  end;
  oFld := ADataSet.FindField(FBaseColumnName);
  if oFld <> nil then
    oFld.Visible := False;
end;

{-------------------------------------------------------------------------------}
{ TFDVSESessions                                                                }
{-------------------------------------------------------------------------------}
constructor TFDVSESessions.Create(AStorage: TFDVSEManager);
begin
  inherited Create(AStorage, AStorage.GetSessionClass());
end;

{-------------------------------------------------------------------------------}
function TFDVSESessions.GetStorage: TFDVSEManager;
begin
  Result := GetOwner as TFDVSEManager;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessions.GetItems(AIndex: integer): TFDVSESession;
begin
  Result := TFDVSESession(inherited Items[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDVSESessions.FindSession(AOwner: TObject;
  const ABaseColumnName: String): TFDVSESession;
var
  i: Integer;
  oSess: TFDVSESession;
begin
  Result := nil;
  for i := 0 to Count - 1 do begin
    oSess := Items[i];
    if (oSess.FOwner = AOwner) and
       (AnsiCompareText(oSess.FBaseColumnName, ABaseColumnName) = 0) then begin
      Result := oSess;
      Break;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessions.AddSession(AOwner: TObject;
  const ABaseColumnName: String): TFDVSESession;
begin
  Result := TFDVSESession(Add);
  Result.FOwner := AOwner;
  if Result.DataSet <> nil then
    Result.DataSet.AddListener(Result as IFDDataSetListener);
  Result.FBaseColumnName := ABaseColumnName;
end;

{-------------------------------------------------------------------------------}
function TFDVSESessions.EnsureSession(AOwner: TObject;
  const ABaseColumnName: String): TFDVSESession;
begin
  Result := FindSession(AOwner, ABaseColumnName);
  if Result = nil then
    Result := AddSession(AOwner, ABaseColumnName);
end;

{-------------------------------------------------------------------------------}
{ TFDVSEManager                                                                   }
{-------------------------------------------------------------------------------}
constructor TFDVSEManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSchemas := GetSchemasClass.Create(Self);
  FSessions := GetSessionsClass.Create(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDVSEManager.Destroy;
begin
  FreeAndNil(FSessions);
  FreeAndNil(FSchemas);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEManager.GetFieldDefClass: TFDVSEFieldDefClass;
begin
  Result := TFDVSEFieldDef;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEManager.GetFieldDefsClass: TFDVSEFieldDefsClass;
begin
  Result := TFDVSEFieldDefs;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEManager.GetSchemaClass: TFDVSESchemaClass;
begin
  Result := TFDVSESchema;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEManager.GetSchemasClass: TFDVSESchemasClass;
begin
  Result := TFDVSESchemas;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEManager.GetSessionFieldClass: TFDVSESessionFieldClass;
begin
  Result := TFDVSESessionField;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEManager.GetSessionFieldsClass: TFDVSESessionFieldsClass;
begin
  Result := TFDVSESessionFields;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEManager.GetSessionClass: TFDVSESessionClass;
begin
  Result := TFDVSESession;
end;

{-------------------------------------------------------------------------------}
class function TFDVSEManager.GetSessionsClass: TFDVSESessionsClass;
begin
  Result := TFDVSESessions;
end;

{-------------------------------------------------------------------------------}
procedure TFDVSEManager.SetSchemas(const AValue: TFDVSESchemas);
begin
  FSchemas.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDVSEManager.DoResultsetActivated(ASession: TFDVSESession;
  ADataSet: TFDDataSet);
begin
  if Assigned(OnResultsetActivated) then
    OnResultsetActivated(Self, ASession, ADataSet);
end;

{-------------------------------------------------------------------------------}
procedure TFDVSEManager.DoResultsetDefined(ASession: TFDVSESession;
  ADataSet: TFDDataSet);
begin
  if Assigned(OnResultsetDefined) then
    OnResultsetDefined(Self, ASession, ADataSet);
end;

{-------------------------------------------------------------------------------}
procedure TFDVSEManager.DoResultsetReleasing(ASession: TFDVSESession;
  ADataSet: TFDDataSet);
begin
  if Assigned(OnResultsetReleasing) then
    OnResultsetReleasing(Self, ASession, ADataSet);
end;

{-------------------------------------------------------------------------------}
procedure TFDVSEManager.DoDecode(ASession: TFDVSESession;
  ADataSet: TFDDataSet);
begin
  if Assigned(OnDecode) then
    OnDecode(Self, ASession, ADataSet);
end;

end.
