//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
    StdCtrls, ExtCtrls, Buttons, ImgList, ComCtrls, ToolWin, ActnList, Menus,
    StrUtils, Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Stan.Pool,
    FireDAC.Stan.ExprFuncs,
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.ScriptCommands, FireDAC.Comp.UI,
  FireDAC.VCLUI.Controls, FireDAC.VCLUI.Memo, FireDAC.VCLUI.Error,
    FireDAC.VCLUI.Login, FireDAC.VCLUI.Async, FireDAC.VCLUI.Wait,
    FireDAC.VCLUI.Script, FireDAC.UI.Intf,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile, FireDAC.Moni.RemoteClient,
  FireDAC.Phys.Intf, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.PG, FireDAC.Phys.IB, FireDAC.Phys.ASA,
    FireDAC.Phys.MySQL, FireDAC.Phys.MSAcc, FireDAC.Phys.ODBC, FireDAC.Phys.MSSQL, FireDAC.Phys.ODBCBase,
    FireDAC.Phys.DB2, FireDAC.Phys.Oracle, FireDAC.Phys.ADS, FireDAC.Phys.FB;

type
  TfrmMain = class(TForm)
    dlgOpen: TOpenDialog;
    ActionList1: TActionList;
    acOpenScript: TAction;
    acRun: TAction;
    acRunByStep: TAction;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Opensqlfile1: TMenuItem;
    Help1: TMenuItem;
    Run1: TMenuItem;
    Runscript1: TMenuItem;
    Runbystep1: TMenuItem;
    Options1: TMenuItem;
    mniContOnErrors: TMenuItem;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    acSkipStep: TAction;
    Dropoutcommand1: TMenuItem;
    mniShowMessages: TMenuItem;
    acContinueOnError: TAction;
    acShowMessages: TAction;
    dlgSaveScript: TSaveDialog;
    acSaveScript: TAction;
    SaveLogas1: TMenuItem;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    pnlMain: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    pnlInstructionName: TPanel;
    pnlTopFrame: TPanel;
    pnlToolbar: TPanel;
    ToolBar1: TToolBar;
    tbtOpen: TToolButton;
    ToolButton6: TToolButton;
    ToolButton2: TToolButton;
    tbtRun: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    lblTitle: TLabel;
    Panel5: TPanel;
    pnlTitleBottomLine: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Label2: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    mmLog: TMemo;
    sbMain: TStatusBar;
    Splitter1: TSplitter;
    ilMain: TImageList;
    ToolButton8: TToolButton;
    Panel1: TPanel;
    Label3: TLabel;
    cbConnDef: TComboBox;
    acDropNonexistObj: TAction;
    HideNoObjAtDropErrors1: TMenuItem;
    FDGUIxScriptDialog1: TFDGUIxScriptDialog;
    acSaveScriptAs: TAction;
    SaveScriptAs1: TMenuItem;
    acNewScript: TAction;
    NewScript1: TMenuItem;
    N3: TMenuItem;
    acHelp: TAction;
    Help2: TMenuItem;
    FDScript1: TFDScript;
    FDConnection1: TFDConnection;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDPhysDB2DriverLink1: TFDPhysDB2DriverLink;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDPhysODBCDriverLink1: TFDPhysODBCDriverLink;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDPhysASADriverLink1: TFDPhysASADriverLink;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    FDPhysADSDriverLink1: TFDPhysADSDriverLink;
    procedure cbConnDefChange(Sender: TObject);
    procedure acOpenScriptExecute(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
    procedure acRunByStepExecute(Sender: TObject);
    procedure acRunByStepUpdate(Sender: TObject);
    procedure acSkipStepExecute(Sender: TObject);
    procedure acContinueOnErrorExecute(Sender: TObject);
    procedure acShowMessagesExecute(Sender: TObject);
    procedure acSaveScriptExecute(Sender: TObject);
    procedure acSaveScriptUpdate(Sender: TObject);
    procedure acRunUpdate(Sender: TObject);
    procedure acSkipStepUpdate(Sender: TObject);
    procedure acContinueOnErrorUpdate(Sender: TObject);
    procedure acShowMessagesUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acDropNonexistObjUpdate(Sender: TObject);
    procedure acDropNonexistObjExecute(Sender: TObject);
    procedure mmScriptKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmScriptMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure acSaveScriptAsUpdate(Sender: TObject);
    procedure acSaveScriptAsExecute(Sender: TObject);
    procedure acNewScriptExecute(Sender: TObject);
    procedure acHelpExecute(Sender: TObject);
    procedure mmLogDblClick(Sender: TObject);
    // script handlers
    procedure DoBeforeExecute(Sender: TObject);
    procedure DoConsolePut(AEngine: TFDScript;
      const AMessage: String; AKind: TFDScriptOutputKind);
    procedure DoAfterExecute(Sender: TObject);
    procedure DoPause(AEngine: TFDScript; const AText: String);
    procedure DoConsoleGet(AEngine: TFDScript; const APrompt: String;
      var AResult: String);
  private
    procedure SetFileName(const AValue: String);
  public
    mmScript: TFDGUIxFormsMemo;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  mmScript := TFDGUIxFormsMemo.Create(Self);
  with mmScript do begin
    Parent := Panel5;
    Align := alClient;
    BevelInner := bvNone;
    BorderStyle := bsNone;
    Lines.Add('set cmdsep ;');
    Lines.Add('select * from {id Employees};');
    Lines.Add('select * from {id Categories}');
    ParentFont := False;
    ScrollBars := ssBoth;
    TabOrder := 0;
    WantTabs := True;
    OnKeyUp := mmScriptKeyUp;
    OnMouseUp := mmScriptMouseUp;
  end;
  mmScript.Modified := True;
  mmScript.SelStart := 0;
  FDManager.GetConnectionNames(cbConnDef.Items);
end;

{-------------------------------------------------------------------------------}
// Script event handlers

procedure TfrmMain.DoBeforeExecute(Sender: TObject);
begin
  if mmScript.Modified then begin
    mmScript.Modified := False;
    FDScript1.SQLScripts[0].SQL.Text := mmScript.Lines.Text;
  end;
  FDScript1.Position := mmScript.CaretPos;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.DoAfterExecute(Sender: TObject);
begin
  sbMain.Panels[1].Text := 'Delimiter: ' + '[' +
    FDScript1.ScriptOptions.ActualCommandSeparator + ']';
  if not FDScript1.EOF then begin
    mmScript.CaretPos := FDScript1.Position;
    sbMain.Panels[2].Text := Format('Position: %d, %d',
      [FDScript1.Position.X, FDScript1.Position.Y]);
  end
  else begin
    mmScript.SelStart := mmScript.GetTextLen;
    sbMain.Panels[2].Text := 'Position: EOF';
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.DoConsolePut(AEngine: TFDScript;
  const AMessage: String; AKind: TFDScriptOutputKind);
begin
  if AEngine.CurrentCommand <> nil then
    mmLog.Lines.AddObject(AMessage, TObject(AEngine.CurrentCommand.Position.Y))
  else
    mmLog.Lines.AddObject(AMessage, TObject(-1));
  Application.ProcessMessages;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.DoConsoleGet(AEngine: TFDScript;
  const APrompt: String; var AResult: String);
begin
  InputQuery('Enter value', APrompt, AResult);
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.DoPause(AEngine: TFDScript;
  const AText: String);
begin
  ShowMessage(AText + #13#10'Press OK to continue script execution');
end;

{-------------------------------------------------------------------------------}
// Editor event handlers

procedure TfrmMain.mmScriptKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DoBeforeExecute(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.mmScriptMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBeforeExecute(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.mmLogDblClick(Sender: TObject);
var
  i: Integer;
begin
  if (mmLog.CaretPos.Y >= 0) and (mmLog.CaretPos.Y < mmLog.Lines.Count) then begin
    i := LongWord(mmLog.Lines.Objects[mmLog.CaretPos.Y]);
    if i >= 0 then
      mmScript.CaretPos := Point(0, i);
  end;
end;

{-------------------------------------------------------------------------------}
// Connection combobox

procedure TfrmMain.cbConnDefChange(Sender: TObject);
begin
  try
    FDConnection1.Connected := False;
    FDConnection1.ConnectionDefName := cbConnDef.Text;
    FDConnection1.Connected := True;
    FDConnection1.GetInfoReport(mmLog.Lines);
    mmScript.RDBMSKind := FDConnection1.RDBMSKind;
    mmScript.SetFocus;
  finally
    if FDConnection1.Connected then
      sbMain.Panels[0].Text := 'Connected to ' + cbConnDef.Text
    else begin
      sbMain.Panels[0].Text := 'Disconnected';
      mmLog.Lines.Add('Disconnected.');
    end;
  end;
  DoBeforeExecute(nil);
end;

{-------------------------------------------------------------------------------}
// Actions - File

procedure TfrmMain.SetFileName(const AValue: String);
begin
  FDScript1.SQLScripts[0].Name := AValue;
  Caption := 'FDScript - [' + AValue + ']';
  dlgOpen.FileName := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acNewScriptExecute(Sender: TObject);
begin
  FDScript1.SQLScripts[0].Name := '';
  Caption := 'FDScript - [new]';
  mmScript.Lines.Clear;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acOpenScriptExecute(Sender: TObject);
begin
  if dlgOpen.Execute then begin
    SetFileName(dlgOpen.FileName);
    mmScript.Lines.LoadFromFile(dlgOpen.FileName);
    mmScript.SelStart := 0;
    mmScript.Modified := True;
    if Visible then
      mmScript.SetFocus;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acSaveScriptUpdate(Sender: TObject);
begin
  acSaveScript.Enabled := mmScript.Lines.Count <> 0;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acSaveScriptExecute(Sender: TObject);
begin
  if dlgOpen.FileName <> '' then
    mmScript.Lines.SaveToFile(dlgOpen.FileName)
  else
    acSaveScriptAsExecute(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acSaveScriptAsUpdate(Sender: TObject);
begin
  acSaveScriptAs.Enabled := mmScript.Lines.Count <> 0;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acSaveScriptAsExecute(Sender: TObject);
begin
  dlgSaveScript.FileName := dlgOpen.FileName;
  if dlgSaveScript.Execute then begin
    SetFileName(dlgSaveScript.FileName);
    mmScript.Lines.SaveToFile(dlgSaveScript.FileName);
  end;
end;

{-------------------------------------------------------------------------------}
// Actions - Run

procedure TfrmMain.acRunUpdate(Sender: TObject);
begin
  acRun.Enabled := FDConnection1.Connected and not FDScript1.EOF;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acRunExecute(Sender: TObject);
begin
  mmScript.CaretPos := Point(0, 0);
  FDScript1.ValidateAll;
  if FDScript1.Status = ssFinishSuccess then begin
    FDScript1.ExecuteAll;
    if FDScript1.TotalErrors = 0 then
      sbMain.Panels[0].Text := 'Done.'
    else
      sbMain.Panels[0].Text := 'Done with errors.';
  end
  else
    sbMain.Panels[0].Text := 'Failed.'
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acRunByStepUpdate(Sender: TObject);
begin
  acRunByStep.Enabled := FDConnection1.Connected and not FDScript1.EOF;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acRunByStepExecute(Sender: TObject);
var
  rPos: TPoint;
begin
  rPos := mmScript.CaretPos;
  FDScript1.ExecuteStep;
  if FDScript1.TotalErrors = 0 then
    sbMain.Panels[0].Text := 'Done.'
  else begin
    mmScript.CaretPos := rPos;
    sbMain.Panels[0].Text := 'Done with errors.';
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acSkipStepUpdate(Sender: TObject);
begin
  acSkipStep.Enabled := not FDScript1.EOF;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acSkipStepExecute(Sender: TObject);
begin
  FDScript1.ValidateStep;
end;

{-------------------------------------------------------------------------------}
// Actions - Options

procedure TfrmMain.acContinueOnErrorUpdate(Sender: TObject);
begin
  acContinueOnError.Checked := not FDScript1.ScriptOptions.BreakOnError;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acContinueOnErrorExecute(Sender: TObject);
begin
  FDScript1.ScriptOptions.BreakOnError := acContinueOnError.Checked;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acDropNonexistObjUpdate(Sender: TObject);
begin
  acDropNonexistObj.Checked := FDScript1.ScriptOptions.DropNonexistObj;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acDropNonexistObjExecute(Sender: TObject);
begin
  FDScript1.ScriptOptions.DropNonexistObj := not acDropNonexistObj.Checked;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acShowMessagesUpdate(Sender: TObject);
begin
  acShowMessages.Checked := FDScript1.ScriptOptions.ConsoleOutput;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.acShowMessagesExecute(Sender: TObject);
begin
  FDScript1.ScriptOptions.ConsoleOutput := not acShowMessages.Checked;
end;

{-------------------------------------------------------------------------------}
// Actions - Help

procedure TfrmMain.acHelpExecute(Sender: TObject);
var
  oCmdClass: TFDScriptCommandClass;
  oCmd: TFDScriptCommand;
begin
  FDScriptCommandRegistry().LookupCommand('HELP', oCmdClass);
  if oCmdClass = nil then
    Exit;
  oCmd := oCmdClass.Create(nil, FDScript1);
  try
    oCmd.Execute;
  finally
    oCmd.Free;
  end;
end;

end.
