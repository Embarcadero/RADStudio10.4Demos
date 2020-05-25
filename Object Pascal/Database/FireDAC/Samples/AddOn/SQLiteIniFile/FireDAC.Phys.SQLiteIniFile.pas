
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
{-------------------------------------------------------------------------------
  List of all entries:
  --------------------
  select B.SECTION_NAME, A.KEY_NAME, A.KEY_VALUE
  from KEYS A
  left join SECTIONS B on B.SECTION_ID = A.SECTION_ID
  order by B.SECTION_NAME, A.KEY_NAME
-------------------------------------------------------------------------------}
unit FireDAC.Phys.SQLiteIniFile;

interface

uses
  Classes, SysUtils, IniFiles,
  FireDAC.ConsoleUI.Wait, FireDAC.Phys.SQLite, FireDAC.Comp.Client, FireDAC.Phys.SQLiteWrapper,
  FireDAC.Stan.Async, FireDAC.Stan.Def;     // For Register Object factory

type
  TStreamCompressionLevel = (sclNone, sclFastest, sclDefault, sclMax);

  TFDSQLiteIniFileDB = class(TObject)
  private
    FConnection: TFDConnection;
    function GetSQLiteDatabase: TSQLiteDatabase;
  protected
    function StartTransaction: Boolean;
    procedure Commit;
    procedure RollBack;
    function CreateStatement(const ASQL: String): TSQLiteStatement;
    procedure ExecSQL(const ASQL: String);
    function GetKeyID(const ASectionID: Int64; const AKey: String): Int64;
    function GetSectionID(const ASection: String): Int64;
    function KeyExists(const ASection, AKey: String): Boolean;
    function SectionExists(const ASection: String): Boolean;
    procedure DeleteKey(const ASection, AKey: String);
    procedure EraseSection(const ASection: String);
    function InsertSection(const ASection: String): Int64;
    function ReadString(const ASection, AKey: String; const ADefault: String = ''): String;
    procedure WriteString(const ASection, AKey: String; const AValue: String);
    function ReadStrings(const ASection, AKey: String; AStrings: TStrings;
      const AAppend: Boolean = False): Integer;
    procedure WriteStrings(const ASection, AKey: String; AStrings: TStrings);
    procedure ReadSection(const ASection: String; AStrings: TStrings;
      const AAppend: Boolean = False);
    procedure ReadSections(const AStrings: TStrings; const ASection: string = '';
      const AAppend: Boolean = False);
    procedure ReadSectionValues(const ASection: String; AStrings: TStrings;
      const AAppend: Boolean = False);
    procedure WriteStream(const ASection, AKey: String; AStream: TStream;
      const ACompress: TStreamCompressionLevel);
    procedure ReadStream(const ASection, AKey: String; AStream: TStream);
    property SQLiteDatabase: TSQLiteDatabase read GetSQLiteDatabase;
  public
    constructor Create(const AFileName: String; APassword: String = '');
    destructor Destroy; override;
    procedure Clear;
  end;

  { TFDSQLiteIniFile:
    Methods not implemented here are, of course, inherited from TCustomIniFile.
  }
  TFDSQLiteIniFile = class(TCustomIniFile)
  private
    FDatabase: TFDSQLiteIniFileDB;
    FFormatSettings: TFormatSettings;
    FStreamCompressionLevel: TStreamCompressionLevel;
  public
    constructor Create(const AFileName: String = '';
      const APassword: String = ''); overload;
    constructor Create(const AFileName: String; const APassword: String;
      const AStreamCompressionLevel: TStreamCompressionLevel); overload;
    destructor Destroy; override;
    procedure UpdateFile; override;             // Do nothing
    procedure DeleteKey(const ASection, AKey: String); override;
    procedure EraseSection(const ASection: String); override;
    function SectionExists(const ASection: String): Boolean;
    function ValueExists(const ASection, AKey: String): Boolean; override;
    function ReadString(const ASection, AKey, ADefault: String): String; override;
    procedure WriteString(const ASection, AKey, AValue: String); override;
    procedure ReadSection(const ASection: string; AStrings: TStrings); override;
    procedure ReadSections(AStrings: TStrings); overload; override;
    procedure ReadSections(const ASection: String; AStrings: TStrings); overload; override;
    procedure ReadSectionValues(const ASection: string; AStrings: TStrings); override;
    { Override because of FormatSettings }
    function ReadDate(const ASection, AKey: string; ADefault: TDateTime): TDateTime; override;
    function ReadDateTime(const ASection, AKey: string; ADefault: TDateTime): TDateTime; override;
    function ReadFloat(const ASection, AKey: string; ADefault: Double): Double; override;
    function ReadTime(const ASection, AKey: string; ADefault: TDateTime): TDateTime; override;
    procedure WriteDate(const ASection, AKey: string; AValue: TDateTime); override;
    procedure WriteDateTime(const ASection, AKey: string; AValue: TDateTime); override;
    procedure WriteFloat(const ASection, AKey: string; AValue: Double); override;
    procedure WriteTime(const ASection, AKey: string; AValue: TDateTime); override;
    { Additional functions ...}
    function ReadStrings(const ASection, AKey: string; AStrings: TStrings;
      const AAppend: Boolean = False): Integer;
    procedure WriteStrings(const ASection, AKey: string; const AValue: TStrings);
    procedure ReadStream(const ASection, AKey: String; AStream: TStream);
    procedure WriteStream(const ASection, AKey: String; AStream: TStream);
    procedure SaveToFile(const ASection, AKey, AFileName: String);
    procedure LoadFromFile(const ASection, AKey, AFileName: String);
    procedure Export(const AIniFile: TCustomIniFile; ASection: String = '';
      AExcludeSectionPrefix: Boolean = True); overload;
    procedure Export(const AIniFileName: String; ASection: String = '';
      AExcludeSectionPrefix: Boolean = True); overload;
    procedure Import(const AIniFile: TCustomIniFile; ASectionPrefix: String = ''); overload;
    procedure Import(const AIniFileName: String; ASectionPrefix: String = ''); overload;
    { ... and properties }
    property Database: TFDSQLiteIniFileDB read FDatabase;
    property FormatSettings: TFormatSettings read FFormatSettings write FFormatSettings;
    property StreamCompressionLevel: TStreamCompressionLevel
      read FStreamCompressionLevel write FStreamCompressionLevel;
  end;

