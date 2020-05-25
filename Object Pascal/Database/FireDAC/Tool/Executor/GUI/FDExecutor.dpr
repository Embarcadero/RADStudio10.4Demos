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
  Forms,
  Windows,
  {$I ..\..\TOOLDBs.inc}
  FireDAC.Stan.Param, FireDAC.Stan.Intf, FireDAC.Stan.Util,
  FireDAC.UI.Intf, FireDAC.ConsoleUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.ScriptCommands,
  fGUIMain in 'fGUIMain.pas' {frmExecGUIMain};

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
  lForceGUI: Boolean;

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
function ProcessCommandLine: Boolean;
var
  s: String;
  i: Integer;
  sProd, sVer, sVerName, sCpr, sInfo: String;
begin
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
        oConn.ResultConnectionDef.Params.UserName := FDExpandStr(ParamStr(i));
      end
      else if s = 'W' then begin
        Inc(i);
        oConn.ResultConnectionDef.Params.Password := ParamStr(i);
      end
      else if s = 'L' then
        oConn.LoginPrompt := True
      else if s = 'G' then
        lForceGUI := True
      else if s = 'A' then begin
        Inc(i);
        while i <= ParamCount do begin
          oScript.Arguments.Add(ParamStr(i));
          Inc(i);
        end;
      end
      else begin
        FDGetVersionInfo(ParamStr(0), sProd, sVer, sVerName, sCpr, sInfo);
        WriteLn('');
        WriteLn(sProd + ' v ' + sVerName);
        WriteLn('Copyright ' + sCpr + ' (' + sInfo + ')');
        WriteLn('All Rights Reserved.');
        WriteLn('');
        WriteLn('Use: FDExecutor [-d <name>] [-n <file name>] [-u <user>] [-w <pwd>] [-l] [-e] [-g]');
        WriteLn('                [-i] [-s] [-p <path>] [-t <path>] {<scripts>} [-a {<arguments>}]');
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
        WriteLn('-g        - do not execute scripts, show GUI');
        WriteLn('-? or -h  - show help');
        WriteLn('');
        WriteLn('Example: FDExecutor -d Oracle_Demo -i -p x:\MyScripts s1.sql s2.sql');
        WriteLn('executes the s1.sql and s2.sql scripts from directory x:\MyScripts, using');
        WriteLn('the Oracle_Demo connection definition, does not stop on errors.');
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
begin
  lForceGUI := False;
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
      if ProcessCommandLine() then
        if lForceGUI or (oScript.SQLScripts[0].SQL.Count = 0) then begin
          FreeConsole;
          IsConsole := False;
          FFDGUIxSilentMode := False;
          Application.Initialize;
          Application.Title := 'FireDAC Executor';
          Application.CreateForm(TfrmExecGUIMain, frmExecGUIMain);
          frmExecGUIMain.SetScript(oScript);
          Application.Run;
        end
        else begin
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
      FreeAndNil(frmExecGUIMain);
      oScript.Free;
      oConn.Free;
      oEnv.Free;
    end;
  except
    on E: Exception do begin
      if IsConsole then
        Writeln('ERROR: ' + E.Message);
      ExitCode := 1;
    end;
  end;
end.
