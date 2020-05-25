//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit SocketsEditor;

interface

uses Classes, DesignIntf, DesignEditors;

type
  TSocketPortProperty = class(TStringProperty)
  public
    function GetDatabasePath: string;
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

implementation

uses Windows, Registry, SysUtils;

function TSocketPortProperty.GetDatabasePath;
var
  Reg: TRegistry;
  p1, p2: pchar;
  EnvVar: string;
  Subdir: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters', True) then begin
      result := Reg.ReadString('DataBasePath');
      p1 := Strpos(pchar(result), '%');
      if p1 <> nil then begin
        p2 := Strpos(p1 + 1, '%');
        SetString(EnvVar, p1 + 1, p2 - p1 - 1);
        SubDir := p2 + 1;
        result := GetEnvironmentVariable(EnvVar) + SubDir;
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

function TSocketPortProperty.GetAttributes: TPropertyAttributes;
begin
  result := [paValueList, paSortList];
end;

procedure TSocketPortProperty.GetValues(Proc: TGetStrProc);
var
  f: TextFile;
  line: string;
  svc: string;
  svcbak: string;

function NextToken(var s: string): string;
var
  c: char;
  i: integer;
  state: integer;

function Eol: boolean;
begin
  result := i >= length(s);
end;

function NextChar: char;
begin
  inc(i);
  result := s[i];
end;

begin
  i := 0;
  state := 0;
  c := NextChar;
  while not eol and (state < 3) do
  begin
    case state of
      0 : begin
            result := c;
            case c of
              'a'..'z',
              'A'..'Z',
              '_' : state := 1;
              '0'..'9' : state := 2;
            else
              c := NextChar;
            end;
          end;
      1 : begin
            c := NextChar;
            if CharInSet(c, ['a'..'z', 'A'..'Z', '0'..'9', '_', '-']) then result := result + c
            else state := 3;
          end;
      2 : begin
            c := NextChar;
            if CharInSet(c, ['0'..'9']) then result := result + c
            else state := 3;
          end;
    end;
  end;
  s := trim(copy(s, i, length(s)));
end;

begin
  svcbak := '';
  Assign(f, GetDataBasePath + '\Services');
  Reset(f);
  while not eof(f) do
  begin
    Readln(f, line);
    line := trim(line);
    if (length(line) > 0) and (line[1] <> '#') then begin
//      Proc(NextToken(line) + ' (' + NextToken(line) + ')');
      svc := NextToken(line);
      if svc <> svcbak then
        Proc(svc);
      svcbak := svc;
    end;
  end;
  Close(f);
end;

end.