var
  DefaultStreamCompressionLevel: TStreamCompressionLevel = sclMax;

implementation

uses
  Windows, ZLib, FireDAC.Stan.Option;

const
  SQL_CreateTables =
    'create table if not exists SECTIONS(' +  sLineBreak +
    '  SECTION_ID integer primary key,' + sLineBreak +
    '  SECTION_NAME text collate systemnocase);' + sLineBreak +
    'create unique index if not exists IDX_SECTIONS_NK on SECTIONS (SECTION_NAME);' + sLineBreak +
    'create table if not exists KEYS(' + sLineBreak +
    '  KEY_ID integer primary key,' + sLineBreak +
    '  SECTION_ID integer,' + sLineBreak +
    '  KEY_NAME text collate systemnocase,' + sLineBreak +
    '  KEY_VALUE blob);' + sLineBreak +
    'create unique index if not exists IDX_KEYS_NK on KEYS (SECTION_ID, KEY_NAME);' + sLineBreak +
    'create trigger if not exists SECTIONS_AD after delete on SECTIONS' + sLineBreak +
    'begin' +  sLineBreak +
    '  delete from KEYS where SECTION_ID = old.SECTION_ID;' +  sLineBreak +
    'end;' + sLineBreak +
    'create trigger if not exists SECTIONS_AU after update on SECTIONS' +  sLineBreak +
    'begin' +  sLineBreak +
    '  update KEYS set SECTION_ID = new.SECTION_ID where SECTION_ID = old.SECTION_ID;' +  sLineBreak +
    'end;' + sLineBreak +
    'create trigger if not exists KEYS_AD after delete on KEYS' +  sLineBreak +
    'when not exists (select 0 from KEYS where SECTION_ID = old.SECTION_ID)' +  sLineBreak +
    'begin' +  sLineBreak +
    '  delete from SECTIONS where SECTION_ID = old.SECTION_ID;' +  sLineBreak +
    'end;';
  SQL_DeleteKey = 'delete from KEYS where SECTION_ID = (select SECTION_ID from SECTIONS where SECTION_NAME = ?) and KEY_NAME = ?';
  SQL_DeleteSection = 'delete from SECTIONS where SECTION_NAME = ?';
  SQL_InsertKey = 'insert into KEYS (SECTION_ID, KEY_NAME, KEY_VALUE) values(?, ?, ?)';
  SQL_InsertSection = 'insert into SECTIONS(SECTION_NAME) values(?)';
  SQL_SelectKeyID = 'select KEY_ID from KEYS where SECTION_ID = ? and KEY_NAME = ?';
  SQL_SelectKeyValue = 'select KEY_VALUE from KEYS where SECTION_ID = (select SECTION_ID from SECTIONS where SECTION_NAME = ?) and KEY_NAME = ?';
  SQL_SelectKeyValues = 'select KEY_NAME, KEY_VALUE from KEYS where SECTION_ID = (select SECTION_ID from SECTIONS where SECTION_NAME = ?) and KEY_NAME like ?';
  SQL_SelectSectionID = 'select SECTION_ID from SECTIONS where SECTION_NAME = ?';
  SQL_SelectSection = 'select KEY_NAME from KEYS where SECTION_ID = (select SECTION_ID from SECTIONS where SECTION_NAME = ?)';
  SQL_SelectSections = 'select SECTION_NAME from SECTIONS where SECTION_NAME like ?';
  SQL_UpdateKey = 'update KEYS set KEY_VALUE = ? where KEY_ID = ?';

