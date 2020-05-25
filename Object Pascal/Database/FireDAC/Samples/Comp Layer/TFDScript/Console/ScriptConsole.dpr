//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ScriptConsole;

uses
  SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool,
    FireDAC.Stan.ExprFuncs, FireDAC.Stan.Util,
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.ScriptCommands,
  FireDAC.ConsoleUI.Wait, FireDAC.UI.Intf,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile, FireDAC.Moni.RemoteClient,
  FireDAC.Phys.Intf, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.PG, FireDAC.Phys.IB, FireDAC.Phys.FB, 
    FireDAC.Phys.ASA, FireDAC.Phys.MySQL, FireDAC.Phys.MSAcc, FireDAC.Phys.ODBC, FireDAC.Phys.MSSQL, 
    FireDAC.Phys.ODBCBase, FireDAC.Phys.DB2, FireDAC.Phys.Oracle, FireDAC.Phys.ADS;

{$R *.res}

type
  TFDConnEnv = class(TObject)
    procedure DoConsolePut(AEngine: TFDScript; const AMessage: String;
      AKind: TFDScriptOutputKind);
    procedure DoConsoleGet(AEngine: TFDScript; const APrompt: String;
      var AResult: String);
    procedure DoPause(AEngine: TFDScript; const AText: String);
  end;

var
  oEnv: TFDConnEnv;
  oScript: TFDScript;
  oConn: TFDConnection;

{-------------------------------------------------------------------------------}
{ TFDConnEnv                                                                    }
{-------------------------------------------------------------------------------}
procedure TFDConnEnv.DoConsolePut(AEngine: TFDScript;
  const AMessage: String; AKind: TFDScriptOutputKind);
begin
  WriteLn(AMessage);
end;

{-------------------------------------------------------------------------------}
procedure TFDConnEnv.DoConsoleGet(AEngine: TFDScript;
  const APrompt: String; var AResult: String);
begin
  WriteLn(APrompt);
  ReadLn(AResult);
end;

{-------------------------------------------------------------------------------}
procedure TFDConnEnv.DoPause(AEngine: TFDScript;
  const AText: String);
begin
  WriteLn(AText);
  WriteLn('Press Enter to continue script execution ...');
  ReadLn;
end;

{-------------------------------------------------------------------------------}
{ Main routines                                                                 }
{-------------------------------------------------------------------------------}
procedure Help;
begin
  WriteLn('Use: ScriptConsole [-d <name>] [-u <user>] [-w <pwd>] [-l] [-e]');
  WriteLn('     [-i] [-s] [-p <path>] [-t <path>] {<scripts>} [-a {<arguments>}]');
  WriteLn('');
  WriteLn('-d        - connection definition name');
  WriteLn('-u        - user name');
  WriteLn('-w        - password');
  WriteLn('-l        - login prompt');
  WriteLn('-p        - path to SQL script files');
  WriteLn('-t        - path to data files');
  WriteLn('-e        - stop script execution only after a "drop non-existing object" error');
  WriteLn('-i        - stop script execution after first error');
  WriteLn('-s        - do not show messages during SQL script execution (silent)');
  WriteLn('-a        - a list of script arguments');
  WriteLn('-? or -h  - show help');
  WriteLn('');
  WriteLn('Example: ScriptConsole -d Oracle_Demo -i -p x:\MyScripts s1.sql s2.sql');
  WriteLn('executes the s1.sql and s2.sql scripts from directory x:\MyScripts, using');
  WriteLn('the Oracle_Demo connection definition, does not stop on errors.');
end;

{-------------------------------------------------------------------------------}
function ProcessCommandLine: Boolean;
var
  s: String;
  i: Integer;
begin
  Result := False;
  i := 1;
  while i <= ParamCount do begin
    s := ParamStr(i);
    if (s[1] = '-') or (s[1] = '/') then begin
      s := UpperCase(Copy(s, 2, Length(s)));
      if s = 'D' then begin
        Inc(i);
        oConn.ConnectionDefName := FDExpandStr(ParamStr(i));
      end
      else if s = 'E' then
        oScript.ScriptOptions.DropNonexistObj := False
      else if s = 'I' then
        oScript.ScriptOptions.BreakOnError := True
      else if s = 'P' then begin
        Inc(i);
        oScript.ScriptOptions.DefaultScriptPath := FDExpandStr(ParamStr(i));
      end
      else if s = 'T' then begin
        Inc(i);
        oScript.ScriptOptions.DefaultDataPath := FDExpandStr(ParamStr(i));
      end
      else if s = 'S' then
        oScript.ScriptOptions.ConsoleOutput := False
      else if s = 'U' then begin
        Inc(i);
        oConn.ResultConnectionDef.Params.UserName := FDExpandStr(ParamStr(i));
      end
      else if s = 'W' then begin
        Inc(i);
        oConn.ResultConnectionDef.Params.Password := ParamStr(i);
      end
      else if s = 'L' then
        oConn.LoginPrompt := True
      else if s = 'A' then begin
        Inc(i);
        while i <= ParamCount do begin
          oScript.Arguments.Add(ParamStr(i));
          Inc(i);
        end;
      end
      else begin
        Result := False;
        Exit;
      end;
    end
    else begin
      Result := True;
      oScript.SQLScripts[0].SQL.Add('@' + s);
    end;
    Inc(i);
  end;
  if not Result then
    Help();
end;

{-------------------------------------------------------------------------------}
begin
  try
    oEnv := TFDConnEnv.Create;

    oConn := TFDConnection.Create(nil);
    oConn.ConnectionDefName := '';
    oConn.LoginPrompt := False;

    oScript := TFDScript.Create(nil);
    oScript.Connection := oConn;
    oScript.OnConsolePut := oEnv.DoConsolePut;
    oScript.OnPause := oEnv.DoPause;
    oScript.SQLScripts.Add;

    try
      if ProcessCommandLine() then begin
        oConn.Connected := True;
        if oConn.Connected then begin
          oScript.ExecuteAll;
          Writeln('Done.');
          if oScript.TotalErrors > 0 then
            ExitCode := 1;
        end;
      end
      else
        ExitCode := 1;
    finally
      oScript.Free;
      oConn.Free;
      oEnv.Free;
    end;
  except
    on E: Exception do begin
      Writeln('ERROR: ' + E.Message);
      ExitCode := 1;
    end;
  end;
end.
