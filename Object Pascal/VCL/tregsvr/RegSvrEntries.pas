//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit RegSvrEntries;

interface

uses
  Classes, Windows, Types;

type

  AxRegInfo = (aiScanCLSID, aiScanControlsOnly, aiScanTypelib, aiScanInterface);
  AxRegInfos = set of AxRegInfo;

  TRegEntriesBase = class;

  TRegEntryBase = class
  strict private
    FDesc: string;                              // Name|GUID of TypeLib followed by version of server and version of TypeLib
    FTypeLibID: string;                         // GUID of TypeLibrary
    FVersion: string;                           // Version
    FProgIDs: TStringDynArray;                  // ProgIDs
    FIntfIDs: TStringDynArray;                  // Interfaces

  protected
    FOwner: TRegEntriesBase;                   // Owner of this ControlDescriptor
    FFileName: string;                          // TypeLibrary File
    FClassIDs: TStringDynArray;                 // ClassIDs

    function GetClassID(Index: Integer): string;
    function GetProgID(Index: Integer): string;
    function GetIntfID(Index: Integer): string;
    function GetClassIDCount: Integer;
    function GetProgIDCount: Integer;
    function GetIntfIDCount: Integer;
    procedure AddClassAndProgID(const AClassID, AProgID: string);
    procedure AddIntfID(const AIntfID: string);
    procedure SetTypelibID(const ATypeLibId: string);

  public
    constructor Create(Owner: TRegEntriesBase; const Desc, FileName: string); virtual;
    destructor Destroy; override;

    property Description: string read FDesc;
    property FileName: string read FFileName;
    property TypeLibID: string read FTypeLibID write SetTypelibID;
    property Version: string read FVersion write FVersion;

    property ClassIDCount: Integer read GetClassIDCount;
    property ProgIDCount: Integer read GetProgIDCount;
    property IntfIDCount: Integer read GetIntfIDCount;
    property ClassID[Index: Integer]: string read GetClassID;
    property ClassIDs: TStringDynArray read FClassIDs;
    property ProgID[Index: Integer]: string read GetProgID;
    property ProgIDs: TStringDynArray read FProgIDs;
    property IntfIDs: TStringDynArray read FIntfIDs;
    property IntfID[Index: Integer]: string read GetIntfID;
  end;

  TDynRegEntryBase = array of TRegEntryBase;

  TRegEntriesBase = class
  private
    FAxRegInfos: AxRegInfos;
    FRootKey:   HKEY;
    procedure   FreeItems;
    function    GetCount: Integer;
    function    GetItem(Index: Integer): TRegEntryBase;
  protected
    FItems:     TList;

    function    FindOrCreate(const FileName, Desc: string): TRegEntryBase;
    function    Find(const ATypeLibID: string): TDynRegEntryBase;
    function    NewControlDef(Owner: TRegEntriesBase;
                              const Desc, FileName: string): TRegEntryBase; virtual;
    procedure   DoUpdate(ARootKey: HKEY);
    procedure   ScanTypeLibKey(ARootKey: HKEY);
    procedure   ScanCLSIDKey(ARootKey: HKEY);
    procedure   ScanInterfaces(ARootKey: HKEY);
    function    FindMatchingTypeLib(ARootKey: HKEY;
                                    const TypeLibID: string;
                                    var Version: string;
                                    var FileName: string;
                                    var Desc: string): Boolean;
  public
    constructor Create(AControlsOnly: Boolean = True);
    constructor CreateNew(ARegInfos: AXRegInfos;
                          ARootKey: HKEY;
                          AUpdate: Boolean);
    destructor  Destroy; override;
    procedure   Update;
    function    GetControlsOnly: Boolean;

    property    Count: Integer read GetCount;
    property    Items[Index: Integer]: TRegEntryBase read GetItem; default;
    property    ControlsOnly: Boolean read GetControlsOnly;
    property    RootKey: HKEY read FRootKey write FRootKey;
  end;

function FindRegisteredTypeLibraryPath(const importLibName: string): string;


