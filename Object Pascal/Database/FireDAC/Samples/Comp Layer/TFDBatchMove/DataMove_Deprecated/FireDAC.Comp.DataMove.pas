{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{                  FireDAC TFDDataMove                  }
{                                                       }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}

unit FireDAC.Comp.DataMove;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Util,
  FireDAC.Comp.Client;

type
  TFDTextField = class;
  TFDTextFields = class;
  TFDTextDataDef = class;
  TFDMappingItem = class;
  TFDMappings = class;
  TFDDataMove = class;

  TFDTextDataType = (atOther, atString, atFloat, atNumber, atBool, atLongInt,
    atDate, atTime, atDateTime, atBlob, atMemo);
  TFDTextRecordFormat = (rfFixedLength, rfFieldPerLine, rfCommaDoubleQuote,
    rfSemicolonDoubleQuote, rfTabDoubleQuote, rfCustom);
  TFDTextAnalyze = set of (taDelimSep, taFormatSet, taHeader, taFields);

  TFDDataSourceKind = (skDataSet, skText);
  TFDDataMoveMode = (dmAlwaysInsert, dmAppend, dmUpdate, dmAppendUpdate, dmDelete);
  TFDLogFileAction = (laNone, laCreate, laAppend);
  TFDDataMovePhase = (psPreparing, psStarting, psProgress, psFinishing, psUnpreparing);
  TFDDataMoveProgressEvent = procedure (ASender: TObject; APhase: TFDDataMovePhase) of object;
  TFDDataMoveFindDestRecordEvent = procedure (ASender: TObject; var AFound: Boolean) of object;
  TFDDataMoveOption = (poOptimiseDest, poOptimiseSrc, poClearDest, poClearDestNoUndo,
    poAbortOnExc, poSrcFromCurRec, poIdentityInsert);
  TFDDataMoveOptions = set of TFDDataMoveOption;

  // eaFail: write error to log, go to next record, if poAbortOnExc, then eaExitFailure
  // eaSkip: write error to log, go to next record
  // eaRetry: retry record
  // eaApplied: go to next record
  // eaDefault: ->> eaFail
  // eaExitSuccess: stop moving and exit
  // eaExitFailure: stop moving and reraise
  TFDDataMoveErrorEvent = procedure (ASender: TObject; var AAction: TFDErrorAction) of object;

  TFDTextField = class(TCollectionItem)
  private
    FDataType: TFDTextDataType;
    FFieldName: String;
    FFieldSize: Integer;
    FPrecision: Integer;
    procedure SetFieldName(const AValue: String);
  protected
    function GetDisplayName: String; override;
  public
    procedure Assign(ASource: TPersistent); override;
    procedure DefineAsField(AFld: TField);
    procedure DefineFieldDef(AFld: TFieldDef);
  published
    property DataType: TFDTextDataType read FDataType write FDataType;
    property FieldName: String read FFieldName write SetFieldName;
    property FieldSize: Integer read FFieldSize write FFieldSize;
    property Precision: Integer read FPrecision write FPrecision;
  end;

  TFDTextFields = class(TCollection)
  private
    FDef: TFDTextDataDef;
    function GetItem(AIndex: Integer): TFDTextField; inline;
    procedure SetItem(AIndex: Integer; const AValue: TFDTextField); inline;
    procedure CheckFieldName(AField: TFDTextField; const ANewName: String);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(ADef: TFDTextDataDef);
    function Add: TFDTextField;
    procedure AddAll;
    function FindField(const AName: String): TFDTextField;
    function FieldByName(const AName: String): TFDTextField;
    property Items[Index: Integer]: TFDTextField read GetItem write SetItem; default;
  end;

  TFDTextFormatSettingsValue = (
    fsCurrencyFormat, fsNegCurrFormat, fsThousandSeparator, fsDecimalSeparator,
    fsCurrencyDecimals, fsDateSeparator, fsTimeSeparator, fsCurrencyString,
    fsShortDateFormat, fsTimeAMString, fsTimePMString, fsShortTimeFormat,
    fsTwoDigitYearCenturyWindow);
  TFDTextFormatSettingsValueSet = set of TFDTextFormatSettingsValue;

  TFDTextFormatSettings = class(TPersistent)
  private
    FFS: TFormatSettings;
    FDataDef: TFDTextDataDef;
    FValues: TFDTextFormatSettingsValueSet;
    FBoolFalseVals: TStrings;
    FBoolTrueVals: TStrings;
    FNullVals: TStrings;
    procedure SetCurrencyDecimals(const AValue: Byte);
    procedure SetCurrencyFormat(const AValue: Byte);
    procedure SetCurrencyString(const AValue: string);
    procedure SetDateSeparator(const AValue: Char);
    procedure SetDecimalSeparator(const AValue: Char);
    procedure SetNegCurrFormat(const AValue: Byte);
    procedure SetShortDateFormat(const AValue: string);
    procedure SetShortTimeFormat(const AValue: string);
    procedure SetThousandSeparator(const AValue: Char);
    procedure SetTimeAMString(const AValue: string);
    procedure SetTimePMString(const AValue: string);
    procedure SetTimeSeparator(const AValue: Char);
    procedure SetTwoDigitYearCenturyWindow(const AValue: Word);
    function IsCDS: Boolean; inline;
    function IsCFS: Boolean; inline;
    function IsCSS: Boolean; inline;
    function IsDSS: Boolean; inline;
    function IsDTSS: Boolean; inline;
    function IsNCFS: Boolean; inline;
    function IsSDFS: Boolean; inline;
    function IsSTFS: Boolean; inline;
    function IsTAMSS: Boolean; inline;
    function IsTDYCWS: Boolean; inline;
    function IsTMSS: Boolean; inline;
    function IsTPMSS: Boolean; inline;
    function IsTSS: Boolean; inline;
    function GetCurrencyDecimals: Byte; inline;
    function GetCurrencyFormat: Byte; inline;
    function GetCurrencyString: string; inline;
    function GetDateSeparator: Char; inline;
    function GetDecimalSeparator: Char; inline;
    function GetNegCurrFormat: Byte; inline;
    function GetShortDateFormat: string; inline;
    function GetShortTimeFormat: string; inline;
    function GetThousandSeparator: Char; inline;
    function GetTimeAMString: string; inline;
    function GetTimePMString: string; inline;
    function GetTimeSeparator: Char; inline;
    function GetTwoDigitYearCenturyWindow: Word; inline;
    procedure SetBoolFalseVals(const AValue: TStrings);
    procedure SetBoolTrueVals(const AValue: TStrings);
    procedure SetNullVals(const AValue: TStrings);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(ADef: TFDTextDataDef);
    destructor Destroy; override;
    procedure Assign(ASource: TPersistent); override;
    property DataDef: TFDTextDataDef read FDataDef;
    property FS: TFormatSettings read FFS;
  published
    property CurrencyFormat: Byte read GetCurrencyFormat write SetCurrencyFormat stored IsCFS;
    property NegCurrFormat: Byte read GetNegCurrFormat write SetNegCurrFormat stored IsNCFS;
    property ThousandSeparator: Char read GetThousandSeparator write SetThousandSeparator stored IsTSS;
    property DecimalSeparator: Char read GetDecimalSeparator write SetDecimalSeparator stored IsDSS;
    property CurrencyDecimals: Byte read GetCurrencyDecimals write SetCurrencyDecimals stored IsCDS;
    property DateSeparator: Char read GetDateSeparator write SetDateSeparator stored IsDTSS;
    property TimeSeparator: Char read GetTimeSeparator write SetTimeSeparator stored IsTMSS;
    property CurrencyString: string read GetCurrencyString write SetCurrencyString stored IsCSS;
    property ShortDateFormat: string read GetShortDateFormat write SetShortDateFormat stored IsSDFS;
    property TimeAMString: string read GetTimeAMString write SetTimeAMString stored IsTAMSS;
    property TimePMString: string read GetTimePMString write SetTimePMString stored IsTPMSS;
    property ShortTimeFormat: string read GetShortTimeFormat write SetShortTimeFormat stored IsSTFS;
    property TwoDigitYearCenturyWindow: Word read GetTwoDigitYearCenturyWindow
      write SetTwoDigitYearCenturyWindow stored IsTDYCWS;
    property BoolTrueVals: TStrings read FBoolTrueVals write SetBoolTrueVals;
    property BoolFalseVals: TStrings read FBoolFalseVals write SetBoolFalseVals;
    property NullVals: TStrings read FNullVals write SetNullVals;
  end;

  TFDTextDataDef = class(TPersistent)
  private
    FDataMove: TFDDataMove;
    FFields: TFDTextFields;
    FDelimiter: Char;
    FRecordDelimiter: TFDTextEndOfLine;
    FRecordFormat: TFDTextRecordFormat;
    FSeparator: Char;
    FWithFieldNames: Boolean;
    FFormatSettings: TFDTextFormatSettings;
    FStrsEmpty2Null: Boolean;
    FTrimLeft: Boolean;
    FTrimRight: Boolean;
    procedure SetFields(const AValue: TFDTextFields);
    procedure SetDelimiter(AValue: Char);
    procedure SetRecordFormat(AValue: TFDTextRecordFormat);
    procedure SetSeparator(AValue: Char);
    function IsADDS: Boolean;
    procedure SetWithFieldNames(const AValue: Boolean);
    procedure SetFormatSettings(const AValue: TFDTextFormatSettings);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(ADataMove: TFDDataMove);
    destructor Destroy; override;
    procedure Assign(ASource: TPersistent); override;
    property DataMove: TFDDataMove read FDataMove;
  published
    property Fields: TFDTextFields read FFields write SetFields;
    property Delimiter: Char read FDelimiter write SetDelimiter stored IsADDS;
    property Separator: Char read FSeparator write SetSeparator stored IsADDS;
    property EndOfLine: TFDTextEndOfLine read FRecordDelimiter write FRecordDelimiter default elDefault;
    property RecordFormat: TFDTextRecordFormat read FRecordFormat write SetRecordFormat default rfCommaDoubleQuote;
    property WithFieldNames: Boolean read FWithFieldNames write SetWithFieldNames default False;
    property TrimLeft: Boolean read FTrimLeft write FTrimLeft default True;
    property TrimRight: Boolean read FTrimRight write FTrimRight default True;
    property StrsEmpty2Null: Boolean read FStrsEmpty2Null write FStrsEmpty2Null default True;
    property FormatSettings: TFDTextFormatSettings read FFormatSettings write SetFormatSettings;
  end;

  TFDMappingItem = class(TCollectionItem)
  private
    FSourceExpression: String;
    FSourceFieldName: String;
    FSourceField: TField;
    FSourceTextField: TFDTextField;
    FSourceEvaluator: IFDStanExpressionEvaluator;
    FSourceValue: Variant;
    FDestinationFieldName: String;
    FDestField: TField;
    FDestTextField: TFDTextField;
    FDestValue: Variant;
    FInKey: Boolean;
    FIsIdentity: Boolean;
    function GetAsText: String;
    procedure SetAsText(const AValue: String);
    function GetItemBaseValue: Variant;
    function GetItemValue: Variant;
  protected
    function GetDisplayName: String; override;
    procedure Prepare;
    procedure Unprepare;
  public
    destructor Destroy; override;
    procedure Assign(ASource: TPersistent); override;
    procedure Move;
    property DestField: TField read FDestField;
    property DestTextField: TFDTextField read FDestTextField;
    property DestValue: Variant read FDestValue write FDestValue;
    property SourceField: TField read FSourceField;
    property SourceTextField: TFDTextField read FSourceTextField;
    property SourceEvaluator: IFDStanExpressionEvaluator read FSourceEvaluator;
    property SourceValue: Variant read FSourceValue write FSourceValue;
    property ItemValue: Variant read GetItemValue;
    property InKey: Boolean read FInKey;
    property IsIdentity: Boolean read FIsIdentity;
    property AsText: String read GetAsText write SetAsText;
  published
    property SourceFieldName: String read FSourceFieldName write FSourceFieldName;
    property SourceExpression: String read FSourceExpression write FSourceExpression;
    property DestinationFieldName: String read FDestinationFieldName write FDestinationFieldName;
  end;

  TFDMappings = class(TCollection)
  private
    FDataMove: TFDDataMove;
    FMappingsAdded: Boolean;
    FTextFieldsAdded: Boolean;
    function GetItem(AIndex: Integer): TFDMappingItem;
    procedure SetItem(AIndex: Integer; const AValue: TFDMappingItem);
  protected
    function GetOwner: TPersistent; override;
    procedure Prepare;
    procedure Unprepare;
  public
    constructor Create(ADataMove: TFDDataMove);
    procedure Assign(ASource: TPersistent); override;
    function Add: TFDMappingItem; overload;
    procedure Add(const AMapItem: String); overload;
    procedure AddAll;
    procedure Move(AKeysOnly: Boolean);
    function IndexOfName(const AName: String): Integer;
    property Items[Index: Integer]: TFDMappingItem read GetItem write SetItem; default;
    property DataMove: TFDDataMove read FDataMove;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDDataMove = class(TFDComponent)
  private
    FTextDataDef: TFDTextDataDef;
    FTextFileName: String;
    FMappings: TFDMappings;
    FLogFileAction: TFDLogFileAction;
    FLogFileName: String;
    FSourceKind: TFDDataSourceKind;
    FDestinationKind: TFDDataSourceKind;
    FMode: TFDDataMoveMode;
    FStatisticsInterval: LongInt;
    FCommitCount: LongInt;
    FDeleteCount: LongInt;
    FInsertCount: LongInt;
    FUpdateCount: LongInt;
    FReadCount: LongInt;
    FExceptionCount: LongInt;
    FSource: TDataSet;
    FDestination: TFDAdaptedDataSet;
    FOnProgress: TFDDataMoveProgressEvent;
    FOnFindDestRecord: TFDDataMoveFindDestRecordEvent;
    FOptions: TFDDataMoveOptions;
    FAborting: Boolean;
    FOnError: TFDDataMoveErrorEvent;
    FTextFileEncoding: TFDEncoding;
    FLogFileEncoding: TFDEncoding;
    FTextAnalyze: TFDTextAnalyze;
    FTextAnalyzeSample: Integer;
    FTextStream: TStream;
    FLogStream: TStream;
    function FindDestRecord: Boolean;
    procedure SetMappings(const AValue: TFDMappings);
    function GetWriteCount: LongInt;
    function ExecuteTableToTable: LongInt;
    function ExecuteTableToText: LongInt;
    function ExecuteTextToTable: LongInt;
    procedure SetTextDataDef(const AValue: TFDTextDataDef);
    procedure SetDestination(const AValue: TFDAdaptedDataSet);
    procedure SetSource(const AValue: TDataSet);
    procedure SetTextFileName(const AValue: String);
    procedure DoStatistic(APhase: TFDDataMovePhase);
    function InitLogFile: TFDTextFile;
    procedure ProcessException(E: Exception; ALog: TFDTextFile;
      out AAction: TFDErrorAction);
    procedure DeleteExceptionFile(ALog: TFDTextFile);
    procedure SetupDestination;
    procedure SetupSource;
    procedure SetDestinationKind(const AValue: TFDDataSourceKind);
    procedure SetSourceKind(const AValue: TFDDataSourceKind);
    procedure SetMode(const AValue: TFDDataMoveMode);
    procedure CheckTextSetup;
    procedure GuessTextFormat(AText: TFDTextFile; AAnalyze: TFDTextAnalyze); overload;
    procedure SetTextStream(const AValue: TStream);
    procedure TextDataAssigned;
    function IsSrcMemTable: Boolean;
    function IsDestMemTable: Boolean;
    function TrimText(const AStr: String; AHeader: Boolean): String;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ReadCount: LongInt read FReadCount;
    property InsertCount: LongInt read FInsertCount;
    property UpdateCount: LongInt read FUpdateCount;
    property DeleteCount: LongInt read FDeleteCount;
    property WriteCount: LongInt read GetWriteCount;
    property ExceptionCount: LongInt read FExceptionCount;
    function Execute: LongInt;
    procedure AbortJob;
    procedure GuessTextFormat(AAnalyze: TFDTextAnalyze = [taDelimSep, taHeader, taFields]); overload;
    procedure CreateDestinationDataSet;
    property TextStream: TStream read FTextStream write SetTextStream;
    property LogStream: TStream read FLogStream write FLogStream;
  published
    property TextDataDef: TFDTextDataDef read FTextDataDef write SetTextDataDef;
    property TextFileName: String read FTextFileName write SetTextFileName;
    property TextFileEncoding: TFDEncoding read FTextFileEncoding write FTextFileEncoding default ecDefault;
    property TextAnalyze: TFDTextAnalyze read FTextAnalyze write FTextAnalyze default [];
    property TextAnalyzeSample: Integer read FTextAnalyzeSample write FTextAnalyzeSample default 10;
    property Mappings: TFDMappings read FMappings write SetMappings;
    property Options: TFDDataMoveOptions read FOptions write FOptions
      default [poOptimiseDest, poOptimiseSrc, poAbortOnExc, poIdentityInsert];
    property LogFileAction: TFDLogFileAction read FLogFileAction write FLogFileAction default laNone;
    property LogFileName: String read FLogFileName write FLogFileName;
    property LogFileEncoding: TFDEncoding read FLogFileEncoding write FLogFileEncoding default ecDefault;
    property CommitCount: LongInt read FCommitCount write FCommitCount default 100;
    property Mode: TFDDataMoveMode read FMode write SetMode default dmAlwaysInsert;
    property StatisticsInterval: LongInt read FStatisticsInterval write FStatisticsInterval default 100;
    property SourceKind: TFDDataSourceKind read FSourceKind write SetSourceKind default skDataSet;
    property DestinationKind: TFDDataSourceKind read FDestinationKind write SetDestinationKind default skDataSet;
    property Source: TDataSet read FSource write SetSource;
    property Destination: TFDAdaptedDataSet read FDestination write SetDestination;
    property OnProgress: TFDDataMoveProgressEvent read FOnProgress write FOnProgress;
    property OnFindDestRecord: TFDDataMoveFindDestRecordEvent read FOnFindDestRecord write FOnFindDestRecord;
    property OnError: TFDDataMoveErrorEvent read FOnError write FOnError;
  end deprecated 'Use TFDBatchMove instead of TFDDataMove';