{ Collation - string compare must be case insensitive, see initialization too }

type
  TSQLiteCollation_systemnocase = class(TSQLiteCollationCompareString)
  public
    constructor Create(ALib: TSQLiteLib); override;
  end;

constructor TSQLiteCollation_systemnocase.Create(ALib: TSQLiteLib);
begin
  inherited Create(ALib);
  Name := 'systemnocase';
  Flags := NORM_IGNORECASE;
end;

{ ZLib.DeCompressBuf don't raise Exception on error (for example when buffer   }
{ is not compressed), so decopression is made with TDecompressionStream.       }

procedure Decompress(const ABuffer: Pointer; ASize: Integer; AStream: TStream);
var
  oStream: TMemoryStream;
  B: array [0..8191] of Byte;
  L: Integer;
begin
  oStream := TMemoryStream.Create;
  try
    oStream.Write(ABuffer^, ASize);
    oStream.Position := 0;
    with TDecompressionStream.Create(oStream) do
      try
        try
          AStream.Size := 0;
          L := SizeOf(B);
          while L > 0 do
          begin
            L := Read(B, L);
            if L > 0 then AStream.WriteBuffer(B, L);
          end;
        except
          AStream.Size := 0;
          AStream.Write(ABuffer^, ASize);
        end;
      finally
        Free;
      end;
  finally
    oStream.Free;
  end;
  AStream.Position := 0;
end;

{ TFDSQLiteIniFileDB }

procedure TFDSQLiteIniFileDB.Clear;
var
  lStartTransaction: Boolean;
begin
  lStartTransaction := StartTransaction;
  try
    ExecSQL('delete from KEYS;' +
            'delete from SECTIONS;');
    if lStartTransaction then Commit;
  except
    if lStartTransaction then RollBack;
  end;
end;

procedure TFDSQLiteIniFileDB.Commit;
begin
  if SQLiteDatabase.InTransaction then ExecSQL('commit');
end;

constructor TFDSQLiteIniFileDB.Create(const AFileName: String; APassword: String);
var
  lStartTransaction: Boolean;
begin
  FConnection := TFDConnection.Create(Nil);
  with FConnection do
  begin
    FetchOptions.Mode := fmAll;
    LoginPrompt := False;
    Params.Clear;
    Params.Add('DriverID=SQLite');
    Params.Add('Database=' + AFileName);
    Params.Add('LockingMode=Normal');
    Params.Add('Password=' + APassword);
    Params.Add('SQLiteAdvanced=temp_store=memory');   // ;page_size=4096
    Connected := True;
  end;

  lStartTransaction := StartTransaction;
  try
    ExecSQL(SQL_CreateTables);
    if lStartTransaction then Commit;
  except
    if lStartTransaction then RollBack;
  end;
