//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fGUIMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ImgList, ComCtrls, ToolWin, ActnList, Menus,
  StrUtils, Variants, System.ImageList, System.Actions,
  FireDAC.Stan.Intf,
  FireDAC.Comp.Script, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.UI.Intf, FireDAC.VCLUI.Controls, FireDAC.VCLUI.Memo,
    FireDAC.VCLUI.Error, FireDAC.VCLUI.Login, FireDAC.VCLUI.Async,
    FireDAC.VCLUI.Wait, FireDAC.VCLUI.Script, FireDAC.Stan.Error;

type
  TfrmExecGUIMain = class(TForm)
    dlgOpen: TOpenDialog;
    ActionList1: TActionList;
    acOpenScript: TAction;
    acExit: TAction;
    acRun: TAction;
    acRunByStep: TAction;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Opensqlfile1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    acAbout: TAction;
    About1: TMenuItem;
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
    dlgSaveLog: TSaveDialog;
    acSaveLog: TAction;
    SaveLog1: TMenuItem;
    N2: TMenuItem;
    FDGUIxScriptDialog1: TFDGUIxScriptDialog;
    acSaveScriptAs: TAction;
    SaveScriptAs1: TMenuItem;
    acNewScript: TAction;
    NewScript1: TMenuItem;
    N3: TMenuItem;
    acHelp: TAction;
    Help2: TMenuItem;
    procedure cbConnDefChange(Sender: TObject);
    procedure acOpenScriptExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
    procedure acRunByStepExecute(Sender: TObject);
    procedure acAboutExecute(Sender: TObject);
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
    procedure acSaveLogUpdate(Sender: TObject);
    procedure acSaveLogExecute(Sender: TObject);
    procedure acSaveScriptAsUpdate(Sender: TObject);
    procedure acSaveScriptAsExecute(Sender: TObject);
    procedure acNewScriptExecute(Sender: TObject);
    procedure acHelpExecute(Sender: TObject);
    procedure mmLogDblClick(Sender: TObject);
  private
    FScript: TFDScript;
    FOriginalCaption: String;
    procedure DoBeforeExecute(Sender: TObject);
    procedure DoConsolePut(AEngine: TFDScript;
    const AMessage: String; AKind: TFDScriptOutputKind);
    procedure DoAfterExecute(Sender: TObject);
    procedure DoConnectionError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure DoPause(AEngine: TFDScript; const AText: String);
    procedure DoConsoleGet(AEngine: TFDScript; const APrompt: String;
      var AResult: String);
    procedure SetFileName(const AValue: String);
    procedure LoadFile(const AValue: String);
  public
    mmScript: TFDGUIxFormsMemo;
    procedure SetScript(AScript: TFDScript);
  end;

var
  frmExecGUIMain: TfrmExecGUIMain;

implementation

uses
  IniFiles,
  FireDAC.Stan.Consts, FireDAC.Stan.Util,
  FireDAC.VCLUI.About,
  FireDAC.Comp.ScriptCommands, Types;

{$R *.dfm}