implementation

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
{$ENDIF}
  System.Variants,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Consts, FireDAC.Stan.Factory, 
    FireDAC.Stan.ResStrs,
  FireDAC.UI.Intf, 
  FireDAC.Comp.DataSet;

type
  TFDDataMoveAction = (paSkip, paInsert, paUpdate, paDelete, paAlwaysInsert);

{-------------------------------------------------------------------------------}
{ TFDTextField                                                                  }
{-------------------------------------------------------------------------------}
procedure TFDTextField.Assign(ASource: TPersistent);
begin
  if ASource is TFDTextField then begin
    DataType := TFDTextField(ASource).DataType;
    FieldName := TFDTextField(ASource).FieldName;
    FieldSize := TFDTextField(ASource).FieldSize;
  end
  else
    inherited Assign(ASource);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextField.SetFieldName(const AValue: String);
begin
  if FFieldName <> AValue then begin
    TFDTextFields(Collection).CheckFieldName(Self, AValue);
    FFieldName := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTextField.GetDisplayName: string;
begin
  Result := FieldName;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextField.DefineAsField(AFld: TField);
begin
  case AFld.DataType of
  ftBoolean:
    begin
      DataType := atBool;
      FieldSize := 1;
    end;
  ftString,
  ftFixedChar,
  ftWideString,
  ftFixedWideChar:
    begin
      DataType := atString;
      FieldSize := AFld.Size;
    end;
  ftShortint:
    begin
      DataType := atNumber;
      FieldSize := 4;
    end;
  ftByte:
    begin
      DataType := atNumber;
      FieldSize := 3;
    end;
  ftSmallint:
    begin
      DataType := atNumber;
      FieldSize := 6;
    end;
  ftWord:
    begin
      DataType := atNumber;
      FieldSize := 5;
    end;
  ftInteger:
    begin
      DataType := atLongInt;
      FieldSize := 11;
    end;
  ftLongWord:
    begin
      DataType := atLongInt;
      FieldSize := 10;
    end;
  ftFloat:
    begin
      DataType := atFloat;
      Precision := TFloatField(AFld).Precision;
      if Precision > 0 then
        FieldSize := Precision + 2
      else
        FieldSize := 18;
    end;
  ftExtended:
    begin
      DataType := atFloat;
      Precision := TExtendedField(AFld).Precision;
      if Precision > 0 then
        FieldSize := Precision + 2
      else
        FieldSize := 21;
    end;
  ftSingle:
    begin
      DataType := atFloat;
      Precision := TSingleField(AFld).Precision;
      if Precision > 0 then
        FieldSize := Precision + 2
      else
        FieldSize := 9;
    end;
  ftCurrency:
    begin
      DataType := atFloat;
      Precision := TCurrencyField(AFld).Precision;
      if Precision > 0 then
        FieldSize := Precision + 2
      else
        FieldSize := 22;
    end;
  ftAutoInc:
    begin
      DataType := atLongInt;
      FieldSize := 11;
    end;
  ftLargeint:
    begin
      DataType := atLongInt;
      FieldSize := 21;
    end;
  ftBCD:
    begin
      DataType := atFloat;
      Precision := TBCDField(AFld).Precision;
      if Precision > 0 then
        FieldSize := Precision + 2
      else
        FieldSize := 18;
    end;
  ftFMTBcd:
    begin
      DataType := atFloat;
      Precision := TFMTBCDField(AFld).Precision;
      if Precision > 0 then
        FieldSize := Precision + 2
      else
        FieldSize := 38;
    end;
  ftDate:
    begin
      DataType := atDate;
      FieldSize := 16;
    end;
  ftTime:
    begin
      DataType := atTime;
      FieldSize := 11;
    end;
  ftTimeStamp,
  ftOraTimeStamp,
  ftDateTime:
    begin
      DataType := atDateTime;
      FieldSize := 27;
    end;
  ftOraInterval,
  ftParadoxOle:
    begin
      DataType := atString;
      FieldSize := 35;
    end;
  ftMemo,
  ftWideMemo,
  ftOraClob,
  ftFmtMemo,
  ftDBaseOle:
    begin
      DataType := atMemo;
      FieldSize := -1;
    end;
  ftBlob,
  ftOraBlob:
    begin
      DataType := atBlob;
      FieldSize := -1;
    end;
  ftBytes,
  ftVarBytes:
    begin
      DataType := atBlob;
      FieldSize := AFld.Size;
    end;
  else
    DataType := atOther;
    FieldSize := 100;
  end;
  FieldName := AFld.FieldName;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextField.DefineFieldDef(AFld: TFieldDef);
begin
  AFld.Name := FieldName;
  if AFld.Name = '' then
    AFld.Attributes := AFld.Attributes + [faUnNamed];
  case DataType of
  atOther,
  atString:
    begin
      if TFDTextFields(Collection).FDef.FDataMove.TextFileEncoding in [ecUTF8, ecUTF16] then
        AFld.DataType := ftWideString
      else
        AFld.DataType := ftString;
      AFld.Size := FieldSize;
      if AFld.Size = 0 then
        AFld.Size := C_FD_DefStrSize;
    end;
  atFloat:
    begin
      AFld.DataType := ftFloat;
      AFld.Precision := Precision;
    end;
  atNumber:
    AFld.DataType := ftWord;
  atBool:
    AFld.DataType := ftBoolean;
  atLongInt:
    AFld.DataType := ftLargeint;
  atDate:
    AFld.DataType := ftDate;
  atTime:
    AFld.DataType := ftTime;
  atDateTime:
    AFld.DataType := ftDateTime;
  atBlob:
    AFld.DataType := ftBlob;
  atMemo:
    if TFDTextFields(Collection).FDef.FDataMove.TextFileEncoding in [ecUTF8, ecUTF16] then
      AFld.DataType := ftWideMemo
    else
      AFld.DataType := ftMemo;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDTextFields                                                                 }
{-------------------------------------------------------------------------------}
constructor TFDTextFields.Create(ADef: TFDTextDataDef);
begin
  inherited Create(TFDTextField);
  FDef := ADef;
end;