end;

function TFDSQLiteIniFileDB.CreateStatement(const ASQL: String): TSQLiteStatement;
var
  I: Integer;
begin
  Result := TSQLiteStatement.Create(SQLiteDatabase);
  with Result do
  begin
    Prepare(ASQL);
    for I := 0 to ParamDefsCount - 1 do TSQLiteBind.Create(Params);
    if SameText(Copy(ASQL, 1, 6), 'select') then
      for I := 0 to ColumnDefsCount - 1 do TSQLiteColumn.Create(Columns);
  end;
end;

procedure TFDSQLiteIniFileDB.DeleteKey(const ASection, AKey: String);
begin
  with CreateStatement(SQL_DeleteKey) do
    try
      Params[0].AsString := ASection;
      Params[1].AsString := AKey;
      Execute;
    finally
      Free;
    end;
end;

destructor TFDSQLiteIniFileDB.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

procedure TFDSQLiteIniFileDB.EraseSection(const ASection: String);
begin
  with CreateStatement(SQL_DeleteSection) do
    try
      Params[0].AsString := ASection;
      Execute;
    finally
      Free;
    end;
end;

procedure TFDSQLiteIniFileDB.ExecSQL(const ASQL: String);
begin
  with TSQLiteStatement.Create(SQLiteDatabase) do
    try
      Prepare(ASQL);
      Execute;
      while PrepareNextCommand do Execute;
    finally
      Free;
    end;
end;

function TFDSQLiteIniFileDB.GetKeyID(const ASectionID: Int64;
  const AKey: String): Int64;
begin
  Result := -1;
  with CreateStatement(SQL_SelectKeyID) do
    try
      Params[0].AsInteger := ASectionID;
      Params[1].AsString  := AKey;
      Execute;
      if Fetch then Result := Columns[0].AsInteger;
    finally
      Free;
    end;
end;

function TFDSQLiteIniFileDB.GetSectionID(const ASection: String): Int64;
begin
  Result := -1;
  with CreateStatement(SQL_SelectSectionID) do
    try
      Params[0].AsString := ASection;
      Execute;
      if Fetch then Result := Columns[0].AsInteger;
    finally
      Free;
    end;
end;

function TFDSQLiteIniFileDB.GetSQLiteDatabase: TSQLiteDatabase;
begin
  Result := TSQLiteDatabase(FConnection.ConnectionIntf.CliObj);
end;

function TFDSQLiteIniFileDB.InsertSection(const ASection: String): Int64;
begin
  with CreateStatement(SQL_InsertSection) do
    try
      Params[0].AsString := ASection;
      Execute;
      Result := SQLiteDatabase.LastInsertRowid
    finally
      Free;
    end;
end;

function TFDSQLiteIniFileDB.KeyExists(const ASection, AKey: String): Boolean;
begin
  Result := not (GetKeyID(GetSectionID(ASection), AKey) < 0);
end;

procedure TFDSQLiteIniFileDB.ReadSection(const ASection: String;
  AStrings: TStrings; const AAppend: Boolean);
begin
  if not AAppend then AStrings.Clear;
  AStrings.BeginUpdate;
  try
    with CreateStatement(SQL_SelectSection) do
      try
        Params[0].AsString := ASection;
        Execute;
        while Fetch do AStrings.Add(Columns[0].AsString);
      finally
        Free;
      end;
  finally
    AStrings.EndUpdate;
  end;
end;

procedure TFDSQLiteIniFileDB.ReadSections(const AStrings: TStrings;
  const ASection: string; const AAppend: Boolean);
begin
  if not AAppend then AStrings.Clear;
  AStrings.BeginUpdate;
  try
    with CreateStatement(SQL_SelectSections) do
      try
        Params[0].AsString := ASection + '%';
        Execute;
        while Fetch do AStrings.Add(Columns[0].AsString);
      finally
        Free;
      end;
  finally
    AStrings.EndUpdate;
  end;
end;

procedure TFDSQLiteIniFileDB.ReadSectionValues(const ASection: String;
  AStrings: TStrings; const AAppend: Boolean);