{-------------------------------------------------------------------------------}
{ TfrmExecGUIMain                                                               }
{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.SetScript(AScript: TFDScript);
begin
  FScript := AScript;
  FScript.BeforeExecute := DoBeforeExecute;
  FScript.AfterExecute := DoAfterExecute;
  FScript.OnConsolePut := DoConsolePut;
  FScript.OnConsoleGet := DoConsoleGet;
  FScript.OnPause := DoPause;
  FScript.Connection.OnError := DoConnectionError;
  FScript.ScriptDialog := FDGUIxScriptDialog1;
  FScript.ScriptDialog.Options := FScript.ScriptDialog.Options - [ssConsole];

  if FScript.SQLScripts[0].SQL.Count > 0 then
    LoadFile(Trim(Copy(FScript.SQLScripts[0].SQL.Text, 2, 1000)));

  FDManager.GetConnectionNames(cbConnDef.Items);
  if FScript.Connection.ConnectionDefName <> '' then
    cbConnDef.ItemIndex := cbConnDef.Items.IndexOf(FScript.Connection.ConnectionDefName);
  if cbConnDef.ItemIndex >= 0 then
    cbConnDefChange(nil);

  DoBeforeExecute(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.DoBeforeExecute(Sender: TObject);
begin
  if mmScript.Modified then begin
    mmScript.Modified := False;
    FScript.SQLScripts[0].SQL := mmScript.Lines;
  end;
  FScript.Position := mmScript.CaretPos;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.DoAfterExecute(Sender: TObject);
begin
  sbMain.Panels[1].Text := 'Delimiter: ' + '[' +
    FScript.ScriptOptions.ActualCommandSeparator + ']';
  if not FScript.EOF then begin
    mmScript.CaretPos := FScript.Position;
    sbMain.Panels[2].Text := Format('Position: %d, %d',
      [FScript.Position.X, FScript.Position.Y]);
  end
  else begin
    mmScript.SelStart := mmScript.GetTextLen;
    sbMain.Panels[2].Text := 'Position: EOF';
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.DoConsolePut(AEngine: TFDScript;
  const AMessage: String; AKind: TFDScriptOutputKind);
begin
  { TODO : TMemo does not support Objects[] property }
  if AEngine.CurrentCommand <> nil then
    mmLog.Lines.AddObject(AMessage, TObject(AEngine.CurrentCommand.Position.Y))
  else
    mmLog.Lines.AddObject(AMessage, TObject(-1));
  Application.ProcessMessages;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.DoConsoleGet(AEngine: TFDScript;
  const APrompt: String; var AResult: String);
begin
  InputQuery('Enter value', APrompt, AResult);
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.DoPause(AEngine: TFDScript;
  const AText: String);
begin
  ShowMessage(AText + #13#10'Press OK to continue script execution');
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.DoConnectionError(ASender, AInitiator: TObject; 
  var AException: Exception);
begin
  if (AException is EFDException) and
     (EFDException(AException).FDCode = er_FD_ClntDbLoginAborted) then begin
    AException.Free;
    AException := EAbort.Create('');
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.FormCreate(Sender: TObject);
begin
  FOriginalCaption := Caption;
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
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.mmScriptKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DoBeforeExecute(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.mmScriptMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBeforeExecute(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.mmLogDblClick(Sender: TObject);
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
procedure TfrmExecGUIMain.cbConnDefChange(Sender: TObject);
var
  oMAIntf: IFDMoniAdapter;
  i: Integer;
  sName: String;
  vValue: Variant;
  eKind: TFDMoniAdapterItemKind;
begin
  try
    FScript.Connection.Connected := False;
    FScript.Connection.LoginPrompt := True;
    FScript.Connection.ConnectionDefName := cbConnDef.Text;
    FScript.Connection.Connected := True;
    if FScript.Connection.Connected then begin
      oMAIntf := FScript.Connection.ConnectionIntf as IFDMoniAdapter;
      mmLog.Lines.Add('Connection info:');
      for i := 0 to oMAIntf.ItemCount - 1 do begin
        oMAIntf.GetItem(i, sName, vValue, eKind);
        if eKind in [ikClientInfo, ikSessionInfo] then
          mmLog.Lines.Add(sName + ' = ' + VarToStr(vValue));
      end;
      mmLog.Lines.Add('');
      if Visible then
        mmScript.SetFocus;
      mmScript.RDBMSKind := FScript.Connection.RDBMSKind;
    end;
  finally
    if FScript.Connection.Connected then
      sbMain.Panels[0].Text := 'Connected to ' + cbConnDef.Text
    else begin
      sbMain.Panels[0].Text := 'Disconnected';
      mmLog.Lines.Add('Disconnected.');
    end;
  end;
  DoBeforeExecute(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acNewScriptExecute(Sender: TObject);
begin
  FScript.SQLScripts[0].Name := '';
  Caption := FOriginalCaption;
  mmScript.Lines.Clear;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.SetFileName(const AValue: String);
begin
  FScript.SQLScripts[0].Name := AValue;
  Caption := FOriginalCaption + ' - [' + AValue + ']';
  dlgOpen.FileName := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.LoadFile(const AValue: String);
begin
  SetFileName(AValue);
  mmScript.Lines.LoadFromFile(AValue);
  mmScript.SelStart := 0;
  mmScript.Modified := True;
  if Visible then
    mmScript.SetFocus;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acOpenScriptExecute(Sender: TObject);
begin
  if dlgOpen.Execute then
    LoadFile(dlgOpen.FileName);
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acSaveScriptUpdate(Sender: TObject);
begin
  acSaveScript.Enabled := mmScript.Lines.Count <> 0;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acSaveScriptExecute(Sender: TObject);
begin
  if dlgOpen.FileName <> '' then
    mmScript.Lines.SaveToFile(dlgOpen.FileName)
  else
    acSaveScriptAsExecute(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acSaveScriptAsUpdate(Sender: TObject);
begin
  acSaveScriptAs.Enabled := mmScript.Lines.Count <> 0;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acSaveScriptAsExecute(Sender: TObject);
begin
  dlgSaveScript.FileName := dlgOpen.FileName;
  if dlgSaveScript.Execute then begin
    SetFileName(dlgSaveScript.FileName);
    mmScript.Lines.SaveToFile(dlgSaveScript.FileName);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acSaveLogUpdate(Sender: TObject);
begin
  acSaveLog.Enabled := mmLog.Lines.Count <> 0;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acSaveLogExecute(Sender: TObject);
begin
  if dlgSaveLog.Execute then
    mmLog.Lines.SaveToFile(dlgSaveLog.FileName);
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acExitExecute(Sender: TObject);
begin
  Close;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acRunUpdate(Sender: TObject);
begin
  acRun.Enabled := FScript.Connection.Connected and not FScript.EOF;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acRunExecute(Sender: TObject);
begin
  mmScript.CaretPos := Point(0, 0);
  FScript.ValidateAll;
  if FScript.Status = ssFinishSuccess then begin
    FScript.ExecuteAll;
    if FScript.TotalErrors = 0 then
      sbMain.Panels[0].Text := 'Done.'
    else
      sbMain.Panels[0].Text := 'Done with errors.';
  end
  else
    sbMain.Panels[0].Text := 'Failed.'
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acRunByStepUpdate(Sender: TObject);
begin
  acRunByStep.Enabled := FScript.Connection.Connected and not FScript.EOF;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acRunByStepExecute(Sender: TObject);
var
  rPos: TPoint;
begin
  rPos := mmScript.CaretPos;
  FScript.ExecuteStep;
  if FScript.TotalErrors = 0 then
    sbMain.Panels[0].Text := 'Done.'
  else begin
    mmScript.CaretPos := rPos;
    sbMain.Panels[0].Text := 'Done with errors.';
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acSkipStepUpdate(Sender: TObject);
begin
  acSkipStep.Enabled := not FScript.EOF;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acSkipStepExecute(Sender: TObject);
begin
  FScript.ValidateStep;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acContinueOnErrorUpdate(Sender: TObject);
begin
  acContinueOnError.Checked := not FScript.ScriptOptions.BreakOnError;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acContinueOnErrorExecute(Sender: TObject);
begin
  FScript.ScriptOptions.BreakOnError := acContinueOnError.Checked;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acDropNonexistObjUpdate(Sender: TObject);
begin
  acDropNonexistObj.Checked := FScript.ScriptOptions.DropNonexistObj;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acDropNonexistObjExecute(Sender: TObject);
begin
  FScript.ScriptOptions.DropNonexistObj := not acDropNonexistObj.Checked;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acShowMessagesUpdate(Sender: TObject);
begin
  acShowMessages.Checked := FScript.ScriptOptions.ConsoleOutput;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acShowMessagesExecute(Sender: TObject);
begin
  FScript.ScriptOptions.ConsoleOutput := not acShowMessages.Checked;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acHelpExecute(Sender: TObject);
var
  oCmdClass: TFDScriptCommandClass;
  oCmd: TFDScriptCommand;
begin
  FDScriptCommandRegistry().LookupCommand('HELP', oCmdClass);
  if oCmdClass = nil then
    Exit;
  oCmd := oCmdClass.Create(nil, FScript);
  try
    oCmd.Execute;
  finally
    oCmd.Free;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmExecGUIMain.acAboutExecute(Sender: TObject);
begin
  TfrmFDGUIxFormsAbout.Execute;
end;

end.