{-------------------------------------------------------------------------------}
function TFDTextFields.GetItem(AIndex: Integer): TFDTextField;
begin
  Result := TFDTextField(inherited GetItem(AIndex));
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFields.SetItem(AIndex: Integer; const AValue: TFDTextField);
begin
  inherited SetItem(AIndex, AValue);
end;

{-------------------------------------------------------------------------------}
function TFDTextFields.GetOwner: TPersistent;
begin
  Result := FDef;
end;

{-------------------------------------------------------------------------------}
function TFDTextFields.Add: TFDTextField;
begin
  Result := TFDTextField(inherited Add);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFields.AddAll;
var
  oDS: TDataSet;
  i: Integer;
begin
  if FDef.FDataMove.SourceKind = skDataSet then
    oDS := FDef.FDataMove.Source
  else if FDef.FDataMove.DestinationKind = skDataSet then
    oDS := FDef.FDataMove.Destination
  else
    oDS := nil;
  if oDS = nil then
    Exit;
  oDS.Active := True;
  Clear;
  for i := 0 to oDS.Fields.Count - 1 do
    Add.DefineAsField(oDS.Fields[i]);
end;

{-------------------------------------------------------------------------------}
function TFDTextFields.FindField(const AName: String): TFDTextField;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if AnsiCompareText(AName, Items[i].FieldName) = 0 then begin
      Result := Items[i];
      Break;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDTextFields.FieldByName(const AName: String): TFDTextField;
begin
  Result := FindField(AName);
  if Result = nil then
    FDException(FDef.FDataMove, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPNoTxtFld, [AName]);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFields.CheckFieldName(AField: TFDTextField; const ANewName: String);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    if (Items[i] <> AField) and (AnsiCompareText(Items[i].FieldName, ANewName) = 0) then
      FDException(FDef.FDataMove, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPTxtFldDup, [ANewName]);
end;

{-------------------------------------------------------------------------------}
{ TFDTextFormatSettings                                                         }
{-------------------------------------------------------------------------------}
constructor TFDTextFormatSettings.Create(ADef: TFDTextDataDef);
begin
  inherited Create;
  FDataDef := ADef;
  FFS := TFormatSettings.Create;
  FValues := [];
  FBoolFalseVals := TFDStringList.Create;
  FBoolTrueVals := TFDStringList.Create;
  FNullVals := TFDStringList.Create;
end;

{-------------------------------------------------------------------------------}
destructor TFDTextFormatSettings.Destroy;
begin
  FDFreeAndNil(FBoolFalseVals);
  FDFreeAndNil(FBoolTrueVals);
  FDFreeAndNil(FNullVals);
  FDataDef := nil;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetOwner: TPersistent;
begin
  Result := FDataDef;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetCurrencyDecimals: Byte;
begin
  Result := FFS.CurrencyDecimals;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetCurrencyFormat: Byte;
begin
  Result := FFS.CurrencyFormat;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetCurrencyString: string;
begin
  Result := FFS.CurrencyString;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetDateSeparator: Char;
begin
  Result := FFS.DateSeparator;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetDecimalSeparator: Char;
begin
  Result := FFS.DecimalSeparator;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetNegCurrFormat: Byte;
begin
  Result := FFS.NegCurrFormat;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetShortDateFormat: string;
begin
  Result := FFS.ShortDateFormat;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetShortTimeFormat: string;
begin
  Result := FFS.ShortTimeFormat;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetThousandSeparator: Char;
begin
  Result := FFS.ThousandSeparator;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetTimeAMString: string;
begin
  Result := FFS.TimeAMString;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetTimePMString: string;
begin
  Result := FFS.TimePMString;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetTimeSeparator: Char;
begin
  Result := FFS.TimeSeparator;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.GetTwoDigitYearCenturyWindow: Word;
begin
  Result := FFS.TwoDigitYearCenturyWindow;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.Assign(ASource: TPersistent);
begin
  if ASource is TFDTextFormatSettings then begin
    FFS := TFDTextFormatSettings(ASource).FFS;
    FValues := TFDTextFormatSettings(ASource).FValues;
    FBoolFalseVals.SetStrings(TFDTextFormatSettings(ASource).FBoolFalseVals);
    FBoolTrueVals.SetStrings(TFDTextFormatSettings(ASource).FBoolTrueVals);
    FNullVals.SetStrings(TFDTextFormatSettings(ASource).FNullVals);
  end
  else
    inherited Assign(ASource);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetCurrencyDecimals(const AValue: Byte);
begin
  if FFS.CurrencyDecimals <> AValue then begin
    FFS.CurrencyDecimals := AValue;
    Include(FValues, fsCurrencyDecimals);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetCurrencyFormat(const AValue: Byte);
begin
  if FFS.CurrencyFormat <> AValue then begin
    FFS.CurrencyFormat := AValue;
    Include(FValues, fsCurrencyFormat);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetCurrencyString(const AValue: string);
begin
  if FFS.CurrencyString <> AValue then begin
    FFS.CurrencyString := AValue;
    Include(FValues, fsCurrencyString);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetDateSeparator(const AValue: Char);
begin
  if FFS.DateSeparator <> AValue then begin
    FFS.DateSeparator := AValue;
    Include(FValues, fsDateSeparator);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetDecimalSeparator(const AValue: Char);
begin
  if FFS.DecimalSeparator <> AValue then begin
    FFS.DecimalSeparator := AValue;
    Include(FValues, fsDecimalSeparator);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetNegCurrFormat(const AValue: Byte);
begin
  if FFS.NegCurrFormat <> AValue then begin
    FFS.NegCurrFormat := AValue;
    Include(FValues, fsNegCurrFormat);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetShortDateFormat(const AValue: string);
begin
  if FFS.ShortDateFormat <> AValue then begin
    FFS.ShortDateFormat := AValue;
    FFS.LongDateFormat := AValue;
    Include(FValues, fsShortDateFormat);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetShortTimeFormat(const AValue: string);
begin
  if FFS.ShortTimeFormat <> AValue then begin
    FFS.ShortTimeFormat := AValue;
    FFS.LongTimeFormat := AValue;
    Include(FValues, fsShortTimeFormat);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetThousandSeparator(const AValue: Char);
begin
  if FFS.ThousandSeparator <> AValue then begin
    FFS.ThousandSeparator := AValue;
    Include(FValues, fsThousandSeparator);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetTimeAMString(const AValue: string);
begin
  if FFS.TimeAMString <> AValue then begin
    FFS.TimeAMString := AValue;
    Include(FValues, fsTimeAMString);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetTimePMString(const AValue: string);
begin
  if FFS.TimePMString <> AValue then begin
    FFS.TimePMString := AValue;
    Include(FValues, fsTimePMString);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetTimeSeparator(const AValue: Char);
begin
  if FFS.TimeSeparator <> AValue then begin
    FFS.TimeSeparator := AValue;
    Include(FValues, fsTimeSeparator);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetTwoDigitYearCenturyWindow(
  const AValue: Word);
begin
  if FFS.TwoDigitYearCenturyWindow <> AValue then begin
    FFS.TwoDigitYearCenturyWindow := AValue;
    Include(FValues, fsTwoDigitYearCenturyWindow);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsCDS: Boolean;
begin
  Result := fsCurrencyDecimals in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsCFS: Boolean;
begin
  Result := fsCurrencyFormat in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsCSS: Boolean;
begin
  Result := fsCurrencyString in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsDSS: Boolean;
begin
  Result := fsDecimalSeparator in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsDTSS: Boolean;
begin
  Result := fsDateSeparator in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsNCFS: Boolean;
begin
  Result := fsNegCurrFormat in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsSDFS: Boolean;
begin
  Result := fsShortDateFormat in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsSTFS: Boolean;
begin
  Result := fsShortTimeFormat in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsTAMSS: Boolean;
begin
  Result := fsTimeAMString in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsTDYCWS: Boolean;
begin
  Result := fsTwoDigitYearCenturyWindow in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsTMSS: Boolean;
begin
  Result := fsTimeSeparator in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsTPMSS: Boolean;
begin
  Result := fsTimePMString in FValues;
end;

{-------------------------------------------------------------------------------}
function TFDTextFormatSettings.IsTSS: Boolean;
begin
  Result := fsThousandSeparator in FValues;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetBoolFalseVals(const AValue: TStrings);
begin
  FBoolFalseVals.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetBoolTrueVals(const AValue: TStrings);
begin
  FBoolTrueVals.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextFormatSettings.SetNullVals(const AValue: TStrings);
