//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit RegSvrUtils;

interface

uses ActiveX, SysUtils, Windows;

type

  ERegistryException = class(Exception)
  end;

function RegOpenKey(Key: HKey; const SubKey: string): HKey;
function RegGetKey(Key: HKey; const SubKey: string): string;
function RegCanOpenKey(Key: HKey; const SubKey: string;
                       var OutKey: HKey): Boolean;
function RegKeyExists(Key: HKey; const SubKey: string): Boolean;

function RegCloseAndNilKey(var Key: HKey): Boolean;

function RegQuerySubKeyCount(Key: HKey): Integer;
function RegEnumKey(Key: HKey; Index: Integer; var Value: string): Boolean;
function RegQueryKey(Key: HKey; const SubKey: string;
                     var Value: string): Boolean;

function RegGetDefaultValue(Key: HKey): string;
function RegGetValueEx(Key: HKey; const ValName: string): string;

procedure ErrorFmt(const Ident: string; const Args: array of const);


resourcestring

  sOleRegKeyNotFound = 'Registry key %s not found';
  sTypeLibVersion = 'Version';


implementation


procedure ErrorFmt(const Ident: string; const Args: array of const);
begin
  raise ERegistryException.CreateFmt(Ident, Args);
end;

function RegOpenKey(Key: HKey; const SubKey: string): HKey;
begin
  Result := 0;
  Windows.RegOpenKey(Key, PChar(SubKey), Result);
end;

function RegGetKey(Key: HKey; const SubKey: string): string;
begin
  if not RegQueryKey(Key, SubKey, Result) then
    ErrorFmt(SOleRegKeyNotFound, [SubKey]);
end;

{ the next function is designed to allow registry key opening to be used
  via c-style if (assignment) idiom. The key is returned via the final
  [in] parameter and the logical return value of the function is true/false. }

function RegCanOpenKey(Key: HKey; const SubKey: string; var OutKey: HKey): Boolean;
begin
  OutKey := 0;
  Result := Windows.RegOpenKey(Key, PChar(SubKey), OutKey) = ERROR_SUCCESS;
end;

function RegKeyExists(Key: HKey; const SubKey: string): Boolean;
var
  OutKey: HKey;
begin
  Result := False;
  OutKey := 0;
  try
    OutKey := RegOpenKey(Key, SubKey);
    if OutKey <> 0 then
    begin
      RegCloseKey(OutKey);
      Result := True;
    end;
  except
    Result := False;
    if OutKey <> 0 then
      RegCloseKey(OutKey);
  end;
end;

function RegQuerySubKeyCount(Key: HKey) : Integer;
var
  NumSubKeys : DWord;
begin
  Result := -1;
  if Windows.RegQueryInfoKey(Key, nil, nil, nil, @NumSubKeys, nil, nil, nil,
                             nil, nil, nil, nil)  = 0 then
  begin
    Result := NumSubKeys;
  end;
end;

function RegEnumKey(Key: HKey; Index: Integer; var Value: string): Boolean;
var
  Buffer: array[0..1024] of Char;
begin
  Result := False;
  if Windows.RegEnumKey(Key, Index, Buffer, SizeOf(Buffer)) = 0 then
  begin
    Value := Buffer;
    Result:= True;
  end;
end;

function RegQueryKey(Key: HKey; const SubKey: string; var Value: string): Boolean;
var
  BufSize: Longint;
  Buffer: array[0..1024] of Char;
begin
  Result  := False;
  BufSize := SizeOf(Buffer);
  if Windows.RegQueryValue(Key, PChar(SubKey), Buffer, BufSize) = 0 then
  begin
    Value := Buffer;
    Result:= True;
  end;
end;

{special-case for nil subkeys }
function RegGetDefaultValue(Key: HKey): string;
var
  BufSize: Longint;
  Buffer: array[0..1024] of Char;
begin
  BufSize := SizeOf(Buffer);
  if Windows.RegQueryValue(Key, nil, Buffer, BufSize) = 0 then
  begin
    Result := Buffer;
  end
  else
    ErrorFmt(SOleRegKeyNotFound, [Key]);
end;

{ note: it is assumed that the value here is of type LPSTR. If
  the calling function screws this up, bad things may happen. }
function RegGetValueEx(Key: HKey; const ValName: string): string;
var
 BufSize: Longint;
 Buffer: array[0..1024] of char;
begin
  BufSize := SizeOf(Buffer);
  if Windows.RegQueryValueEx(Key, PChar(ValName), nil,
                             nil, @Buffer, @BufSize) = 0 then
  begin
    Result := Buffer;
  end
  else
    ErrorFmt(SOleRegKeyNotFound, [Key]);
end;


function RegCloseAndNilKey(var Key: HKey): Boolean;
begin
  Result := false;
  try
    if Key <> 0 then
      RegCloseKey(Key);
    Key := 0;
    Result := true;
  except
    { do nothing: squish the exception, and return false.}
  end;
end;

end.

