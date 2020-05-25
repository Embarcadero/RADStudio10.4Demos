//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fPooling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    DB, StdCtrls, ExtCtrls, Buttons, ComCtrls, 
  fMainCompBase, fMainConnectionDefBase,
  FireDAC.Comp.Client, 
  FireDAC.Phys.Intf;

type
  TfrmMain = class(TfrmMainCompBase)
    Label1: TLabel;
    lblTotalExec: TLabel;
    Label2: TLabel;
    lblTotalTime: TLabel;
    chPooled: TCheckBox;
    btnRun: TButton;
    procedure btnRunClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    FCount: Integer;
    FStartTime: LongWord;
  public
    procedure Executed;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

type
  TConnectThread = class(TThread)
  private
    FForm: TfrmMain;
  public
    constructor Create(AForm: TfrmMain);
    procedure Execute; override;
  end;

constructor TConnectThread.Create(AForm: TfrmMain);
begin
  FForm := AForm;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TConnectThread.Execute;
var
  oConn:  TFDConnection;
  oQuery: TFDQuery;
  i: Integer;
begin
  oConn  := TFDConnection.Create(nil);
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := oConn;
    oConn.ConnectionDefName := FForm.cbDB.Text;
    for i := 1 to 50 do begin
      oQuery.SQL.Text := 'select count(*) from {id Region}';
      oQuery.Open;
      oConn.Close;
      Synchronize(FForm.Executed);
    end;
  finally
    oConn.Free;
    oQuery.Free;
  end;
end;

procedure TfrmMain.Executed;
begin
  Inc(FCount);
  if (FCount mod 10) = 0 then
    lblTotalExec.Caption := IntToStr(FCount);
  if FCount = 500 then begin
    lblTotalTime.Caption := FloatToStr((GetTickCount - FStartTime) / 1000.0);
    btnRun.Enabled := True;
  end;
end;

procedure TfrmMain.btnRunClick(Sender: TObject);
var
  i: Integer;
begin
  btnRun.Enabled := False;
  FDManager.Close;
  while FDManager.State <> dmsInactive do
    Sleep(0);
  FDManager.Open;
  if chPooled.Checked then
    FDManager.ConnectionDefs.ConnectionDefByName(cbDB.Text).Params.Pooled := True
  else
    FDManager.ConnectionDefs.ConnectionDefByName(cbDB.Text).Params.Pooled := False;
  FStartTime := GetTickCount;
  FCount := 0;
  lblTotalExec.Caption := '---';
  lblTotalTime.Caption := '---';
  for i := 1 to 10 do
    TConnectThread.Create(Self);
end;

procedure TfrmMain.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  btnRun.Enabled := True;
end;

end.
