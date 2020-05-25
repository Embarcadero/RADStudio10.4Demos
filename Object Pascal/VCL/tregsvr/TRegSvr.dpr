//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program TRegSvr;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  ActiveX,
  ComObj,
  Types,
  ImageHlp,
  RegConst in 'RegConst.pas',
  RegSvr,
  RegSvrEntries,
  RegSvrUtils;

var
  RegType: TRegType = rtAxLib;
  RegAction: TRegAction = raReg;
  QuietMode:  Boolean = False;
  SideBySide: Boolean = False;
  VerifyMode: Boolean = False;
  VerifyStr: string;
  FileName: string;


procedure OutputStr(const S: string);
var
  Str, OutS: AnsiString;
begin
  if not QuietMode then
  begin
    Str := AnsiString(S);
    SetLength(OutS, Length(Str));
    CharToOEM(PChar(S), PAnsiChar(OutS));
    Writeln(OutS);
  end;
end;


procedure OutputFmt(const Fmt: string; const Args: array of const);
begin
  OutputStr(Format(Fmt, Args));
end;


function DecodeOptions: Boolean;
var
  i: Integer;
  FileStart: Boolean;
  Param, FileExt: string;
begin
  Result := False;
  if ParamCount = 0 then
    Exit;
  FileName := '';
  for i := 1 to ParamCount do
  begin
    Param := ParamStr(i);
    FileStart := not CharInSet(Param[1], ['-', '/']);
    if FileStart then
    begin
      if FileName = '' then
        FileName := Param
      else
        FileName := FileName + ' ' + Param;
      // strip open and/or close quote if present
      if (FileName[1] = '"') then
      begin
        if (FileName[Length(FileName)] = '"') then
          FileName := Copy(FileName, 2, Length(FileName) - 2)
        else
          Delete(FileName, 1, 1);
      end;
      if (not VerifyMode) then
        FileName := ExpandFileName(FileName);
    end
    else
    begin
      if Length(Param) < 2 then Exit;
      case Param[2] of
        // ----------------------------------------------
        // Per-User registration/unregistration
        // ----------------------------------------------
        'C', 'c':
          begin
            case RegAction of
              raReg: RegAction := raRegPerUser;
              raUnreg: RegAction := raUnregPerUser;
              raRegPerUser: ;
              raUnregPerUser: ;
            end;
          end;

        // ----------------------------------------------
        // Unregister
        // ----------------------------------------------
        'U', 'u':
          begin
            case RegAction of
              raReg: RegAction := raUnreg;
              raUnreg: ;
              raRegPerUser: RegAction := raUnRegPerUser;
              raUnregPerUser: ;
            end;
          end;

        'Q', 'q': QuietMode := True;
        'S', 's': SideBySide:= True;
        'T', 't': RegType   := rtTypeLib;
        'V', 'v':
          begin
            VerifyMode:= True;
            VerifyStr := Param;
          end;
      else
        OutputStr(Format(sUnknownOption, [Param]));
      end;
    end;
  end;

  if (not VerifyMode) then
  begin
    FileExt := ExtractFileExt(FileName);
    if FileExt = '' then
      raise Exception.CreateFmt(sFileWithNoExt, [FileName]);
    if RegType <> rtTypeLib then
    begin
      if CompareText(FileExt, '.TLB') = 0 then
        RegType := rtTypeLib
      else if CompareText(FileExt, '.EXE') = 0 then
        RegType := rtExeLib
      else if IsAssembly(FileName) then
        RegType := rtAssembly
      else
        RegType := rtAxLib;
    end;
  end;
  Result := True;
end;

const
  sBreakLine = '-------------------------------------------------------';

procedure showEntry(const AEntry: TRegEntryBase;
                    Index: Integer;
                    AShowInterfaces: Boolean);
var
  I: Integer;
  s: string;
begin
  s := Format('(%d)', [Index]);
  OutputFmt  ('%-5s: %s', [s, AEntry.FileName]);
  if AEntry.TypeLibID <> '' then
    OutputFmt('TLB  : %s', [AEntry.TypeLibID]);
  if AEntry.Description <> '' then
    OutputFmt('DESC : %s', [AEntry.Description]);
  for I := 0 to AEntry.ClassIDCount-1 do
    OutputFmt('CLSID: %s', [AEntry.ClassID[I]]);
  for I := 0 to AEntry.ProgIDCount-1 do
    OutputFmt('PRGID: %s', [AEntry.ProgID[I]]);
  if (AShowInterfaces) then
    for I := 0 to AEntry.IntfIDCount-1 do
      OutputFmt('INTF : %s', [AEntry.IntfID[I]]);
  OutputStr(sBreakLine);
end;

function VerifyRegistry(const AName: string; ACurrentUser: Boolean): Integer;
const
  BASE_KEY: array[Boolean] of HKEY   =(HKEY_LOCAL_MACHINE, HKEY_CURRENT_USER);
  KEY_STR : array[Boolean] of string =('HKLM', 'HKCU');
  FND_STR : array[Boolean] of string =(sEntriesFound, sInvalidFound);
var
  ARootKey: HKEY;
  RegEntries: TRegEntriesBase;
  ACount, I, J: Integer;
  ShowInvalidOnly, ShowInterfaces: Boolean;
begin
  J := 0;
  ShowInvalidOnly := AnsiPos('!', VerifyStr) > 0;
  ShowInterfaces := AnsiPos('i', VerifyStr) > 0;
  OutputFmt(sSearchingFor, [AName, KEY_STR[ACurrentUser]]);
  OutputStr(sBreakLine);
  ARootKey := RegOpenKey(BASE_KEY[ACurrentUser], 'Software\Classes\');
  try
    RegEntries := TRegEntriesBase.CreateNew([aiScanTypelib, aiScanCLSID, aiScanInterface],
                                            ARootKey, True);
    try
      ACount := RegEntries.Count;
      for I := 0 to ACount-1 do
      begin
        if AnsiPos(AName, RegEntries[I].FileName) > 0 then
        begin
          if ShowInvalidOnly and FileExists(RegEntries[I].FileName) then
            continue;
          Inc(J);
          showEntry(RegEntries[I], J, ShowInterfaces);
        end;
      end;
    finally
      RegEntries.Free;
    end;
  finally
    RegCloseAndNilKey(ARootKey);
  end;
  OutputFmt(FND_STR[ShowInvalidOnly], [J, AName, ACount]);
  Result := J;
end;


begin
  OutputStr(SAbout);
  try
    if not DecodeOptions then
    begin
      OutputStr(SUsage);
      ExitCode := 1;
      Exit;
    end;

    if (VerifyMode) then
    begin
      ExitCode := VerifyRegistry(FileName, (RegAction = raRegPerUser) or
                                           (RegAction=raUnregPerUser));
      Exit;
    end;

    if not FileExists(FileName) then
      raise Exception.CreateFmt(SFileNotFound, [FileName]);

    RegSvr.OutputProc := OutputStr;
    RegisterServer(FileName, RegAction, RegType);
  except
    on E:Exception do
    begin
      OutputStr(Format(sErrorMessage, [E.Message]));
      ExitCode := 1;
    end;
  end;
end.
