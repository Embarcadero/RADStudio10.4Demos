
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
    DB, ExtCtrls, StdCtrls, Buttons, ComCtrls,
  fMainLayers,
  FireDAC.DatS, 
  FireDAC.Phys.Intf;

type
  TfrmPooling = class(TfrmMainLayers)
    Label1: TLabel;
    lblTotalExec: TLabel;
    Label2: TLabel;
    lblTotalTime: TLabel;
    cbPooled: TCheckBox;
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
  frmPooling: TfrmPooling;

implementation

{$R *.dfm}

type
  TConnectThread = class(TThread)
  private
    FForm: TfrmPooling;
  public
    constructor Create(AForm: TfrmPooling);
    procedure Execute; override;
  end;

constructor TConnectThread.Create(AForm: TfrmPooling);
begin
  FForm := AForm;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TConnectThread.Execute;
var
  i:      Integer;
  oTab:   TFDDatSTable;
  oConn:  IFDPhysConnection;
  oComm:  IFDPhysCommand;
  lClose: Boolean;
begin
  FDPhysManager.CreateConnection(FForm.cbDB.Text, oConn);
  oConn.CreateCommand(oComm);
  oTab := TFDDatSTable.Create;
  lClose := False;
  try
    for i := 1 to 50 do
      with oComm do begin
        if oConn.State = csDisconnected then begin
          lClose := True;
          oConn.Open;
        end;
        Prepare('select count(*) from {id Region}');
        Define(oTab);
        Open;
        if lClose then
          oConn.Close;
        Synchronize(FForm.Executed);
      end;
  finally
    oTab.Free;
  end;
end;

procedure TfrmPooling.Executed;
begin
  Inc(FCount);
  if (FCount mod 10) = 0 then
    lblTotalExec.Caption := IntToStr(FCount);
  if FCount = 500 then
    lblTotalTime.Caption := FloatToStr((GetTickCount - FStartTime) / 1000.0);
end;

procedure TfrmPooling.btnRunClick(Sender: TObject);
var
  i: Integer;
begin
  FDPhysManager.Close;
  while FDPhysManager.State <> dmsInactive do
    Sleep(0);
  FDPhysManager.Open;
  if cbPooled.Checked then begin
    FDPhysManager.ConnectionDefs.ConnectionDefByName(cbDB.Text).Params.Pooled := True;
    Console.Lines.Add('Run pooled...');
  end
  else begin
    FDPhysManager.ConnectionDefs.ConnectionDefByName(cbDB.Text).Params.Pooled := False;
    Console.Lines.Add('Run non pooled...');
  end;
  FStartTime := GetTickCount;
  FCount := 0;
  lblTotalExec.Caption := '---';
  lblTotalTime.Caption := '---';
  for i := 1 to 10 do
    TConnectThread.Create(Self);
end;

procedure TfrmPooling.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  FTxIntf := nil;
  FConnIntf := nil;

  cbPooled.Enabled := True;
  btnRun.Enabled := True;
end;

end.