begin
  if not AAppend then AStrings.Clear;
  AStrings.BeginUpdate;
  try
    with CreateStatement(SQL_SelectKeyValues) do
      try
        Params[0].AsString := ASection;
        Params[1].AsString := '%';
        Execute;
        while Fetch do
        begin
          AStrings.Add(Columns[0].AsString + '=' + Columns[1].AsString);
        end;
      finally
        Free;
      end;
  finally
    AStrings.EndUpdate;
  end;
end;

procedure TFDSQLiteIniFileDB.ReadStream(const ASection, AKey: String;
  AStream: TStream);
var
  B: Pointer;
  L: Integer;
begin
  AStream.Size := 0;
  with CreateStatement(SQL_SelectKeyValue) do
    try
      Params[0].AsString := ASection;
      Params[1].AsString := AKey;
      Execute;
      if Fetch then
      begin
        Columns[0].GetData(B, L, True, etBlob);
        Decompress(B, L, AStream);
      end;
    finally
      Free;
    end;
end;

function TFDSQLiteIniFileDB.ReadString(const ASection, AKey: String;
  const ADefault: String): String;
begin
  Result := ADefault;
  with CreateStatement(SQL_SelectKeyValue) do
    try
      Params[0].AsString := ASection;
      Params[1].AsString := AKey;
      Execute;
      if Fetch then Result := Columns[0].AsString;
    finally
      Free;
    end;
end;

function TFDSQLiteIniFileDB.ReadStrings(const ASection, AKey: String;
  AStrings: TStrings; const AAppend: Boolean): Integer;
begin
  Result := 0;
  AStrings.BeginUpdate;
  try
    if not AAppend then AStrings.Clear;
    with CreateStatement(SQL_SelectKeyValues) do
      try
        Params[0].AsString := ASection;
        Params[1].AsString := AKey + '%';
        Execute;
        while Fetch do
        begin
          AStrings.Add(Columns[1].AsString);
          Inc(Result);
        end;
      finally
        Free;
      end;
  finally
    AStrings.EndUpdate;
  end;
end;

procedure TFDSQLiteIniFileDB.RollBack;
begin
  if SQLiteDatabase.InTransaction then ExecSQL('rollback');
end;

function TFDSQLiteIniFileDB.SectionExists(const ASection: String): Boolean;
begin
  Result := not (GetSectionID(ASection) < 0);
end;

function TFDSQLiteIniFileDB.StartTransaction: Boolean;
begin
  Result := not SQLiteDatabase.InTransaction;
  if Result then ExecSQL('begin transaction');
end;

procedure TFDSQLiteIniFileDB.WriteStream(const ASection, AKey: String;
  AStream: TStream; const ACompress: TStreamCompressionLevel);
var
  oStream: TMemoryStream;
  iKeyID: Int64;
  iSectionID: Int64;
begin
  oStream := TMemoryStream.Create;
  try
    if ACompress = sclNone then
      oStream.LoadFromStream(AStream)
    else
      with TCompressionStream.Create(TCompressionLevel(ACompress), oStream) do
        try
          CopyFrom(AStream, 0);
        finally
          Free;
        end;

    iSectionID := GetSectionID(ASection);
    if iSectionID < 0 then iSectionID := InsertSection(ASection);
    if not (iSectionID < 0) then
    begin
      iKeyID := GetKeyID(iSectionID, AKey);
      if iKeyID >= 0 then
        with CreateStatement(SQL_UpdateKey) do
          try
            Params[0].SetData(oStream.Memory, oStream.Size, etBlob);
            Params[1].AsInteger := iKeyID;
            Execute;
          finally
            Free;
          end
      else
        with CreateStatement(SQL_InsertKey) do
          try
            Params[0].AsInteger := iSectionID;
            Params[1].AsString  := AKey;
            Params[2].SetData(oStream.Memory, oStream.Size, etBlob);
            Execute;
          finally
            Free;
          end;
    end;
  finally
    oStream.Free;
  end;
end;

procedure TFDSQLiteIniFileDB.WriteString(const ASection, AKey,
  AValue: String);
var
  iKeyID: Int64;
  iSectionID: Int64;
