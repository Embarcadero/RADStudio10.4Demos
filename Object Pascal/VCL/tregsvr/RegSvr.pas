//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit RegSvr;

interface

uses
  SysUtils, Windows, ActiveX, ComObj, ImageHlp;

type
  TRegAction = (raReg, raUnreg, raRegPerUser, raUnregPerUser);
  TRegType   = (rtUnspecified, rtAxLib, rtTypeLib, rtExeLib, rtAssembly);
  TOutputProc= procedure(const AMessage: string);

var
  OutputProc: TOutputProc;

function RegisterServer(const AFileName: string;
                        ARegAction: TRegAction;
                        ARegType: TRegType = rtUnspecified;
                        ASideBySide: Boolean = False): Boolean;

implementation

resourcestring
  SFileNotFound = 'File "%s" not found';
  SCantFindProc = '"%s" procedure not found in "%s"';
  SRegFail = 'Call to %s%s failed in "%s"';
  SLoadFail = 'Failed to load "%s"';
  SRegSuccessful = 'Call to %s%s was successful!';
  SRegStr = 'registered';
  SUnregStr = 'unregistered';
  STlbName = 'Type library name: %s';
  STlbGuid = 'Type library GUID: %s';
  STlbRegSuccessful = 'Type library successfully %s!';
  SCantUnregTlb = 'The version of OLEAUT32.DLL on this machine does not ' +
    'support type library unregistration. (UnRegisterTypeLib)';
  SCantRegTlbForUser = 'The version of OLEAUT32.DLL on this machine does not ' +
    'support "Per User" type library registration. (RegisterTypeLibForUser)';
  SCantUnregTlbForUser = 'The version of OLEAUT32.DLL on this machine does not ' +
    'support "Per User" type library unregistration. (UnregisterTypeLibForUser)';
  SNeedFileExt = 'You must specify a file extension for "%s"';
  SExeRegSuccessful = '%s successfully called.';
  SExeRegUnsuccessful = '%s failed.';

type
  TRegProc         = function : HResult; stdcall;
  TInstallProc     = function(bInstall: WordBool; pszCmdLine: LPCWSTR): HResult; stdcall;
  TUnRegTlbProc    = function (const libID: TGUID; wVerMajor, wVerMinor: Word;
                               lcid: TLCID; syskind: TSysKind): HResult; stdcall;
  TAssemblyRegProc = function(FileName: PChar; Reserved: Pointer) : Boolean stdcall;

const
  ProcName: array[TRegAction] of PChar = ('DllRegisterServer',
                                          'DllUnregisterServer',
                                          'DllInstall',
                                          'DllInstall');
  ProcParam: array[TRegAction] of PChar = ('',
                                           '',
                                           '(TRUE, "user")',
                                           '(FALSE, "user")');
  ExeFlags: array[TRegAction] of string = (' /RegServer',
                                           ' /UnregServer',
                                           ' /RegServerPerUser',
                                           ' /UnregServerPerUser');
  {NOTE: No 'Per User' entry-points for Assemblies! }
  AssemblyProcName: array[TRegAction] of PChar = ('RegisterAssembly',
                                                  'UnregisterAssembly',
                                                  'RegisterAssembly',
                                                  'UnregisterAssembly');

var
  RegType: TRegType = rtAxLib;
  RegAction: TRegAction = raReg;
  SideBySide: Boolean = False;
  FileName: string;
  RegProc: TRegProc;
  LibHandle: THandle;
  OleAutLib: THandle;
  UnRegTlbProc: TUnRegTlbProc;


procedure OutputFmt(const Fmt: string; const Args: array of const);
begin
  if @OutputProc <> nil then
    OutputProc(Format(Fmt, Args));
end;

procedure RegisterAxLib;
var
  CurrentDir,
  FilePath: string;
  InstallProc: TInstallProc;