implementation

uses
  ActiveX, SysUtils, ComObj, Vcl.Controls, Vcl.Dialogs, RegSvrUtils;


function FindDecimalPoint(const Value: string): Integer;
var
  I: Integer;
  C: Char;
begin
  Result := -1;
  for I := 1 to Length(Value) do
  begin
    C := Value[I];
    if C = '.' then
    begin
      Result := I;
      Break;
    end;
  end;
end;


function MatchesMajorVersion(const NewVersion, Version: string): Boolean;
var
  I, J : Integer;
  NewVerStr, VerStr, SubStr: string;
begin
   SubStr:= '.';
   Result := false;
   I := FindDecimalPoint(NewVersion);
   J := FindDecimalPoint(Version);
   if I = J then
   begin
      NewVerStr := Copy(NewVersion, 1, I);
      VerStr := Copy(Version, 1, J);
      Result := AnsiSameStr(NewVerStr, VerStr);
   end;
end;

function IsGreaterMinorVersion(const NewVersion, Version: string): Boolean;
var
  I, J : Real;
  K : Integer;
begin
  Result := false;
  I := FindDecimalPoint(NewVersion) + 2; { one for one-based indexing, one for the . }
  J := FindDecimalPoint(Version) + 2; { one for one-based indexing, one for the . }
  if I = J then
  begin
    Val(NewVersion, I, K);
    Val(Version, J, K);
    Result := I > J;
  end;
end;

procedure TRegEntryBase.AddClassAndProgID(const AClassID, AProgID: string);
var
  L: Integer;
begin
  L := Length(FClassIds);
  SetLength(FClassIDs, L+1);
  FClassIDs[L] := AClassID;

  L := Length(FProgIds);
  SetLength(FProgIDs, L+1);
  FProgIDs[L] := AProgID;
end;

procedure TRegEntryBase.AddIntfID(const AIntfID: string);
var
  L: Integer;
begin
  L := Length(FIntfIDs);
  SetLength(FIntfIDs, L+1);
  FIntfIDs[L] := AIntfID;
end;

procedure TRegEntryBase.SetTypelibID(const ATypelibId: string);
begin
  FTypeLibID := ATypelibId;
end;

constructor TRegEntryBase.Create(Owner: TRegEntriesBase; const Desc, FileName: string);
begin
  Owner.FItems.Add(Self);
  FOwner := Owner;
  FFileName := FileName;
  FDesc := Desc;
end;

destructor TRegEntryBase.Destroy;
begin
  if FOwner <> nil then
    FOwner.FItems.Remove(Self);
end;

function TRegEntryBase.GetClassID(Index: Integer): string;
begin
  Result := FClassIDs[Index];
end;

function TRegEntryBase.GetClassIDCount: Integer;
begin
  Result := Length(FClassIDs);
end;

function TRegEntryBase.GetProgID(Index: Integer): string;
begin
  Result := FProgIDs[Index];
end;

function TRegEntryBase.GetProgIDCount: Integer;
begin
  Result := Length(FProgIDs);
end;

function TRegEntryBase.GetIntfID(Index: Integer): string;
begin
  Result := FIntfIDs[Index];
end;

function TRegEntryBase.GetIntfIDCount: Integer;
begin
  Result := Length(FIntfIDs);
end;


{ TControlDefs }

constructor TRegEntriesBase.Create(AControlsOnly: Boolean = True);
begin
  FItems := TList.Create;
  FRootKey := HKEY_CLASSES_ROOT;
  if (AControlsOnly) then
    FAxRegInfos := [aiScanCLSID, aiScanControlsOnly]
  else
    FAxRegInfos := [aiScanTypeLib];
  Update;
end;


constructor TRegEntriesBase.CreateNew(ARegInfos: AXRegInfos;
                                      ARootKey: HKEY;
                                      AUpdate: Boolean);
begin
  FItems := TList.Create;
  FAxRegInfos := ARegInfos;
  FRootKey := ARootKey;
  if AUpdate then
    Update;