begin
  iSectionID := GetSectionID(ASection);
  if iSectionID < 0 then iSectionID := InsertSection(ASection);
  if not (iSectionID < 0) then
  begin
    iKeyID := GetKeyID(iSectionID, AKey);
    if iKeyID >= 0 then
      with CreateStatement(SQL_UpdateKey) do
        try
          Params[0].AsString  := AValue;
          Params[1].AsInteger := iKeyID;
          Execute;
        finally
          Free;
        end
    else
      with CreateStatement(SQL_InsertKey) do
        try
          Params[0].AsInteger := iSectionID;
          Params[1].AsString  := AKey;
          Params[2].AsString  := AValue;
          Execute;
        finally
          Free;
        end;
  end;
end;

procedure TFDSQLiteIniFileDB.WriteStrings(const ASection, AKey: String;
  AStrings: TStrings);
var
  lStartTransaction: Boolean;
  I: Integer;
begin
  lStartTransaction := StartTransaction;
  try
    DeleteKey(ASection, AKey + '%');
    for I := 0 to AStrings.Count - 1 do
      WriteString(ASection, AKey + IntToStr(I), AStrings[I]);
    if lStartTransaction then Commit;
  except
    if lStartTransaction then RollBack;
  end;
end;

{ TFDSQLiteIniFile }

constructor TFDSQLiteIniFile.Create(const AFileName: String; const APassword: String);
var
  sFileName: String;
begin
  sFileName := Trim(AFileName);
  if sFileName = '' then
    sFileName := ChangeFileExt(ParamStr(0), '') + '_IniFile';
  if not SameText(sFileName, ':memory:') and (ExtractFileExt(sFileName) = '') then
    ChangeFileExt(sFileName, '.db');

  FDatabase := TFDSQLiteIniFileDb.Create(sFileName, APassword);
  inherited Create(sFileName);

  with FFormatSettings do
  begin
    CurrencyFormat    := 3;
    NegCurrFormat     := 8;
    ThousandSeparator := ',';
    DecimalSeparator  := '.';
    CurrencyDecimals  := 2;
    DateSeparator     := '-';
    TimeSeparator     := ':';
    ListSeparator     := ';';
    CurrencyString    := '';
    ShortDateFormat   := 'yyyy-MM-dd';
    LongDateFormat    := 'yyyy-MM-dd';
    TimeAMString      := '';
    TimePMString      := '';
    ShortTimeFormat   := 'hh:mm';
    LongTimeFormat    := 'hh:mm:ss';
    TwoDigitYearCenturyWindow := 50;
  end;

  FStreamCompressionLevel := DefaultStreamCompressionLevel;
end;

constructor TFDSQLiteIniFile.Create(const AFileName: String; const APassword: String;
  const AStreamCompressionLevel: TStreamCompressionLevel);
begin
  Create(AFileName, APassword);
  FStreamCompressionLevel := AStreamCompressionLevel;
end;

procedure TFDSQLiteIniFile.DeleteKey(const ASection, AKey: String);
begin
  FDatabase.DeleteKey(ASection, AKey);
end;

destructor TFDSQLiteIniFile.Destroy;
begin
  FreeAndNil(FDatabase);
  inherited;
end;

procedure TFDSQLiteIniFile.EraseSection(const ASection: String);
begin
  FDatabase.EraseSection(ASection);
end;

procedure TFDSQLiteIniFile.Export(const AIniFileName: String;
  ASection: String; AExcludeSectionPrefix: Boolean);
var
  oIniFile: TMemIniFile;
begin
  oIniFile := TMemIniFile.Create(AIniFileName);
  try
    Export(oIniFile, ASection, AExcludeSectionPrefix);
    oIniFile.UpdateFile;
  finally
    FreeAndNil(oIniFile);
  end;
end;

procedure TFDSQLiteIniFile.Export(const AIniFile: TCustomIniFile;
  ASection: String; AExcludeSectionPrefix: Boolean);
var
  oKeys: TStringList;
  sSections: TStringList;
  iSection: Integer;
  sSection: String;
  sSectionOut: String;
  iKey: Integer;
  sKey: String;
  sValue: String;