begin
  FilePath := ExtractFilePath(FileName);
  CurrentDir := GetCurrentDir;
  SetCurrentDir(FilePath);
  try
    LibHandle := LoadLibrary(PChar(FileName));
    if LibHandle = 0 then
      raise Exception.CreateFmt(SLoadFail, [FileName]);
    try
      @RegProc := GetProcAddress(LibHandle, PAnsiChar(AnsiString(ProcName[RegAction])));
      if @RegProc = nil then
        raise Exception.CreateFmt(SCantFindProc, [ProcName[RegAction],
                                                  FileName]);

      if (RegAction in [raRegPerUser, raUnregPerUser]) then
      begin
        @InstallProc := @RegProc;
        if InstallProc((RegAction = raRegPerUser), 'user') <> 0 then
          raise Exception.CreateFmt(SRegFail, [ProcName[RegAction], ProcParam[RegAction], FileName]);
      end
      else
      begin
        if RegProc <> 0 then
          raise Exception.CreateFmt(SRegFail, [ProcName[RegAction], ProcParam[RegAction], FileName]);
      end;
      OutputFmt(SRegSuccessful, [ProcName[RegAction], ProcParam[RegAction]]);
    finally
      FreeLibrary(LibHandle);
    end;
  finally
    SetCurrentDir(CurrentDir);
  end;
end;

procedure RegisterTLB;
type
  TRegisterForUserProc = function(TypeLib: ITypeLib; szFullPath, szHelpDir: POleStr): HResult; stdcall;
const
  RegMessage: array[TRegAction] of string = (SRegStr, SUnregStr, SRegStr, SUnregStr);
var
  WFileName, DocName: WideString;
  TypeLib: ITypeLib;
  LibAttr: PTLibAttr;
  CurrentDir, TypeLibPath: string;
  RegisterForUserProc: TRegisterForUserProc;
  UnregisterForUserProc: TUnRegTlbProc;
begin
  TypeLibPath := ExtractFilePath(FileName);
  CurrentDir := GetCurrentDir;
  if (TypeLibPath = '') and not SideBySide then
    FileName := IncludeTrailingPathDelimiter(CurrentDir) + FileName;
  if not FileExists(FileName) then
    raise Exception.CreateFmt(SFileNotFound, [FileName]);
  { Always make the directory with the tlb the current directory so that
    side by side registration and UNregistration will succeed. }
  if TypeLibPath <> '' then
    SetCurrentDir(TypeLibPath);
  if SideBySide then
    FileName := ExtractFileName(FileName);
  WFileName := FileName;
  OleCheck(LoadTypeLib(PWideChar(WFileName), TypeLib));
  OutputFmt(STlbName, [WFileName]);
  OleCheck(TypeLib.GetLibAttr(LibAttr));
  try
    OutputFmt(STlbGUID+sLineBreak, [GUIDToString(LibAttr^.guid)]);
    if RegAction = raReg then
    begin
      OleCheck(TypeLib.GetDocumentation(-1, nil, nil, nil, @DocName));
      DocName := ExtractFilePath(DocName);
      OleCheck(RegisterTypeLib(TypeLib, PWideChar(WFileName), PWideChar(DocName)));
    end
    else if RegAction = raRegPerUser then
    begin
      OleAutLib := GetModuleHandle('OLEAUT32.DLL');
      if OleAutLib <> 0 then
        @RegisterForUserProc := GetProcAddress(OleAutLib, 'RegisterTypeLibForUser');
      if @RegisterForUserProc = nil then
        raise Exception.Create(SCantRegTlbForUser);

      OleCheck(RegisterForUserProc(TypeLib, PWideChar(WFileName), PWideChar(DocName)));
    end
    else if RegAction = raUnreg then
    begin
      OleAutLib := GetModuleHandle('OLEAUT32.DLL');
      if OleAutLib <> 0 then
        @UnRegTlbProc := GetProcAddress(OleAutLib, 'UnRegisterTypeLib');
      if @UnRegTlbProc = nil then
        raise Exception.Create(SCantUnregTlb);

      with LibAttr^ do
        OleCheck(UnRegTlbProc(Guid, wMajorVerNum, wMinorVerNum, LCID, SysKind));
    end else if RegAction = raUnregPerUser then
    begin
      OleAutLib := GetModuleHandle('OLEAUT32.DLL');
      if OleAutLib <> 0 then
        @UnregisterForUserProc := GetProcAddress(OleAutLib, 'UnRegisterTypeLibForUser');
      if @UnregisterForUserProc = nil then
        raise Exception.Create(SCantUnregTlbForUser);

      with LibAttr^ do
        OleCheck(UnregisterForUserProc(Guid, wMajorVerNum, wMinorVerNum, LCID, SysKind));
    end;
  finally
    TypeLib.ReleaseTLibAttr(LibAttr);
    if TypeLibPath <> '' then
      SetCurrentDir(CurrentDir);
  end;
  OutputFmt(STlbRegSuccessful, [RegMessage[RegAction]]);
