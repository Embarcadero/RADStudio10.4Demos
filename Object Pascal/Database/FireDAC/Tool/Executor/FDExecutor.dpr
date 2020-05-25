//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program FDExecutor;
{$APPTYPE CONSOLE}

uses
  SysUtils,
  {$I ..\TOOLDBs.inc}
  FireDAC.Stan.Intf, FireDAC.Stan.Util, FireDAC.Stan.Consts,
  FireDAC.UI.Intf, FireDAC.ConsoleUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.ScriptCommands;

{$I ..\FireDAC.inc}
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
procedure ShowHelp;
begin
  WriteLn(C_FD_ProductFull + ' v ' + C_FD_Version);
  WriteLn(C_FD_Copyright);
  WriteLn('');
  WriteLn('Use: FDExecutor [-d <name>] [-n <file name>] [-u <user>] [-w <pwd>] [-l] [-e]');
  WriteLn('             [-i] [-s] [-p <path>] [-t <path>] [{<scripts>}] [-a {<arguments>}]');
  WriteLn('');
  WriteLn('-d        - connection definition name');
  WriteLn('-n        - connection definitions file name');
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
  WriteLn('When scripts are not specified, then FDExecutor will read standard input.');
  WriteLn('');
  WriteLn('Examples:');
  WriteLn('1. FDExecutor -d Oracle_Demo -i -p x:\MyScripts s1.sql s2.sql');
  WriteLn('Executes the s1.sql and s2.sql scripts from directory x:\MyScripts, using');
  WriteLn('the Oracle_Demo connection definition, does not stop on errors.');
  WriteLn('2. echo drop table mytab | FDExecutor -d MySQL_Demo');
  WriteLn('Executes the command captured from standard input.');
end;

{-------------------------------------------------------------------------------}
function ProcessCommandLine: Boolean;
var
  s: String;
  i: Integer;
begin
  if ParamCount = 0 then begin
    ShowHelp;
    Result := False;
    Exit;
  end;
  i := 1;
  while i <= ParamCount do begin
    s := ParamStr(i);
    if FDInSet(s[1], ['-', '/']) then begin
      s := UpperCase(Copy(s, 2, Length(s)));
      if s = 'D' then begin
        Inc(i);
        oConn.ConnectionDefName := FDExpandStr(ParamStr(i));
      end
      else if s = 'E' then
        oScript.ScriptOptions.DropNonexistObj := False
      else if s = 'I' then
        oScript.ScriptOptions.BreakOnError := True
      else if s = 'N' then begin
        Inc(i);
        FDManager.ConnectionDefFileName := FDExpandStr(ParamStr(i));
      end
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
        oConn.Params.UserName := FDExpandStr(ParamStr(i));
      end
      else if s = 'W' then begin
        Inc(i);
        oConn.Params.Password := ParamStr(i);
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
        ShowHelp;
        Result := False;
        Exit;
      end;
    end
    else
      oScript.SQLScripts[0].SQL.Add('@' + s);
    Inc(i);
  end;
  Result := True;
end;

{-------------------------------------------------------------------------------}
procedure CaptureConsoleInput;
var
  s: String;
begin
  Reset(Input);
  while not Eof(Input) do begin
    ReadLn(Input, s);
    oScript.SQLScripts[0].SQL.Add(s);
  end;
  Close(Input);
end;

{-------------------------------------------------------------------------------}
begin
  try
    oEnv := TFDConnEnv.Create;

    oScript := TFDScript.Create(nil);
    oScript.OnConsolePut := oEnv.DoConsolePut;
    oScript.OnPause := oEnv.DoPause;
    oScript.SQLScripts.Add;

    oConn := TFDConnection.Create(nil);
    oConn.ConnectionDefName := '';
    oConn.LoginPrompt := False;
    oScript.Connection := oConn;

    try
      if ProcessCommandLine() then begin
        if oScript.SQLScripts[0].SQL.Count = 0 then
          CaptureConsoleInput;
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