begin
  sSections := TStringList.Create;
  oKeys := TStringList.Create;
  try
    ReadSections(ASection, sSections);
    for iSection := 0 to sSections.Count - 1 do
    begin
      sSection := sSections[iSection];
      sSectionOut := sSection;
      if AExcludeSectionPrefix then
        sSectionOut := ExtractFileName(sSectionOut);
      ReadSection(sSection, oKeys);
      for iKey := 0 to oKeys.Count - 1 do
      begin
        sKey := oKeys[iKey];
        sValue := ReadString(sSection, sKey, '');
        AIniFile.WriteString(sSectionOut, sKey, sValue);
      end;
    end;
  finally
    FreeAndNil(oKeys);
    FreeAndNil(sSections);
  end;
//  if AIniFile.FileName <> '' then TIniFile(AIniFile).UpdateFile;
end;

procedure TFDSQLiteIniFile.Import(const AIniFileName: String;
  ASectionPrefix: String);
var
  oIniFile: TIniFile;
begin
  oIniFile := TIniFile.Create(AIniFileName);
  try
    Import(oIniFile, ASectionPrefix);
  finally
    FreeAndNil(oIniFile);
  end;
end;

procedure TFDSQLiteIniFile.LoadFromFile(const ASection, AKey,
  AFileName: String);
var
  oStream: TMemoryStream;
begin
  oStream := TMemoryStream.Create;
  try
    oStream.LoadFromFile(AFileName);
    WriteStream(ASection, AKey, oStream);
  finally
    oStream.Free;
  end;
end;

procedure TFDSQLiteIniFile.Import(const AIniFile: TCustomIniFile;
  ASectionPrefix: String);
var
  lStartTransaction: Boolean;
  oSections: TStringList;
  oKeys: TStringList;
  sSection: String;
  sKey: String;
  sValue: String;
  sSectionPrefix: String;
  iSection: Integer;
  iKey: Integer;
begin
  sSectionPrefix := Trim(ASectionPrefix);
  if sSectionPrefix <> '' then
    sSectionPrefix := IncludeTrailingPathDelimiter(sSectionPrefix);

  lStartTransaction := FDatabase.StartTransaction;
  try
    oSections := TStringList.Create;
    oKeys := TStringList.Create;
    try
      AIniFile.ReadSections(oSections);
      for iSection := 0 to oSections.Count - 1 do
      begin
        sSection := oSections[iSection];
        AIniFile.ReadSection(sSection, oKeys);
        for iKey := 0 to oKeys.Count - 1 do
        begin
          sKey := oKeys[iKey];
          sValue := AIniFile.ReadString(sSection, sKey, '');
          FDatabase.WriteString(sSectionPrefix + sSection, sKey, sValue);
        end;
      end;
    finally
      oKeys.Free;
      oSections.Free;
    end;
    if lStartTransaction then FDatabase.Commit;
  finally
    if lStartTransaction then FDatabase.RollBack;
  end;
end;

function TFDSQLiteIniFile.ReadDate(const ASection, AKey: string;
  ADefault: TDateTime): TDateTime;
var
  S: String;
begin
  Result := ADefault;
  S := ReadString(ASection, AKey, '');
  if S <> '' then
    try
      Result := StrToDate(S, FFormatSettings);
    except
      on EConvertError do
      // Ignore EConvertError exceptions, Result = ADefault
      else raise;
    end;
end;

function TFDSQLiteIniFile.ReadDateTime(const ASection, AKey: string;
  ADefault: TDateTime): TDateTime;
var
  S: String;
begin
  Result := ADefault;
  S := ReadString(ASection, AKey, '');
  if S <> '' then
    try
      Result := StrToDateTime(S, FFormatSettings);
    except
      on EConvertError do
      // Ignore EConvertError exceptions, Result = ADefault
      else raise;
    end;
end;

function TFDSQLiteIniFile.ReadFloat(const ASection, AKey: string;
  ADefault: Double): Double;
var
  S: string;
begin
  Result := ADefault;
  S := ReadString(ASection, AKey, '');
  if S <> '' then
    try
      Result := StrToFloat(S, FFormatSettings);
    except
      on EConvertError do
      // Ignore EConvertError exceptions, Result = ADefault
      else raise;
    end;