end;

procedure RegisterEXE;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  RegisterExitCode: BOOL;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  RegisterExitCode := Win32Check(CreateProcess(PChar(FileName), PChar(FileName + ExeFlags[RegAction]),
    nil, nil, True, 0, nil, nil, SI, PI));
  CloseHandle(PI.hThread);
  CloseHandle(PI.hProcess);
  if not RegisterExitCode then
    raise Exception.CreateFmt(SExeRegUnsuccessful, [PChar(FileName + ExeFlags[RegAction])])
  else
    OutputFmt(sExeRegSuccessful, [PChar(FileName + ExeFlags[RegAction])]);
end;

procedure RegisterAssembly;
const
  STRegAsm = 'tregasm.dll';
var
  RegProc: TAssemblyRegProc;
  SavedCW: Word;
begin
  SavedCW := Get8087CW;

  try
    Set8087CW($027f);
    LibHandle := LoadLibrary(PChar(STRegAsm));

    if LibHandle = 0 then raise Exception.CreateFmt(SLoadFail, [STRegAsm]);
    try
      @RegProc := GetProcAddress(LibHandle, PAnsiChar(AnsiString(AssemblyProcName[RegAction])));
      if @RegProc = nil then
        raise Exception.CreateFmt(SCantFindProc, [AssemblyProcName[RegAction],
          STRegAsm]);
      if not RegProc(PChar(FileName), nil) then
        raise Exception.CreateFmt(SRegFail, [AssemblyProcName[RegAction], '', STRegAsm]);
      OutputFmt(SRegSuccessful, [AssemblyProcName[RegAction], '']);
    finally
      FreeLibrary(LibHandle);
    end;
  finally
    Set8087CW(SavedCW);  
  end;
end;

function RegisterServer(const AFileName: string;
                        ARegAction: TRegAction;
                        ARegType: TRegType;
                        ASideBySide: Boolean): Boolean;

  function IsAssembly(const FileName: string): Boolean;
  var
    Extension: string;
  begin
    Result := False;

    if FileExists(FileName) then
    begin
      Extension := LowerCase(ExtractFileExt(FileName));

      if (CompareText(Extension, '.EXE') = 0) or
       (CompareText(Extension, '.DLL') = 0) then
      begin
        Result := SysUtils.IsAssembly(FileName);
      end;
    end;
  end;

var
  FileExt: string;
begin
  Result := True;
  RegAction  := ARegAction;
  FileName   := AFileName;
  SideBySide := ASideBySide;

  try
    if (ARegType = rtUnspecified) then
    begin
      FileExt := ExtractFileExt(FileName);
      if FileExt = '' then
        raise Exception.CreateFmt(SNeedFileExt, [FileName]);

      if CompareText(FileExt, '.TLB') = 0 then
        RegType := rtTypeLib
      else if CompareText(FileExt, '.EXE') = 0 then
        RegType := rtExeLib
      else if IsAssembly(FileName) then
        RegType := rtAssembly
      else
        RegType := rtAxLib;
    end
    else
    begin
      RegType := ARegType;
    end;

    if not FileExists(FileName) then
      raise Exception.CreateFmt(SFileNotFound, [FileName]);
    case RegType of
      rtAxLib: RegisterAxLib;
      rtTypeLib: RegisterTLB;
      rtExeLib: RegisterEXE;
      rtAssembly: RegisterAssembly;
    end;
  except
    on E:Exception do
    begin
      if (ARegType <> rtUnspecified) then
        raise;
      Result := False;
    end;
  end;
end;

end.