begin
  FNullVals.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
{ TFDTextDataDef                                                                }
{-------------------------------------------------------------------------------}
constructor TFDTextDataDef.Create(ADataMove: TFDDataMove);
begin
  inherited Create;
  FDataMove := ADataMove;
  FFields := TFDTextFields.Create(Self);
  FDelimiter := #34;
  FSeparator := #44;
  FRecordFormat := rfCommaDoubleQuote;
  FRecordDelimiter := elDefault;
  FWithFieldNames := False;
  FStrsEmpty2Null := True;
  FTrimLeft := True;
  FTrimRight := True;
  FFormatSettings := TFDTextFormatSettings.Create(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDTextDataDef.Destroy;
begin
  FDFreeAndNil(FFields);
  FDFreeAndNil(FFormatSettings);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TFDTextDataDef.GetOwner: TPersistent;
begin
  Result := FDataMove;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextDataDef.Assign(ASource: TPersistent);
begin
  if ASource is TFDTextDataDef then begin
    EndOfLine := TFDTextDataDef(ASource).EndOfLine;
    Delimiter := TFDTextDataDef(ASource).Delimiter;
    Separator := TFDTextDataDef(ASource).Separator;
    RecordFormat := TFDTextDataDef(ASource).RecordFormat;
    Fields := TFDTextDataDef(ASource).Fields;
    WithFieldNames := TFDTextDataDef(ASource).WithFieldNames;
    StrsEmpty2Null := TFDTextDataDef(ASource).StrsEmpty2Null;
    TrimLeft := TFDTextDataDef(ASource).TrimLeft;
    TrimRight := TFDTextDataDef(ASource).TrimRight;
    FormatSettings.Assign(TFDTextDataDef(ASource).FormatSettings);
  end
  else
    inherited Assign(ASource);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextDataDef.SetFields(const AValue: TFDTextFields);
begin
  FFields.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextDataDef.SetDelimiter(AValue: Char);
begin
  if FDelimiter <> AValue then begin
    RecordFormat := rfCustom;
    FDelimiter := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextDataDef.SetSeparator(AValue: Char);
begin
  if FSeparator <> AValue then begin
    RecordFormat := rfCustom;
    FSeparator := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextDataDef.SetRecordFormat(AValue: TFDTextRecordFormat);
begin
  if FRecordFormat <> AValue then begin
    FRecordFormat := AValue;
    case AValue of
    rfCommaDoubleQuote:
      begin
        FDelimiter := #34;
        FSeparator := #44;
      end;
    rfSemicolonDoubleQuote:
      begin
        FDelimiter := #34;
        FSeparator := #59;
      end;
    rfTabDoubleQuote:
      begin
        FDelimiter := #34;
        FSeparator := #9;
      end;
    rfFixedLength:
      begin
        FDelimiter := #34;
        FSeparator := #0;
        FWithFieldNames := False;
      end;
    rfFieldPerLine:
      begin
        FDelimiter := #0;
        FSeparator := #0;
        FWithFieldNames := False;
      end;
    else
      FDelimiter := #34;
      FSeparator := #59;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTextDataDef.IsADDS: Boolean;
begin
  Result := (FRecordFormat = rfCustom);
end;

{-------------------------------------------------------------------------------}
procedure TFDTextDataDef.SetWithFieldNames(const AValue: Boolean);
begin
  if FWithFieldNames <> AValue then begin
    FWithFieldNames := AValue;
    if FWithFieldNames and (RecordFormat in [rfFixedLength, rfFieldPerLine]) then
      RecordFormat := rfCommaDoubleQuote;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTextDataDef.SetFormatSettings(const AValue: TFDTextFormatSettings);
begin
  FFormatSettings.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
{ TFDMappingItemExpressionDS                                                    }
{-------------------------------------------------------------------------------}
type
  TFDMappingItemExpressionDS = class(TInterfacedObject, IFDStanExpressionDataSource)
  private
    FMappings: TFDMappings;
    FDataMove: TFDDataMove;
    FThisIndex: Integer;
  protected
    // IFDStanExpressionDataSource
    function GetVarIndex(const AName: String): Integer;
    function GetVarType(AIndex: Integer): TFDDataType;
    function GetVarScope(AIndex: Integer): TFDExpressionScopeKind;
    function GetVarData(AIndex: Integer): Variant;
    procedure SetVarData(AIndex: Integer; const AValue: Variant);
    function GetSubAggregateValue(AIndex: Integer): Variant; virtual;
    function GetPosition: Pointer;
    procedure SetPosition(AValue: Pointer);
    function GetRowNum: Integer;
    function GetDatabase: String;
    function GetUser: String;
  public
    constructor Create(AMappings: TFDMappings; AThisIndex: Integer);
  end;

{-------------------------------------------------------------------------------}
constructor TFDMappingItemExpressionDS.Create(AMappings: TFDMappings;
  AThisIndex: Integer);
begin
  inherited Create;
  FMappings := AMappings;
  FDataMove := AMappings.DataMove;
  FThisIndex := AThisIndex;
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetPosition: Pointer;
begin
  Result := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappingItemExpressionDS.SetPosition(AValue: Pointer);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetRowNum: Integer;
begin
  Result := FDataMove.ReadCount;
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetDatabase: String;
begin
  Result := '';
  if FDataMove.SourceKind = skDataSet then begin
    if (FDataMove.Source is TFDAdaptedDataSet) and
       (TFDAdaptedDataSet(FDataMove.Source).PointedConnection <> nil) and
       (TFDAdaptedDataSet(FDataMove.Source).PointedConnection.ConnectionIntf <> nil) then
      Result := TFDAdaptedDataSet(FDataMove.Source).PointedConnection.ConnectionIntf.CurrentCatalog;
  end
  else
    Result := FDataMove.TextFileName;
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetUser: String;
begin
  Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetSubAggregateValue(AIndex: Integer): Variant;
begin
  Result := Unassigned;
  FDCapabilityNotSupported(Self, [S_FD_LComp, S_FD_LComp_PDM]);
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetVarIndex(const AName: String): Integer;
begin
  Result := FMappings.IndexOfName(AName);
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetVarType(AIndex: Integer): TFDDataType;
const
  FDT2ADDT: array[TFDTextDataType] of TFDDataType = (dtAnsiString, dtAnsiString,
    dtDouble, dtFmtBCD, dtBoolean, dtInt32, dtDate, dtTime, dtDateTime, dtBlob, dtMemo);
var
  iScale, iPrec: Integer;
  iSize: LongWord;
  eAttrs: TFDDataAttributes;
  oItem: TFDMappingItem;
begin
  oItem := FMappings.Items[AIndex];
  if oItem.SourceExpression <> '' then
    if FDataMove.DestinationKind = skText then
      Result := FDT2ADDT[FDataMove.TextDataDef.Fields.FieldByName(oItem.DestinationFieldName).DataType]
    else begin
      Result := dtUnknown;
      iScale := 0;
      iPrec := 0;
      iSize := 0;
      eAttrs := [];
      TFDFormatOptions.FieldDef2ColumnDef(FDataMove.Destination.FieldByName(oItem.DestinationFieldName),
        Result, iSize, iPrec, iScale, eAttrs);
    end
  else if oItem.SourceFieldName <> '' then
    if FDataMove.SourceKind = skText then
      Result := FDT2ADDT[FDataMove.TextDataDef.Fields.FieldByName(oItem.SourceFieldName).DataType]
    else begin
      Result := dtUnknown;
      iScale := 0;
      iPrec := 0;
      iSize := 0;
      eAttrs := [];
      TFDFormatOptions.FieldDef2ColumnDef(FDataMove.Source.FieldByName(oItem.SourceFieldName),
        Result, iSize, iPrec, iScale, eAttrs);
    end;
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetVarScope(AIndex: Integer): TFDExpressionScopeKind;
begin
  Result := ckField;
end;

{-------------------------------------------------------------------------------}
function TFDMappingItemExpressionDS.GetVarData(AIndex: Integer): Variant;
var
  oItem: TFDMappingItem;
begin
  oItem := FMappings.Items[AIndex];
  if AIndex = FThisIndex then
    Result := oItem.GetItemBaseValue
  else
    Result := oItem.ItemValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappingItemExpressionDS.SetVarData(AIndex: Integer; const AValue: Variant);
begin
  FMappings.Items[AIndex].SourceValue := AValue;
end;

{-------------------------------------------------------------------------------}
{ TFDMappingItem                                                                }
{-------------------------------------------------------------------------------}
destructor TFDMappingItem.Destroy;
begin
  Unprepare;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappingItem.Assign(ASource: TPersistent);
begin
  if ASource is TFDMappingItem then begin
    SourceFieldName := TFDMappingItem(ASource).SourceFieldName;
    SourceExpression := TFDMappingItem(ASource).SourceExpression;
    DestinationFieldName := TFDMappingItem(ASource).DestinationFieldName;
  end
  else
    inherited Assign(ASource);
end;

{-------------------------------------------------------------------------------}
function TFDMappingItem.GetDisplayName: string;
begin
  Result := SourceFieldName;
  if Result = '' then
    Result := SourceExpression;
  if (Result <> '') or (DestinationFieldName <> '') then
    Result := Result + '->';
  Result := Result + DestinationFieldName;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappingItem.Prepare;
var
  oParser: IFDStanExpressionParser;
  iDestInd: Integer;
  oDM: TFDDataMove;
begin
  oDM := TFDMappings(Collection).FDataMove;
  if oDM.DestinationKind = skText then begin
    if DestinationFieldName <> '' then
      FDestTextField := oDM.TextDataDef.Fields.FieldByName(DestinationFieldName)
    else
      FDestTextField := oDM.TextDataDef.Fields[Index];
    iDestInd := FDestTextField.Index;
  end
  else begin
    if DestinationFieldName <> '' then
      FDestField := oDM.Destination.FieldByName(DestinationFieldName)
    else
      FDestField := oDM.Destination.Fields[Index];
    iDestInd := FDestField.Index;
    FInKey := pfInKey in FDestField.ProviderFlags;
    FIsIdentity := ((FDestField is TFDAutoIncField) or
      (caAutoInc in oDM.Destination.GetFieldColumn(FDestField).ActualAttributes)) and
      (poIdentityInsert in TFDMappings(Collection).FDataMove.Options);
  end;

  if SourceExpression <> '' then begin
    FDCreateInterface(IFDStanExpressionParser, oParser);
    FSourceEvaluator := oParser.Prepare(
      TFDMappingItemExpressionDS.Create(TFDMappings(Collection), iDestInd),
      SourceExpression, [], [poDefaultExpr], '');
  end;
  if (SourceFieldName = '') and (SourceExpression <> '') then begin
    FSourceTextField := nil;
    FSourceField := nil;
  end
  else if SourceFieldName <> '' then
    if oDM.SourceKind = skText then
      FSourceTextField := oDM.TextDataDef.Fields.FieldByName(SourceFieldName)
    else
      FSourceField := oDM.Source.FieldByName(SourceFieldName)
  else
    try
      if oDM.SourceKind = skText then
        FSourceTextField := oDM.TextDataDef.Fields[iDestInd]
      else
        FSourceField := oDM.Source.Fields[iDestInd];
    except
      FDException(TFDMappings(Collection).FDataMove, [S_FD_LComp, S_FD_LComp_PDM],
        er_FD_DPSrcUndefined, [DestinationFieldName]);
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappingItem.Unprepare;
begin
  FDestField := nil;
  FDestTextField := nil;
  FDestValue := Unassigned;
  FSourceField := nil;
  FSourceTextField := nil;
  FSourceEvaluator := nil;
  FSourceValue := Unassigned;
end;

{-------------------------------------------------------------------------------}
function TFDMappingItem.GetItemBaseValue: Variant;
begin
  if FSourceTextField <> nil then
    Result := FSourceValue
  else if FSourceField <> nil then
    Result := FSourceField.Value
  else
    Result := Null;
end;

{-------------------------------------------------------------------------------}
function TFDMappingItem.GetItemValue: Variant;
begin
  if FSourceEvaluator <> nil then
    Result := FSourceEvaluator.Evaluate
  else
    Result := GetItemBaseValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappingItem.Move;

  procedure SetupIdentityInsertion;
  begin
    if FDestField is TFDAutoIncField then
      TFDAutoIncField(FDestField).IdentityInsert := True
    else begin
      FDestField.ReadOnly := False;
      FDestField.ProviderFlags := FDestField.ProviderFlags + [pfInUpdate];
    end;
  end;

var
  V: Variant;
begin
  if FDestTextField <> nil then
    FDestValue := ItemValue
  else if (FSourceField <> nil) and (FSourceEvaluator = nil) then begin
    if FIsIdentity and not FSourceField.IsNull then
      SetupIdentityInsertion;
    FDestField.Assign(FSourceField);
  end
  else begin
    V := ItemValue;
    if VarIsNull(V) then
      FDestField.Clear
    else begin
      if FIsIdentity then
        SetupIdentityInsertion;
      if FDestField is TBinaryField then
        if (TFDMappings(Collection).FDataMove.SourceKind = skText) and
           (TFDMappings(Collection).FDataMove.TextFileEncoding = ecANSI) then
{$IFDEF NEXTGEN}
          FDestField.AsString := String(V)
{$ELSE}
          FDestField.AsAnsiString := AnsiString(V)
{$ENDIF}
        else
          FDestField.AsWideString := V
      else
        FDestField.Value := V;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDMappingItem.GetAsText: String;
begin
  if DestinationFieldName = SourceFieldName then
    Result := DestinationFieldName
  else
    Result := DestinationFieldName + '=' + SourceFieldName;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappingItem.SetAsText(const AValue: String);
var
  i: Integer;
begin
  i := Pos('=', AValue);
  if i <> 0 then begin
    DestinationFieldName := Copy(AValue, 1, i - 1);
    SourceFieldName := Copy(AValue, i + 1, Length(AValue));
  end
  else begin
    DestinationFieldName := AValue;
    SourceFieldName := AValue;
  end;
  for i := 1 to Length(SourceFieldName) do
    if not FDInSet(SourceFieldName[i], ['A'..'Z', 'a'..'z', '0'..'9', '_', '$', '#']) then begin
      SourceExpression := SourceFieldName;
      SourceFieldName := '';
      Break;
    end;
end;

{-------------------------------------------------------------------------------}
{ TFDMappings                                                                   }
{-------------------------------------------------------------------------------}
constructor TFDMappings.Create(ADataMove: TFDDataMove);
begin
  inherited Create(TFDMappingItem);
  FDataMove := ADataMove;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappings.Assign(ASource: TPersistent);
var
  i: Integer;
begin
  if ASource is TStrings then begin
    Clear;
    for i := 0 to TStrings(ASource).Count - 1 do
      Add(TStrings(ASource).Strings[i]);
  end
  else
    inherited Assign(ASource);
end;

{-------------------------------------------------------------------------------}
function TFDMappings.GetItem(AIndex: Integer): TFDMappingItem;
begin
  Result := TFDMappingItem(inherited GetItem(AIndex));
end;

{-------------------------------------------------------------------------------}
function TFDMappings.GetOwner: TPersistent;
begin
  Result := FDataMove;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappings.SetItem(AIndex: Integer; const AValue: TFDMappingItem);
begin
  inherited SetItem(AIndex, AValue);
end;

{-------------------------------------------------------------------------------}
function TFDMappings.Add: TFDMappingItem;
begin
  Result := TFDMappingItem(inherited Add);
end;

{-------------------------------------------------------------------------------}
procedure TFDMappings.Add(const AMapItem: String);
begin
  Add.AsText := AMapItem;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappings.AddAll;
var
  oDestDS, oSrcDS: TDataSet;
  oItem: TFDMappingItem;
  oDestFld, oSrcFld: TField;
  oDestTxtFld, oSrcTxtFld: TFDTextField;
  i: Integer;
begin
  Clear;
  if (FDataMove.SourceKind = skDataSet) and
     (FDataMove.DestinationKind = skDataSet) then begin
    oSrcDS := FDataMove.Source;
    oDestDS := FDataMove.Destination;
    if (oSrcDS = nil) or (oDestDS = nil) then
      Exit;
    oSrcDS.Active := True;
    oDestDS.Active := True;
    for i := 0 to oDestDS.Fields.Count - 1 do begin
      oDestFld := oDestDS.Fields[i];
      oSrcFld := oSrcDS.FindField(oDestFld.FieldName);
      if oSrcFld <> nil then begin
        oItem := Add;
        oItem.DestinationFieldName := oDestFld.FieldName;
        oItem.SourceFieldName := oSrcFld.FieldName;
      end;
    end;
  end
  else if (FDataMove.SourceKind = skDataSet) and
          (FDataMove.DestinationKind = skText) then begin
    oSrcDS := FDataMove.Source;
    if oSrcDS = nil then
      Exit;
    oSrcDS.Active := True;
    for i := 0 to FDataMove.TextDataDef.Fields.Count - 1 do begin
      oDestTxtFld := FDataMove.TextDataDef.Fields[i];
      oSrcFld := oSrcDS.FindField(oDestTxtFld.FieldName);
      oItem := Add;
      oItem.DestinationFieldName := oDestTxtFld.FieldName;
      if oSrcFld <> nil then
        oItem.SourceFieldName := oSrcFld.FieldName;
    end;
  end
  else if (FDataMove.SourceKind = skText) and
          (FDataMove.DestinationKind = skDataSet) then begin
    oDestDS := FDataMove.Destination;
    if oDestDS = nil then
      Exit;
    oDestDS.Active := True;
    for i := 0 to oDestDS.Fields.Count - 1 do begin
      oDestFld := oDestDS.Fields[i];
      oSrcTxtFld := FDataMove.TextDataDef.Fields.FindField(oDestFld.FieldName);
      oItem := Add;
      oItem.DestinationFieldName := oDestFld.FieldName;
      if oSrcTxtFld <> nil then
        oItem.SourceFieldName := oSrcTxtFld.FieldName;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappings.Prepare;
var
  i: Integer;
begin
  try
    if FDataMove.TextDataDef.Fields.Count = 0 then begin
      FTextFieldsAdded := True;
      FDataMove.TextDataDef.Fields.AddAll;
    end;
    if Count = 0 then begin
      FMappingsAdded := True;
      AddAll;
    end;
    for i := 0 to Count - 1 do
      Items[i].Prepare;
  except
    Unprepare;
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappings.Unprepare;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Unprepare;
  if FMappingsAdded then begin
    Clear;
    FMappingsAdded := False;
  end;
  if FTextFieldsAdded then begin
    FDataMove.TextDataDef.Fields.Clear;
    FTextFieldsAdded := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDMappings.Move(AKeysOnly: Boolean);
var
  i: Integer;
  oItem: TFDMappingItem;
begin
  for i := 0 to Count - 1 do begin
    oItem := Items[i];
    if not AKeysOnly or oItem.InKey then
      oItem.Move;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDMappings.IndexOfName(const AName: String): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if AnsiCompareText(Items[i].DestinationFieldName, AName) = 0 then begin
      Result := i;
      Break;
    end;
end;

{-------------------------------------------------------------------------------}
{ TFDDataMove                                                                   }
{-------------------------------------------------------------------------------}
constructor TFDDataMove.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTextDataDef := TFDTextDataDef.Create(Self);
  FMappings := TFDMappings.Create(Self);
  FOptions := [poOptimiseDest, poOptimiseSrc, poAbortOnExc, poIdentityInsert];
  FCommitCount := 100;
  FMode := dmAlwaysInsert;
  FTextFileName := 'Data.txt';
  FTextFileEncoding := ecDefault;
  FTextAnalyzeSample := 10;
  FLogFileAction := laNone;
  FLogFileName := 'Data.log';
  FLogFileEncoding := ecDefault;
  FSourceKind := skDataSet;
  FDestinationKind := skDataSet;
  FStatisticsInterval := 100;
end;

{-------------------------------------------------------------------------------}
destructor TFDDataMove.Destroy;
begin
  FDFreeAndNil(FTextDataDef);
  FDFreeAndNil(FMappings);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then begin
    if AComponent = FSource then
      Source := nil
    else if AComponent = FDestination then
      Destination := nil;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetTextDataDef(const AValue: TFDTextDataDef);
begin
  FTextDataDef.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetMappings(const AValue: TFDMappings);
begin
  FMappings.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetDestinationKind(const AValue: TFDDataSourceKind);
begin
  if FDestinationKind <> AValue then begin
    FDestinationKind := AValue;
    if DestinationKind = skText then begin
      Mode := dmAlwaysInsert;
      Destination := nil;
      if SourceKind = skText then
        SourceKind := skDataSet;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetSourceKind(const AValue: TFDDataSourceKind);
begin
  if FSourceKind <> AValue then begin
    FSourceKind := AValue;
    if SourceKind = skText then begin
      Source := nil;
      if DestinationKind = skText then
        DestinationKind := skDataSet;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetDestination(const AValue: TFDAdaptedDataSet);
begin
  if FDestination <> AValue then begin
    if FDestination <> nil then
      FDestination.RemoveFreeNotification(Self);
    FDestination := AValue;
    if AValue = Source then
      Source := nil;
    if FDestination <> nil then begin
      FDestination.FreeNotification(Self);
      DestinationKind := skDataSet;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetSource(const AValue: TDataSet);
begin
  if FSource <> AValue then begin
    if FSource <> nil then
      FSource.RemoveFreeNotification(Self);
    FSource := AValue;
    if AValue = Destination then
      Destination := nil;
    if FSource <> nil then begin
      FSource.FreeNotification(Self);
      SourceKind := skDataSet;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.TextDataAssigned;
begin
  if FSource = nil then
    SourceKind := skText
  else if FDestination = nil then
    DestinationKind := skText;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetTextFileName(const AValue: String);
begin
  if FTextFileName <> AValue then begin
    FTextFileName := AValue;
    TextDataAssigned;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetTextStream(const AValue: TStream);
begin
  if FTextStream <> AValue then begin
    FTextStream := AValue;
    TextDataAssigned;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetMode(const AValue: TFDDataMoveMode);
begin
  if FMode <> AValue then begin
    FMode := AValue;
    if DestinationKind = skText then
      FMode := dmAlwaysInsert;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.GetWriteCount: LongInt;
begin
  Result := FInsertCount + FUpdateCount + FDeleteCount;
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.Execute: LongInt;
begin
  if (SourceKind = skDataSet) and (DestinationKind = skDataSet) then
    Result := ExecuteTableToTable
  else if (SourceKind = skDataSet) and (DestinationKind = skText) then
    Result := ExecuteTableToText
  else if (SourceKind = skText) and (DestinationKind = skDataSet) then
    Result := ExecuteTextToTable
  else
    Result := -1;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.DoStatistic(APhase: TFDDataMovePhase);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Self, APhase);
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.InitLogFile: TFDTextFile;
var
  S: String;