end;

procedure TFDSQLiteIniFile.ReadSection(const ASection: string;
  AStrings: TStrings);
begin
  FDatabase.ReadSection(ASection, AStrings);
end;

procedure TFDSQLiteIniFile.ReadSections(AStrings: TStrings);
begin
  FDatabase.ReadSections(AStrings, '%');
end;

procedure TFDSQLiteIniFile.ReadSections(const ASection: String;
  AStrings: TStrings);
begin
  FDatabase.ReadSections(AStrings, ASection + '%');
end;

procedure TFDSQLiteIniFile.ReadSectionValues(const ASection: string;
  AStrings: TStrings);
begin
  FDatabase.ReadSectionValues(ASection, AStrings);
end;

procedure TFDSQLiteIniFile.ReadStream(const ASection, AKey: String;
  AStream: TStream);
begin
  FDatabase.ReadStream(ASection, AKey, AStream);
end;

function TFDSQLiteIniFile.ReadString(const ASection, AKey,
  ADefault: String): String;
begin
  Result := FDatabase.ReadString(ASection, AKey, ADefault);
end;

function TFDSQLiteIniFile.ReadStrings(const ASection, AKey: string;
  AStrings: TStrings; const AAppend: Boolean): Integer;
begin
  Result := FDatabase.ReadStrings(ASection, AKey, AStrings, AAppend);
end;

function TFDSQLiteIniFile.ReadTime(const ASection, AKey: string;
  ADefault: TDateTime): TDateTime;
var
  S: String;
begin
  Result := ADefault;
  S := ReadString(ASection, AKey, '');
  if S <> '' then
    try
      Result := StrToTime(S, FFormatSettings);
    except
      on EConvertError do
      // Ignore EConvertError exceptions, Result = ADefault
      else raise;
    end;
end;

procedure TFDSQLiteIniFile.SaveToFile(const ASection, AKey, AFileName: String);
var
  oStream: TMemoryStream;
begin
  oStream  := TMemoryStream.Create;
  try
    ReadStream(ASection, AKey, oStream);
    oStream.SaveToFile(AFileName);
  finally
    oStream.Free;
  end;
end;

function TFDSQLiteIniFile.SectionExists(const ASection: String): Boolean;
begin
  Result := FDatabase.SectionExists(ASection);
end;

procedure TFDSQLiteIniFile.UpdateFile;
begin
  // Do nothing
end;

function TFDSQLiteIniFile.ValueExists(const ASection, AKey: String): Boolean;
begin
  Result := FDatabase.KeyExists(ASection, AKey);
end;

procedure TFDSQLiteIniFile.WriteDate(const ASection, AKey: string;
  AValue: TDateTime);
begin
  WriteString(ASection, AKey, DateToStr(AValue, FFormatSettings));
end;

procedure TFDSQLiteIniFile.WriteDateTime(const ASection, AKey: string;
  AValue: TDateTime);
begin
  WriteString(ASection, AKey, DateTimeToStr(AValue, FFormatSettings));
end;

procedure TFDSQLiteIniFile.WriteFloat(const ASection, AKey: string;
  AValue: Double);
begin
  WriteString(ASection, AKey, FloatToStr(AValue, FFormatSettings));
end;

procedure TFDSQLiteIniFile.WriteStream(const ASection, AKey: String;
  AStream: TStream);
begin
  FDatabase.WriteStream(ASection, AKey, AStream, StreamCompressionLevel);
end;

procedure TFDSQLiteIniFile.WriteString(const ASection, AKey, AValue: String);
begin
  FDatabase.WriteString(ASection, AKey, AValue);
end;

procedure TFDSQLiteIniFile.WriteStrings(const ASection, AKey: string;
  const AValue: TStrings);
begin
  FDatabase.WriteStrings(ASection, AKey, AValue);
end;

procedure TFDSQLiteIniFile.WriteTime(const ASection, AKey: string;
  AValue: TDateTime);
begin
  WriteString(ASection, AKey, TimeToStr(AValue, FFormatSettings));
end;

initialization

  FDExtensionManager().AddExtension([TSQLiteCollation_systemnocase]);

end.