end;


destructor TRegEntriesBase.Destroy;
begin
  if FItems <> nil then
    FreeItems;
  FItems.Free;
end;

function TRegEntriesBase.NewControlDef(Owner: TRegEntriesBase;
                              const Desc, FileName: string): TRegEntryBase;
begin
  Result := TRegEntryBase.Create(Self, Desc, FileName);
end;

function TRegEntriesBase.FindOrCreate(const FileName, Desc: string): TRegEntryBase;
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do
  begin
    Result := FItems[I];
    if (Result.FileName = FileName) then
    begin
      Exit;
    end;
  end;
  Result := NewControlDef(Self, Desc, FileName);
end;

function TRegEntriesBase.Find(const ATypeLibID: string): TDynRegEntryBase;
var
  I: Integer;
begin
  SetLength(Result, 0);
  for I := 0 to FItems.Count - 1 do
  begin
    if (TRegEntryBase(FItems[I]).TypeLibID = ATypeLibID) then
    begin
      SetLength(Result, Length(Result)+1);
      Result[Length(Result)-1] := FItems[I];
    end;
  end;
end;

procedure TRegEntriesBase.FreeItems;
begin
  while FItems.Count > 0 do
    TRegEntryBase(FItems.Last).Free;
end;

function TRegEntriesBase.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TRegEntriesBase.GetItem(Index: Integer): TRegEntryBase;
begin
  Result := FItems[Index];
end;

function TRegEntriesBase.GetControlsOnly: Boolean;
begin
  Result := aiScanControlsOnly in FAxRegInfos;
end;

function GetDescription(ARootKey: HKEY; const TypeLibID, Version, FileName: string): string;
begin
  Result := '';
  if RegQueryKey(ARootKey, Format('TypeLib\%s\%s', [TypeLibID, Version]), Result) and
     (Result <> '') then
    Result := Format('%s (%s %s)',[Result, sTypeLibVersion, Version]) // Do not localize.
  else
    Result := Format('%s (%s %s)',[FileName, sTypeLibVersion, Version]) // Do not localize.
end;

procedure TRegEntriesBase.ScanTypelibKey(ARootKey: HKEY);
var
  I, J, LibFlagsVal: Integer;
  TypeLibID, Version, FileName, LibFlags, Desc: string;
  TypeLibKey, IDKey: HKey;
  ControlDef: TRegEntryBase;
begin
  TypeLibKey := RegOpenKey(ARootKey, 'TypeLib');                     { do not localize }
  if TypeLibKey <> 0 then
  begin
    try
      I := 0;
      while RegEnumKey(TypeLibKey, I, TypeLibID) do
      begin
        Inc(I);
        IDKey := RegOpenKey(TypeLibKey, TypeLibID);
        try
          J := 0;
          while RegEnumKey(IDKey, J, Version) do
          begin
            Inc(J);
            if (not RegQueryKey(ARootKey,
                                Format('TypeLib\%s\%s\0\win32', [TypeLibID, Version]),
                                FileName)) then
              continue;

            if RegQueryKey(ARootKey, Format('TypeLib\%s\%s\FLAGS', [TypeLibID, Version]), LibFlags) and
               (LibFlags <> '') and
               (TryStrToInt(LibFlags, LibFlagsVal)) and
               ((LibFlagsVal and LIBFLAG_FHIDDEN) <> 0) then
              Continue;

            Desc := GetDescription(ARootKey, TypeLibID, Version, FileName);

            ControlDef := FindOrCreate(FileName, Desc);
            ControlDef.TypeLibID := TypeLibID;
            ControlDef.Version := Version;
          end;
        finally
          RegCloseKey(IDKey);
        end;
      end;
    finally
      RegCloseKey(TypeLibKey);
    end;
  end;
end;

function TRegEntriesBase.FindMatchingTypeLib(ARootKey: HKEY;
                                              const TypeLibID: string;
                                              var Version: string;
                                              var FileName: string;
                                              var Desc: string): Boolean;