begin
  if ((LogFileName > #32) or (LogStream <> nil)) and (LogFileAction <> laNone) then begin
    if LogStream <> nil then
      Result := TFDTextFile.Create(LogStream, False, False, LogFileAction = laCreate,
        LogFileEncoding, elDefault)
    else
      Result := TFDTextFile.Create(LogFileName, False, LogFileAction = laCreate,
        LogFileEncoding, elDefault);
    S := C_FD_EOL + C_FD_EOL + '*************** ' + S_FD_StartLog + ' ' +
      DateTimeToStr(Now) + ' ***************';
    Result.WriteLine(S);
  end
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.ProcessException(E: Exception; ALog: TFDTextFile;
  out AAction: TFDErrorAction);
var
  sSQL, S: String;
begin
  AAction := eaFail;
  if E is EDatabaseError then begin
    if Assigned(FOnError) then begin
      FOnError(Self, AAction);
      if AAction = eaDefault then
        AAction := eaFail;
    end;
    if AAction in [eaFail, eaSkip] then begin
      Inc(FExceptionCount);
      if ALog <> nil then begin
        if E is EFDDBEngineException then
          sSQL := EFDDBEngineException(E).SQL
        else
          sSQL := '';
        S := C_FD_EOL + E.Message + C_FD_EOL + C_FD_EOL + sSQL;
        ALog.WriteLine(S);
      end;
    end;
    if (AAction = eaFail) and (poAbortOnExc in Options) then
      AAction := eaExitFailure;
  end
  else
    AAction := eaExitFailure;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.DeleteExceptionFile(ALog: TFDTextFile);
var
  S: String;
begin
  if ALog <> nil then
    try
      if FExceptionCount = 0 then begin
        S := C_FD_EOL + '          **********  ' + S_FD_NoErrorsLogged + ' ' +
          '**********';
        ALog.WriteLine(S);
      end;
      S := C_FD_EOL + '*************** ' + S_FD_EndLog + ' ' +
        DateTimeToStr(Now) + ' ***************';
      ALog.WriteLine(S);
    finally
      FDFree(ALog);
    end;
end;

{-------------------------------------------------------------------------------}
type
  __TFDAdaptedDataSet = class(TFDAdaptedDataSet)
  end;

procedure TFDDataMove.SetupSource;
var
  oFO: TFDFetchOptions;
begin
  Source.DisableControls;
  if (poOptimiseSrc in Options) and (Source is TFDAdaptedDataSet) and
     not IsSrcMemTable and __TFDAdaptedDataSet(Source).FClientCursor then begin
    oFO := __TFDAdaptedDataSet(Source).FetchOptions;
    oFO.Items := [fiBlobs, fiDetails];
    oFO.Mode := fmOnDemand;
    if oFO.RowsetSize < CommitCount then
      oFO.RowsetSize := CommitCount;
    oFO.Cache := [];
    oFO.Unidirectional := True;
  end;
  if not (poSrcFromCurRec in Options) and Source.Active and not Source.Bof then
    try
      Source.First;
    except
      if not IsSrcMemTable then begin
        Source.Close;
        Source.Open;
      end;
    end
  else
    Source.Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.SetupDestination;
var
  oDS: __TFDAdaptedDataSet;
begin
  Destination.DisableControls;
  if poOptimiseDest in Options then begin
    oDS := __TFDAdaptedDataSet(Destination);
    oDS.FetchOptions.Items := [fiMeta];
    oDS.FetchOptions.Mode := fmManual;
    oDS.UpdateOptions.FastUpdates := True;
  end;
  oDS := __TFDAdaptedDataSet(Destination);
  if (oDS.Command <> nil) and (oDS.Command.CommandText.Count > 0) then
    oDS.CheckOnline;
  Destination.Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.CheckTextSetup;
var
  i: Integer;
begin
  if TextDataDef.RecordFormat = rfFixedLength then
    for i := 0 to TextDataDef.Fields.Count - 1 do
      if TextDataDef.Fields[i].FieldSize < 0 then
        FDException(Self, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPBadFixedSize,
          [TextDataDef.Fields[i].FieldName]);
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.TrimText(const AStr: String; AHeader: Boolean): String;
begin
  if not ((Length(AStr) <> 0) and ((AStr[Length(AStr)] <= ' ') or (AStr[1] <= ' '))) then
    Result := AStr
  else if AHeader or TextDataDef.TrimLeft and TextDataDef.TrimRight then
    Result := Trim(AStr)
  else begin
    Result := AStr;
    if TextDataDef.TrimLeft then
      Result := TrimLeft(Result);
    if TextDataDef.TrimRight then
      Result := TrimRight(Result);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.GuessTextFormat(AText: TFDTextFile; AAnalyze: TFDTextAnalyze);
var
  sLine1, sLine2, sItem: String;
  i, j, n, iLen: Integer;
  iBmk: Int64;
  rFmt: TFDParseFmtSettings;
  lFieldNames, lAllStrings, lFieldNamesUC: Boolean;
  oField: TFDTextField;
  eType: TFDTextDataType;

  function Unquote(const AStr: String; AHeader: Boolean): String;
  begin
    Result := TrimText(AStr, AHeader);
    if (Result <> '') and (Result[1] = rFmt.FQuote) and (Result[Length(Result)] = rFmt.FQuote) then
      Result := Copy(Result, 2, Length(Result) - 2);
  end;

  function CheckSet(const AStr: String; ASet1, ASet2: TFDCharSet): Boolean;
  var
    i: Integer;
  begin
    Result := FDInSet(AStr[1], ASet1);
    if Result then
      for i := 2 to Length(AStr) do begin
        if not FDInSet(AStr[i], ASet2) then begin
          Result := False;
          Exit;
        end;
      end;
  end;

  function GetType(AItem: String; AHeader: Boolean): TFDTextDataType;
  var
    iVal: Int64;
    eVal: Extended;
    dtVal: TDateTime;
  begin
    AItem := UpperCase(Unquote(AItem, AHeader));
    if (AItem = '') or (TextDataDef.FormatSettings.NullVals.IndexOf(AItem) >= 0) then
      Result := atOther
    else if CheckSet(AItem, ['0'..'9', '+', '-'], ['0'..'9']) and
            TryStrToInt64(AItem, iVal) then
      Result := atLongInt
    else if CheckSet(AItem, ['0'..'9', '+', '-', TextDataDef.FormatSettings.DecimalSeparator],
                            ['0'..'9', TextDataDef.FormatSettings.DecimalSeparator]) and
            TryStrToFloat(AItem, eVal, TextDataDef.FormatSettings.FFS) then
      Result := atFloat
    else if CheckSet(AItem, ['0'..'9'], ['0'..'9', TextDataDef.FormatSettings.DateSeparator]) and
            TryStrToDate(AItem, dtVal, TextDataDef.FormatSettings.FFS) then
      Result := atDate
    else if CheckSet(AItem, ['0'..'9'], ['0'..'9', TextDataDef.FormatSettings.TimeSeparator]) and
            TryStrToTime(AItem, dtVal, TextDataDef.FormatSettings.FFS) then
      Result := atTime
    else if CheckSet(AItem, ['0'..'9'], ['0'..'9', TextDataDef.FormatSettings.DateSeparator,
                                         TextDataDef.FormatSettings.TimeSeparator, ' ']) and
            TryStrToDateTime(AItem, dtVal, TextDataDef.FormatSettings.FFS) then
      Result := atDateTime
    else if AHeader and CheckSet(AItem, ['A'..'Z', '_'], ['A'..'Z', '0'..'9', '_', '#', '$']) then
      Result := atString
    else if (Length(AItem) >= 32) and CheckSet(AItem, ['0'..'9', 'A'..'F'], ['0'..'9', 'A'..'F']) then
      Result := atBlob
    else if (TextDataDef.FormatSettings.BoolTrueVals.IndexOf(AItem) >= 0) or
            (TextDataDef.FormatSettings.BoolFalseVals.IndexOf(AItem) >= 0) or
            (AItem = 'T') or (AItem = 'F') or (AItem = 'TRUE') or (AItem = 'FALSE') or
            (AItem = 'Y') or (AItem = 'N') or (AItem = 'YES') or (AItem = 'NO') then
      Result := atBool
    else
      Result := atString;
  end;

begin
  sLine1 := AText.ReadLine;
  if taDelimSep in AAnalyze then begin
    TextDataDef.RecordFormat := rfCustom;
    if Pos(#9, sLine1) <> 0 then
      TextDataDef.Separator := #9
    else if Pos(';', sLine1) <> 0 then
      TextDataDef.Separator := ';'
    else if Pos(',', sLine1) <> 0 then
      TextDataDef.Separator := ',';
    TextDataDef.Delimiter := '"';
  end;
  if taFormatSet in AAnalyze then begin
    TextDataDef.FormatSettings.DecimalSeparator := '.';
    TextDataDef.FormatSettings.DateSeparator := '-';
    TextDataDef.FormatSettings.ShortDateFormat := 'yyyy/MM/dd';
    TextDataDef.FormatSettings.TimeSeparator := ':';
    TextDataDef.FormatSettings.ShortTimeFormat := 'HH:mm:ss';
  end;
  rFmt.FDelimiter := TextDataDef.Separator;
  rFmt.FQuote := TextDataDef.Delimiter;
  rFmt.FQuote1 := #0;
  rFmt.FQuote2 := #0;

  if taHeader in AAnalyze then begin
    lFieldNames := True;
    lAllStrings := True;
    lFieldNamesUC := True;
    i := 1;
    while i <= Length(sLine1) do begin
      sItem := Trim(FDExtractFieldName(sLine1, i, rFmt));
      if (sItem = '') or (GetType(sItem, True) <> atString) then begin
        lFieldNames := False;
        Break;
      end;
      if not CheckSet(sItem, ['A'..'Z', '_'], ['A'..'Z', '0'..'9', '_', '#', '$']) then
        lFieldNamesUC := False;
    end;
    if lFieldNames then begin
      iBmk := AText.Stream.Position;
      for j := 1 to TextAnalyzeSample do begin
        sLine2 := AText.ReadLine;
        if sLine2 = '' then
          Break;
        i := 1;
        while i <= Length(sLine2) do begin
          sItem := Trim(FDExtractFieldName(sLine2, i, rFmt));
          if not (GetType(sItem, False) in [atOther, atString]) then begin
            lAllStrings := False;
            Break;
          end;
        end;
        if not lAllStrings then
          Break;
      end;
      AText.Stream.Position := iBmk;
    end;
    TextDataDef.WithFieldNames := lFieldNames and (not lAllStrings or lFieldNamesUC);
  end;

  if taFields in AAnalyze then begin
    TextDataDef.Fields.Clear;
    if TextDataDef.WithFieldNames then begin
      i := 1;
      while i <= Length(sLine1) do
        TextDataDef.Fields.Add.FieldName := Unquote(FDExtractFieldName(sLine1, i, rFmt), True);
      sLine2 := AText.ReadLine;
    end
    else
      sLine2 := sLine1;
    n := 0;
    repeat
      i := 1;
      j := 0;
      while i <= Length(sLine2) do begin
        sItem := FDExtractFieldName(sLine2, i, rFmt);
        if (n = 0) and not TextDataDef.WithFieldNames then
          oField := TextDataDef.Fields.Add
        else
          oField := TextDataDef.Fields[j];
        Inc(j);
        eType := GetType(sItem, False);
        if eType <> atOther then begin
          case oField.DataType of
          atLongInt:
            if eType = atFloat then
              oField.DataType := atFloat
            else if eType <> atLongInt then
              oField.DataType := atMemo;
          atFloat:
            if not (eType in [atLongInt, atFloat]) then
              oField.DataType := atMemo;
          atDate,
          atTime:
            if eType = atDateTime then
              oField.DataType := eType
            else if not (eType in [atDate, atTime]) then
              oField.DataType := atMemo;
          atDateTime:
            if not (eType in [atDate, atTime, atDateTime]) then
              oField.DataType := atMemo;
          atBool:
            if eType <> atBool then
              oField.DataType := atMemo;
          atString:
            ;
          atOther:
            oField.DataType := eType;
          end;
          iLen := Length(Unquote(sItem, False));
          if iLen > oField.FieldSize then
            oField.FieldSize := iLen;
        end;
      end;
      if n < TextAnalyzeSample then
        sLine2 := AText.ReadLine;
      Inc(n);
    until (sLine2 = '') or (n = TextAnalyzeSample);
    for i := 0 to TextDataDef.Fields.Count - 1 do begin
      oField := TextDataDef.Fields[i];
      if oField.DataType = atMemo then
        oField.DataType := atString;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.AbortJob;
begin
  if (Source <> nil) and (Source is TFDAdaptedDataSet) then
    TFDAdaptedDataSet(Source).AbortJob(True);
  if Destination <> nil then
    Destination.AbortJob(True);
  FAborting := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.GuessTextFormat(
  AAnalyze: TFDTextAnalyze = [taDelimSep, taHeader, taFields]);
var
  oText: TFDTextFile;
  iBmk: Int64;
begin
  if TextStream <> nil then begin
    iBmk := TextStream.Position;
    oText := TFDTextFile.Create(TextStream, False, True, False,
      TextFileEncoding, TextDataDef.EndOfLine);
  end
  else begin
    iBmk := -1;
    oText := TFDTextFile.Create(TextFileName, True, False,
      TextFileEncoding, TextDataDef.EndOfLine);
  end;
  try
    GuessTextFormat(oText, AAnalyze);
  finally
    if TextStream <> nil then
      TextStream.Position := iBmk;
    FDFree(oText);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.IsSrcMemTable: Boolean;
begin
  Result := (SourceKind = skDataSet) and (Source <> nil) and
    (Source is TFDCustomMemTable) and (TFDCustomMemTable(Source).Command = nil);
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.IsDestMemTable: Boolean;
begin
  Result := (DestinationKind = skDataSet) and (Destination <> nil) and
    (Destination is TFDCustomMemTable) and (TFDCustomMemTable(Destination).Command = nil);
end;

{-------------------------------------------------------------------------------}
procedure TFDDataMove.CreateDestinationDataSet;
var
  oDS: TDataSet;
  i: Integer;
begin
  oDS := Destination;
  if not IsDestMemTable or oDS.Active then
    Exit;
  if SourceKind = skText then begin
    oDS.FieldDefs.Clear;
    for i := 0 to TextDataDef.Fields.Count - 1 do
      TextDataDef.Fields[i].DefineFieldDef(oDS.FieldDefs.AddFieldDef);
  end
  else if SourceKind = skDataSet then begin
    if not Source.FieldDefs.Updated then
      Source.FieldDefs.Update;
    oDS.FieldDefs.Assign(Source.FieldDefs);
  end;
  oDS.Active := True;
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.FindDestRecord: Boolean;
begin
  if Assigned(FOnFindDestRecord) then begin
    Result := False;
    FOnFindDestRecord(Self, Result);
  end
  else begin
    Destination.ServerSetKey;
    Mappings.Move(True);
    Result := Destination.ServerGotoKey;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.ExecuteTableToTable: LongInt;
var
  oLog: TFDTextFile;
  iAction: TFDDataMoveAction;
  oDestConn: TFDCustomConnection;
  lExcLogged: Boolean;
  oWait: IFDGUIxWaitCursor;
  lDestDisconnected, lSrcActive, lDestActive, lRetry: Boolean;
  eErrorAction: TFDErrorAction;
begin
  if Source = nil then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPNoSrcDS, []);
  if Destination = nil then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPNoDestDS, []);

  FReadCount := 0;
  FInsertCount := 0;
  FUpdateCount := 0;
  FDeleteCount := 0;
  FExceptionCount := 0;
  FAborting := False;
  lExcLogged := False;
  oLog := nil;
  oWait := nil;
  lDestDisconnected := False;
  oDestConn := nil;

  DoStatistic(psPreparing);
  if not FAborting then
  try
    if not FDGUIxSilent then begin
      FDCreateInterface(IFDGUIxWaitCursor, oWait);
      oWait.StartWait;
    end;
    oLog := InitLogFile;

    try
      oDestConn := Destination.PointedConnection;
      if oDestConn <> nil then begin
        lDestDisconnected := not oDestConn.Connected;
        oDestConn.Connected := True;
      end;
      if CommitCount > 0 then
        if (oDestConn <> nil) and not oDestConn.InTransaction then
          oDestConn.StartTransaction;
      lSrcActive := Source.Active;
      lDestActive := Destination.Active;
      try

        SetupSource;
        CreateDestinationDataSet;
        lDestActive := Destination.Active;
        SetupDestination;
        Mappings.Prepare;

        if [poClearDest, poClearDestNoUndo] * Options <> [] then
          iAction := paAlwaysInsert
        else if Mode = dmAlwaysInsert then
          iAction := paAlwaysInsert
        else if Mode = dmDelete then
          iAction := paDelete
        else
          iAction := paSkip;

        if [poClearDest, poClearDestNoUndo] * Options <> [] then
          Destination.ServerDeleteAll(poClearDestNoUndo in Options);

        DoStatistic(psStarting);

        while not FSource.Eof and not FAborting do begin
          if oWait <> nil then
            oWait.StartWait;
          try
            Inc(FReadCount);

            if not (iAction in [paDelete, paAlwaysInsert]) then begin
              iAction := paSkip;
              if FindDestRecord then begin
                if (Mode = dmUpdate) or (Mode = dmAppendUpdate) then
                  iAction := paUpdate;
              end
              else begin
                if (Mode = dmAppend) or (Mode = dmAppendUpdate) then
                  iAction := paInsert;
              end;
            end;

            if CommitCount > 0 then
              if (oDestConn <> nil) and not oDestConn.InTransaction then
                oDestConn.StartTransaction;

            repeat
              lRetry := False;
              try
                case iAction of
                paInsert, paAlwaysInsert:
                  begin
                    Destination.ServerAppend;
                    Mappings.Move(False);
                    Destination.ServerPerform;
                    Inc(FInsertCount);
                  end;
                paUpdate:
                  begin
                    Destination.ServerEdit;
                    Mappings.Move(False);
                    Destination.ServerPerform;
                    Inc(FUpdateCount);
                  end;
                paDelete:
                  begin
                    Destination.ServerDelete;
                    Mappings.Move(True);
                    Destination.ServerPerform;
                    Inc(FDeleteCount);
                  end;
                end;
              except
                on E: Exception do begin
                  if CommitCount > 0 then
                    if (oDestConn <> nil) and oDestConn.InTransaction then
                      oDestConn.Rollback;
                  lExcLogged := True;
                  ProcessException(E, oLog, eErrorAction);
                  case eErrorAction of
                  eaFail:        lRetry := False;
                  eaSkip:        lRetry := False;
                  eaRetry:       lRetry := True;
                  eaApplied:     lRetry := False;
                  eaExitSuccess: FAborting := True;
                  eaExitFailure: raise;
                  end;
                  lExcLogged := False;
                end;
              end;
            until not lRetry;

            try
              Source.Next;
            except
              Source.UpdateCursorPos;
            end;

            if (CommitCount > 0) and (WriteCount mod CommitCount = 0) then
              if (oDestConn <> nil) and oDestConn.InTransaction then
                oDestConn.Commit;

            if StatisticsInterval > 0 then
              if FReadCount mod StatisticsInterval = 0 then
                DoStatistic(psProgress);
          finally
            if oWait <> nil then
              oWait.StopWait;
          end;
        end;

        DoStatistic(psFinishing);
        if not IsSrcMemTable then
          Source.Close;
        if not IsDestMemTable then
          Destination.Disconnect;

      finally
        Source.Active := lSrcActive;
        Destination.Active := lDestActive;
        Source.EnableControls;
        Destination.EnableControls;
      end;

      if CommitCount > 0 then
        if (oDestConn <> nil) and oDestConn.InTransaction then
          oDestConn.Commit;

    except
      on E: Exception do begin
        if CommitCount > 0 then
          if (oDestConn <> nil) and oDestConn.InTransaction then
            oDestConn.Rollback;
        if not lExcLogged then
          ProcessException(E, oLog, eErrorAction);
        if eErrorAction = eaExitFailure then
          raise;
      end;
    end;

  finally
    if (oDestConn <> nil) and lDestDisconnected then
      oDestConn.Connected := False;
    Mappings.Unprepare;
    DeleteExceptionFile(oLog);
    if oWait <> nil then
      oWait.StopWait;
  end;
  DoStatistic(psUnpreparing);
  Result := WriteCount;
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.ExecuteTableToText: LongInt;
var
  oLog: TFDTextFile;
  oText: TFDTextFile;
  oTextField: TFDTextField;
  sVal: String;
  lNeedDelim: Boolean;
  i: Integer;
  oWait: IFDGUIxWaitCursor;
  lSrcActive: Boolean;
  eErrorAction: TFDErrorAction;

  function GetStr(ATxtFld: TFDTextField): String;
  var
    i: Integer;
    v: Variant;
    oItem: TFDMappingItem;
    sb: TFDByteString;
    iLen: Integer;
    pData: Pointer;
  begin
    Result := '';
    for i := 0 to Mappings.Count - 1 do begin
      oItem := Mappings[i];
      if oItem.DestTextField = ATxtFld then begin
        v := oItem.DestValue;
        if VarIsEmpty(v) or VarIsNull(v) then
          if TextDataDef.FormatSettings.NullVals.Count > 0 then
            Result := TextDataDef.FormatSettings.NullVals[0]
          else
            Result := ''
        else
          { TODO -cPUMP : Here we should format values }
          case ATxtFld.DataType of
          atOther,
          atString:
            Result := v;
          atFloat:
            Result := FDFloat2Str(v, TextDataDef.FormatSettings.DecimalSeparator,
              ATxtFld.Precision);
          atNumber:
            Result := v;
          atBool:
            if (v) then
              if TextDataDef.FormatSettings.BoolTrueVals.Count > 0 then
                Result := TextDataDef.FormatSettings.BoolTrueVals[0]
              else
                Result := 'T'
            else
              if TextDataDef.FormatSettings.BoolFalseVals.Count > 0 then
                Result := TextDataDef.FormatSettings.BoolFalseVals[0]
              else
                Result := 'F';
          atLongInt:
            Result := v;
          atDate:
            Result := DateToStr(v, TextDataDef.FormatSettings.FFS);
          atTime:
            Result := TimeToStr(v, TextDataDef.FormatSettings.FFS);
          atDateTime:
            Result := DateTimeToStr(v, TextDataDef.FormatSettings.FFS);
          atBlob:
            if VarIsArray(v) then begin
              iLen := VarArrayHighBound(v, 1) + 1;
              pData := VarArrayLock(v);
              try
                Result := FDBin2Hex(pData, iLen);
              finally
                VarArrayUnlock(v);
              end;
            end
            else begin
              sb := TFDEncoder.Enco(v, ecANSI);
              Result := FDBin2Hex(PByte(sb), TFDEncoder.EncoLength(sb, ecANSI));
            end;
          atMemo:
            Result := v;
          end;
        Break;
      end;
    end;
  end;

  procedure DoubleChar(ACh: Char; var AStr: String);
  var
    j: Integer;
  begin
    j := 1;
    repeat
      j := Pos(ACh, AStr, j);
      if j > 0 then begin
        Insert(ACh, AStr, j);
        Inc(j, 2);
      end;
    until j = 0;
  end;

  function HasChars(const AStr: String; ASet: TFDCharSet): Boolean;
  var
    pStr: PChar;
  begin
    pStr := PChar(AStr);
    while (pStr^ <> #0) and not FDInSet(pStr^, ASet) do
      Inc(pStr);
    Result := pStr^ <> #0;
  end;

begin
  if Source = nil then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPNoSrcDS, []);
  if (TextFileName = '') and (TextStream = nil) then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPNoTxtDest, []);

  FReadCount := 0;
  FInsertCount := 0;
  FUpdateCount := 0;
  FDeleteCount := 0;
  FExceptionCount := 0;
  FAborting := False;
  oLog := nil;
  oWait := nil;
  oText := nil;

  DoStatistic(psPreparing);
  if not FAborting then
  try
    if not FDGUIxSilent then begin
      FDCreateInterface(IFDGUIxWaitCursor, oWait);
      oWait.StartWait;
    end;
    oLog := InitLogFile;

    lSrcActive := Source.Active;
    try

      if TextStream <> nil then
        oText := TFDTextFile.Create(TextStream, False, False,
          [poClearDest, poClearDestNoUndo] * Options = [],
          TextFileEncoding, TextDataDef.EndOfLine)
      else
        oText := TFDTextFile.Create(TextFileName, False,
          [poClearDest, poClearDestNoUndo] * Options = [],
          TextFileEncoding, TextDataDef.EndOfLine);
      SetupSource;
      Mappings.Prepare;
      CheckTextSetup;

      try
        DoStatistic(psStarting);

        if TextDataDef.WithFieldNames then begin
          for i := 0 to TextDataDef.Fields.Count - 1 do begin
            if i > 0 then
              oText.WriteChar(TextDataDef.FSeparator);
            if TextDataDef.Delimiter <> #0 then
              oText.WriteChar(TextDataDef.FDelimiter);
            oText.WriteText(TextDataDef.Fields[i].FFieldName);
            if TextDataDef.Delimiter <> #0 then
              oText.WriteChar(TextDataDef.FDelimiter);
          end;
          oText.WriteLine('');
        end;

        while not Source.Eof and not FAborting do begin
          if oWait <> nil then
            oWait.StartWait;
          try
            Inc(FReadCount);

            Mappings.Move(False);
            for i := 0 to TextDataDef.Fields.Count - 1 do begin
              oTextField := TextDataDef.Fields[i];
              sVal := GetStr(oTextField);
              if TextDataDef.Delimiter <> #0 then
                DoubleChar(TextDataDef.Delimiter, sVal);
              lNeedDelim := (oTextField.DataType in [atMemo, atString, atOther]) or
                (oTextField.DataType in [atFloat, atNumber, atDate, atTime, atDateTime]) and
                HasChars(sVal, [TextDataDef.Delimiter, TextDataDef.Separator, #13, #10, #9]);
              if (TextDataDef.RecordFormat in [rfCommaDoubleQuote, rfSemicolonDoubleQuote, rfTabDoubleQuote, rfCustom]) and
                 lNeedDelim and (TextDataDef.Delimiter <> #0) then
                oText.WriteChar(TextDataDef.FDelimiter);
              if TextDataDef.RecordFormat = rfFixedLength then
                if oTextField.DataType in [atMemo, atString, atOther] then
                  sVal := FDPadR(sVal, oTextField.FieldSize)
                else
                  sVal := FDPadL(sVal, oTextField.FieldSize);
              if Length(sVal) > 0 then
                oText.WriteText(sVal);
              if (TextDataDef.RecordFormat in [rfCommaDoubleQuote, rfSemicolonDoubleQuote, rfTabDoubleQuote, rfCustom]) then begin
                if lNeedDelim and (TextDataDef.Delimiter <> #0) then
                  oText.WriteChar(TextDataDef.FDelimiter);
                if i < TextDataDef.Fields.Count - 1 then
                  if TextDataDef.Separator <> #0 then
                    oText.WriteChar(TextDataDef.FSeparator);
              end;
              if TextDataDef.RecordFormat = rfFieldPerLine then
                oText.WriteLine('');
            end;
            if TextDataDef.RecordFormat <> rfFieldPerLine then
              oText.WriteLine('');

            Inc(FInsertCount);
            Source.Next;

            if StatisticsInterval > 0 then
              if FReadCount mod StatisticsInterval = 0 then
                DoStatistic(psProgress);
          finally
            if oWait <> nil then
              oWait.StopWait;
          end;
        end;

        DoStatistic(psFinishing);
        if not IsSrcMemTable then
          Source.Close;

      except
        on E: Exception do begin
          ProcessException(E, oLog, eErrorAction);
          if eErrorAction = eaExitFailure then
            raise;
        end;
      end;

    finally
      Source.Active := lSrcActive;
      Source.EnableControls;
    end;

  finally
    Mappings.Unprepare;
    FDFree(oText);
    DeleteExceptionFile(oLog);
    if oWait <> nil then
      oWait.StopWait;
  end;

  DoStatistic(psUnpreparing);
  Result := WriteCount;
end;

{-------------------------------------------------------------------------------}
function TFDDataMove.ExecuteTextToTable: LongInt;
var
  oText: TFDTextFile;
  oLog: TFDTextFile;
  iAction: TFDDataMoveAction;
  oDestConn: TFDCustomConnection;
  oTxtFld: TFDTextField;
  i, iFldLen, iFrom, iTo: Integer;
  sVal: String;
  aBuff: array of Char;
  lEOF, lEOL, lExcLogged, lInDelim: Boolean;
  oWait: IFDGUIxWaitCursor;
  lDestDisconnected, lDestActive, lRetry: Boolean;
  eErrorAction: TFDErrorAction;

  procedure NextChar;
  begin
    Inc(iFldLen);
    if iFldLen >= Length(aBuff) then
      SetLength(aBuff, iFldLen + iFldLen div 2);
    lEOF := not oText.ReadChar(aBuff[iFldLen]);
  end;

  function StrAndBoolToInt(const AStr: String): Variant;
  begin
    if FDInSet(AStr[1], ['T', 't', 'Y', 'y']) then
      Result := 1
    else if FDInSet(AStr[1], ['F', 'f', 'N', 'n']) then
      Result := 0
    else if Length(AStr) >= 10 then
      Result := StrToInt64(AStr)
    else
      Result := StrToInt(AStr);
  end;

  function StrAndBoolToFloat(const AStr: String; const AFS: TFormatSettings): Extended;
  begin
    if FDInSet(AStr[1], ['T', 't', 'Y', 'y']) then
      Result := 1.0
    else if FDInSet(AStr[1], ['F', 'f', 'N', 'n']) then
      Result := 0.0
    else
      Result := FDStr2Float(AStr, AFS.DecimalSeparator);
  end;

  function CheckDateNotEmpty(const AStr: String): Boolean;
  var
    pCh: PChar;
    oFS: TFDTextFormatSettings;
  begin
    pCh := PChar(AStr);
    oFS := TextDataDef.FormatSettings;
    while pCh^ <> #0 do
      if not ((pCh^ = ' ') or (pCh^ = '0') or (pCh^ = oFS.DateSeparator) or (pCh^ = oFS.TimeSeparator)) then
        Break
      else
        Inc(pCh);
    Result := pCh^ <> #0;
  end;

  procedure SetStr(ATxtFld: TFDTextField; const AStr: String);
  var
    i: Integer;
    oItem: TFDMappingItem;
    S: String;
  begin
    for i := 0 to Mappings.Count - 1 do begin
      oItem := Mappings[i];
      if oItem.SourceTextField = ATxtFld then begin
        { TODO -cPUMP : Here we should remove format from values }
        S := TrimText(AStr, False);
        if (S = '') and ((oTxtFld.DataType <> atString) or TextDataDef.StrsEmpty2Null) or
           (TextDataDef.FormatSettings.NullVals.IndexOf(S) >= 0) then
          oItem.SourceValue := Null
        else
          try
            case oTxtFld.DataType of
            atOther,
            atString:
              oItem.SourceValue := S;
            atFloat:
              oItem.SourceValue := StrAndBoolToFloat(S, TextDataDef.FormatSettings.FFS);
            atNumber:
              oItem.SourceValue := StrAndBoolToInt(S);
            atBool:
              if TextDataDef.FormatSettings.BoolTrueVals.IndexOf(S) >= 0 then
                oItem.SourceValue := True
              else if TextDataDef.FormatSettings.BoolFalseVals.IndexOf(S) >= 0 then
                oItem.SourceValue := False
              else
                oItem.SourceValue := StrAndBoolToInt(S) <> 0;
            atLongInt:
              oItem.SourceValue := StrAndBoolToInt(S);
            atDate:
              if CheckDateNotEmpty(S) then
                oItem.SourceValue := StrToDate(S, TextDataDef.FormatSettings.FFS)
              else
                oItem.SourceValue := Null;
            atTime:
              if CheckDateNotEmpty(S) then
                oItem.SourceValue := StrToTime(S, TextDataDef.FormatSettings.FFS)
              else
                oItem.SourceValue := Null;
            atDateTime:
              if CheckDateNotEmpty(S) then
                oItem.SourceValue := StrToDateTime(S, TextDataDef.FormatSettings.FFS)
              else
                oItem.SourceValue := Null;
            atBlob:
              oItem.SourceValue := FDHex2Bin(S);
            atMemo:
              oItem.SourceValue := S;
            end;
          except
            on E: EConvertError do
              FDException(Self, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPBadTextFmt,
                [AStr, oItem.DisplayName, E.Message]);
          end;
        Break;
      end;
    end;
  end;

  procedure UnDoubleChar(ACh: Char; var AStr: String);
  var
    j: Integer;
  begin
    j := 1;
    repeat
      j := Pos(ACh, AStr, j);
      if j > 0 then begin
        if (j < Length(AStr)) and (AStr[j + 1] = ACh) then
          Delete(AStr, j, 1);
        Inc(j, 1);
      end;
    until j = 0;
  end;

begin
  if (TextFileName = '') and (TextStream = nil) then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPNoTxtDest, []);
  if Destination = nil then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDM], er_FD_DPNoDestDS, []);

  FReadCount := 0;
  FInsertCount := 0;
  FUpdateCount := 0;
  FDeleteCount := 0;
  FExceptionCount := 0;
  FAborting := False;
  lExcLogged := False;
  oLog := nil;
  oWait := nil;
  oText := nil;
  lEOF := False;
  SetLength(aBuff, 1024);
  lDestDisconnected := False;
  oDestConn := nil;

  DoStatistic(psPreparing);
  if not FAborting then
  try
    if not FDGUIxSilent then begin
      FDCreateInterface(IFDGUIxWaitCursor, oWait);
      oWait.StartWait;
    end;
    oLog := InitLogFile;

    try
      oDestConn := Destination.PointedConnection;
      if oDestConn <> nil then begin
        lDestDisconnected := not oDestConn.Connected;
        oDestConn.Connected := True;
      end;
      if CommitCount > 0 then
        if (oDestConn <> nil) and not oDestConn.InTransaction then
          oDestConn.StartTransaction;
      lDestActive := Destination.Active;
      try

        if TextStream <> nil then
          oText := TFDTextFile.Create(TextStream, False, True, False,
            TextFileEncoding, TextDataDef.EndOfLine)
        else
          oText := TFDTextFile.Create(TextFileName, True, False,
            TextFileEncoding, TextDataDef.EndOfLine);
        if TextAnalyze <> [] then begin
          GuessTextFormat(oText, TextAnalyze);
          oText.Stream.Position := 0;
        end;
        CreateDestinationDataSet;
        lDestActive := Destination.Active;
        SetupDestination;
        Mappings.Prepare;
        CheckTextSetup;

        if [poClearDest, poClearDestNoUndo] * Options <> [] then
          iAction := paAlwaysInsert
        else if Mode = dmAlwaysInsert then
          iAction := paAlwaysInsert
        else if Mode = dmDelete then
          iAction := paDelete
        else
          iAction := paSkip;

        if [poClearDest, poClearDestNoUndo] * Options <> [] then
          Destination.ServerDeleteAll(poClearDestNoUndo in Options);

        DoStatistic(psStarting);

        if TextDataDef.WithFieldNames then begin
          repeat
            lEOF := not oText.ReadChar(aBuff[0]);
          until lEOF or (aBuff[0] = #13) or (aBuff[0] = #10);
          repeat
            lEOF := not oText.ReadChar(aBuff[0]);
          until lEOF or not ((aBuff[0] = #13) or (aBuff[0] = #10));
          if not lEOF then
            oText.Stream.Position := oText.Stream.Position - 1;
        end;

        while not lEOF and not FAborting do begin
          if oWait <> nil then
            oWait.StartWait;
          try
            lEOL := False;
            for i := 0 to TextDataDef.Fields.Count - 1 do begin
              oTxtFld := TextDataDef.Fields[i];
              iFldLen := -1;

              if not lEOF and not lEOL then
                case TextDataDef.RecordFormat of
                rfFixedLength:
                  begin
                    iFldLen := oTxtFld.FieldSize;
                    if Length(aBuff) < iFldLen then
                      SetLength(aBuff, iFldLen);
                    lEOF := oText.ReadChars(aBuff[0], iFldLen) = 0;
                    if not lEOF then
                      Dec(iFldLen);
                  end;
                rfFieldPerLine:
                  begin
                    repeat
                      NextChar;
                    until lEOF or ((aBuff[iFldLen] = #13) or (aBuff[iFldLen] = #10));
                    if not lEOF then begin
                      if (TextDataDef.EndOfLine in [elWindows {$IFDEF MSWINDOWS}, elDefault {$ENDIF}]) and
                         (aBuff[iFldLen] = #13) then
                        lEOF := not oText.ReadChar(aBuff[iFldLen]);
                      Dec(iFldLen);
                    end;
                  end;
                else
                  iFldLen := -1;
                  lInDelim := False;
                  repeat
                    NextChar;
                    if not lEOF and (aBuff[iFldLen] = TextDataDef.Delimiter) then
                      if iFldLen = 0 then
                        lInDelim := not lInDelim
                      else begin
                        NextChar;
                        if not lEOF and (aBuff[iFldLen] <> TextDataDef.Delimiter) then
                          lInDelim := not lInDelim;
                      end;
                    lEOL := not lEOF and not lInDelim and ((aBuff[iFldLen] = #13) or (aBuff[iFldLen] = #10));
                  until lEOF or lEOL or not lInDelim and (aBuff[iFldLen] = TextDataDef.Separator);
                  if not lEOF then
                    Dec(iFldLen);
                end;

              if iFldLen >= 0 then begin
                iFrom := 0;
                iTo := iFldLen;
                if (iFrom >= 0) and (iFrom < Length(aBuff)) and (aBuff[iFrom] = TextDataDef.Delimiter) then
                  Inc(iFrom);
                if (iTo >= 0) and (iTo < Length(aBuff)) and (
                     (aBuff[iTo] = TextDataDef.Separator) or (aBuff[iTo] = TextDataDef.Delimiter)) then
                  Dec(iTo);
                SetString(sVal, PChar(aBuff) + iFrom, iTo - iFrom + 1);
                if TextDataDef.Delimiter <> #0 then
                  UnDoubleChar(TextDataDef.Delimiter, sVal);
                SetStr(oTxtFld, sVal);
              end
              else
                SetStr(oTxtFld, '');
            end;

            if TextDataDef.RecordFormat <> rfFieldPerLine then begin
              repeat
                lEOF := not oText.ReadChar(aBuff[0]);
              until lEOF or not ((aBuff[0] = #13) or (aBuff[0] = #10));
              if not lEOF then
                oText.Stream.Position := oText.Stream.Position - 1;
            end;

            Inc(FReadCount);

            if not (iAction in [paDelete, paAlwaysInsert]) then begin
              iAction := paSkip;
              if FindDestRecord then begin
                if (Mode = dmUpdate) or (Mode = dmAppendUpdate) then
                  iAction := paUpdate;
              end
              else begin
                if (Mode = dmAppend) or (Mode = dmAppendUpdate) then
                  iAction := paInsert;
              end;
            end;

            if CommitCount > 0 then
              if (oDestConn <> nil) and not oDestConn.InTransaction then
                oDestConn.StartTransaction;

            repeat
              lRetry := False;
              try
                case iAction of
                paInsert, paAlwaysInsert:
                  begin
                    Destination.ServerAppend;
                    Mappings.Move(False);
                    Destination.ServerPerform;
                    Inc(FInsertCount);
                  end;
                paUpdate:
                  begin
                    Destination.ServerEdit;
                    Mappings.Move(False);
                    Destination.ServerPerform;
                    Inc(FUpdateCount);
                  end;
                paDelete:
                  begin
                    Destination.ServerDelete;
                    Mappings.Move(True);
                    Destination.ServerPerform;
                    Inc(FDeleteCount);
                  end;
                end;
              except
                on E: Exception do begin
                  if CommitCount > 0 then
                    if (oDestConn <> nil) and oDestConn.InTransaction then
                      oDestConn.Rollback;
                  lExcLogged := True;
                  ProcessException(E, oLog, eErrorAction);
                  case eErrorAction of
                  eaFail:        lRetry := False;
                  eaSkip:        lRetry := False;
                  eaRetry:       lRetry := True;
                  eaApplied:     lRetry := False;
                  eaExitSuccess: FAborting := True;
                  eaExitFailure: raise;
                  end;
                  lExcLogged := False;
                end;
              end;
            until not lRetry;

            if (CommitCount > 0) and (WriteCount mod CommitCount = 0) then
              if (oDestConn <> nil) and oDestConn.InTransaction then
                oDestConn.Commit;

            if StatisticsInterval > 0 then
              if FReadCount mod StatisticsInterval = 0 then
                DoStatistic(psProgress);

          finally
            if oWait <> nil then
              oWait.StopWait;
          end;
        end;

        DoStatistic(psFinishing);
        if not IsDestMemTable then
          Destination.Disconnect;

      finally
        Destination.Active := lDestActive;
        Destination.EnableControls;
      end;

      if CommitCount > 0 then
        if (oDestConn <> nil) and oDestConn.InTransaction then
          oDestConn.Commit;

    except
      on E: Exception do begin
        if (oDestConn <> nil) and oDestConn.InTransaction then
          oDestConn.Rollback;
        if not lExcLogged then
          ProcessException(E, oLog, eErrorAction);
        if eErrorAction = eaExitFailure then
          raise;
      end;
    end;

  finally
    if (oDestConn <> nil) and lDestDisconnected then
      oDestConn.Connected := False;
    Mappings.Unprepare;
    FDFree(oText);
    DeleteExceptionFile(oLog);
    if oWait <> nil then
      oWait.StopWait;
  end;
  DoStatistic(psUnpreparing);
  Result := WriteCount;
end;

end.