var
  TypeLibKey, InnerTypeLibKey: HKEY;
  I, K, L: Integer;
  NewVersion: string;
  Items: TDynRegEntryBase;
begin
  Result := False;
  Items := Find(TypeLibID);
  if (Length(Items) > 0) then
  begin
    { Find exact match }
    for I := 0 to Length(Items)-1 do
    begin
      if (Items[I].Version = Version) and (Items[I].FFileName <> '') then
      begin
        FileName := Items[I].FFileName;
        Desc := Items[I].Description;
        Result := True;
        Exit;
      end;
    end;

    { Take the only one, if we've scanned typelibraries }
    if (aiScanTypeLib in FAxRegInfos) and (Length(Items) = 1) and (Items[0].FFileName <> '') then
    begin
      Version := Items[0].Version;
      FileName := Items[0].FileName;
      Desc := Items[0].Description;
      Result := True;
      Exit;
    end;

    { Find compatible match }
    for I := 0 to Length(Items)-1 do
    begin
      if (Items[I].FFileName <> '') and
         MatchesMajorVersion(Items[I].Version, Version) and
         IsGreaterMinorVersion(Items[I].Version, Version) then
      begin
        Version := Items[I].Version;
        FileName := Items[I].FileName;
        Desc := Items[I].Description;
        Result := True;
        Exit;
      end;
    end;
  end;

  TypeLibKey := 0;
  if not RegCanOpenKey(ARootKey, 'Typelib', TypeLibKey) then
    Exit;

  try
    InnerTypeLibKey := 0;
    if not RegCanOpenKey(TypeLibKey, TypeLibID, InnerTypeLibKey) then
      Exit;

    try
      K := RegQuerySubKeyCount(InnerTypeLibKey);
      { if it only has one subkey, use it. }
      if K = 1 then
      begin
        RegEnumKey(InnerTypeLibKey, 0, NewVersion);
        if not RegQueryKey(InnerTypeLibKey, Format('%s\0\win32', [NewVersion]), FileName) then
          Exit;

        Desc := GetDescription(ARootKey, TypeLibID, NewVersion, FileName);
        Version := NewVersion;
      end
      { if for some reason it has zero or fewer subkeys, bail. }
      else if K < 1 then
          Exit
      else
      begin
        { iterate through all the subkeys looking for a match.}
        for L := K -1 downto 0 do
        begin
          RegEnumKey(InnerTypeLibKey, L, NewVersion);
          if (MatchesMajorVersion(NewVersion, Version)) and
             (IsGreaterMinorVersion(NewVersion, Version)) then
          begin
            if not RegQueryKey(InnerTypeLibKey,
                               Format('%s\0\win32', [NewVersion]),
                               FileName) then
              Break;

            Desc := GetDescription(ARootKey, TypeLibId, NewVersion, FileName);
            Version := NewVersion;
          end;
        end;
      end;
    finally
      RegCloseKey(InnerTypeLibKey)
    end;
  finally
    RegCloseKey(TypeLibKey);
  end;
  Result := True;
end;

procedure TRegEntriesBase.ScanCLSIDKey(ARootKey: HKEY);
var
  ControlDef: TRegEntryBase;
  AControlsOnly: Boolean;
  ClassIDKey: HKEY;
  ClassID, ProgID, Version, TypeLibID, S, FileName, Desc: string;
  I: Integer;
begin
  AControlsOnly := aiScanControlsOnly in FAxRegInfos;
  ClassIDKey := RegOpenKey(ARootKey, 'CLSID');                       { do not locialize }
  if ClassIDKey <> 0 then
  begin
    try
      I := 0;
      while RegEnumKey(ClassIDKey, I, ClassID) do
      begin
        Inc(I);
        if RegQueryKey(ClassIDKey, ClassID + '\ProgID', ProgID) and            { do not locialize }
           RegQueryKey(ClassIDKey, ClassID + '\TypeLib', TypeLibID) and        { do not locialize }
           RegQueryKey(ClassIDKey, ClassID + '\Version', Version) then         { do not locialize }
        begin
          if (AControlsOnly) and
             ((RegQueryKey(ClassIDKey, ClassID + '\Control', S) = False) or
              (RegQueryKey(ClassIDKey, ClassID + '\InprocServer32', S) = False)) then
            continue;

          FileName := '';
          Desc := '';

          // If there's no typelibrary, just get the LocalServer or InprocServer paths
          if (TypeLibID = '')  then
          begin
            // NOTE: Some entries, such as 'TreatAs' entries, won't have any values
            //       for InprocServer32/LocalServer32/Typelib. We skip them
            if (RegQueryKey(ClassIDKey, ClassID + '\InprocServer32', FileName) or
                RegQueryKey(ClassIDKey, ClassID + '\LocalServer32', FileName)) and
               (FileName <> '') then
            begin
              ControlDef := FindOrCreate(FileName, Desc);
              ControlDef.AddClassAndProgID(ClassID, ProgID);
              ControlDef.TypeLibID := TypeLibID;
              ControlDef.Version := Version;
            end;
            continue;
          end;

          { Find the typelibrary filename }
          if RegQueryKey(ARootKey, Format('TypeLib\%s\%s\0\win32', [TypeLibID, Version]), FileName) then
            Desc := GetDescription(ARootKey, TypeLibID, Version, FileName)
          else
          begin
            if (not FindMatchingTypeLib(ARootKey, TypeLibID, Version, FileName, Desc)) then
              continue;
          end;

          ControlDef := FindOrCreate(FileName, Desc);
          ControlDef.AddClassAndProgID(ClassID, ProgID);
          ControlDef.TypeLibID := TypeLibID;
          ControlDef.Version := Version;
        end;
      end;
    finally
      RegCloseKey(ClassIDKey);
    end;
  end;
end;

procedure TRegEntriesBase.ScanInterfaces(ARootKey: HKEY);
var
  ControlDef: TRegEntryBase;
  InterfaceKey: HKEY;
  IntfIID, Version, TypeLibID: string;
  I: Integer;
  Entries: TDynRegEntryBase;
begin
  InterfaceKey := RegOpenKey(ARootKey, 'Interface');                       { do not locialize }
  if InterfaceKey <> 0 then
  begin
    try
      I := 0;
      while RegEnumKey(InterfaceKey, I, IntfIID) do
      begin
        Inc(I);
        if RegQueryKey(InterfaceKey, IntfIID + '\TypeLib', TypeLibID) then         { do not locialize }
        begin
          if (TypeLibID <> '')  then
          begin
            Entries := Find(TypeLibID);
            if (Length(Entries) = 1) then
            begin
              Entries[0].AddIntfID(IntfIID);
            end;
          end;
        end;
      end;
    finally
      RegCloseKey(InterfaceKey);
    end;
  end;
end;

procedure TRegEntriesBase.DoUpdate(ARootKey: HKEY);
begin
  if (aiScanTypeLib in FAxRegInfos) then
    ScanTypeLibKey(ARootKey);
  if aiScanCLSID in FAxRegInfos then
    ScanCLSIDKey(ARootKey);
  if aiScanInterface in FAxRegInfos then
    ScanInterfaces(ARootKey);
end;


procedure TRegEntriesBase.Update;
begin
  FreeItems;
  DoUpdate(FRootKey);
end;

var
  CachedRegEntriesBase: TRegEntriesBase = nil;

function FindRegisteredTypeLibraryPath(const importLibName: string): string;
var
  I: Integer;
  FileName: string;
begin
  Result := '';
  if CachedRegEntriesBase = nil then
    CachedRegEntriesBase := TRegEntriesBase.Create(False);
  for I := 0 to CachedRegEntriesBase.Count-1 do
  begin
    FileName := CachedRegEntriesBase[I].FileName;
    if SameText(ExtractFileName(FileName), importLibName) then
    begin
      Result := FileName;
      Exit;
    end;
  end;
end;


initialization

finalization
  FreeAndNil(CachedRegEntriesBase);

end.
