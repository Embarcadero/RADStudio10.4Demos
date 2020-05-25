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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, FireDAC.Comp.Client, ExtCtrls;

type
  TfrmDMLArrayTest = class(TForm)
    panTop: TPanel;
    lblDMLArraySize: TLabel;
    edtDMLArraySize: TEdit;
    lblNoOfRecords: TLabel;
    edtNoOfRecords: TEdit;
    lblHeader: TLabel;
    butDeleteAllRows: TButton;
    butRunSingleTest: TButton;
    memLog: TMemo;
    butRunArraySizeTest: TButton;
    cbUseTransactions: TCheckBox;
    procedure butRunSingleTestClick(Sender: TObject);
    procedure butDeleteAllRowsClick(Sender: TObject);
    procedure butRunArraySizeTestClick(Sender: TObject);
  private
    FADConnection: TFDConnection;
    FNoOfRecords: Integer;
    procedure PerformTest;
    procedure DeleteAllRows;
    procedure OpenConnection;
    procedure CloseConnection;
    procedure AddLog(AStr: string);
    function GetDMLArraySize: Integer;
    function GetNoOfRecords: Integer;
  public
    { Public declarations }
  end;

var
  frmDMLArrayTest: TfrmDMLArrayTest;

implementation


uses FireDAC.ConsoleUI.Wait, FireDAC.Stan.Def, FireDAC.DApt, FireDAC.Stan.Async,
  FireDAC.Phys.Oracle, FireDAC.Phys.MSSQL, FireDAC.Stan.Consts;

{$R *.dfm}

procedure TfrmDMLArrayTest.OpenConnection;
var
  cConDefName: string;
begin
  cConDefName := 'MyAnyDACTest';
  FDManager.Active := True;
  if FDManager.ConnectionDefs.FindConnectionDef(cConDefName) = nil then begin
    with FDManager.ConnectionDefs.AddConnectionDef do begin
      // This code works for ORACLE ... please change the parameters according to your environment.
      // See http://docwiki.embarcadero.com/RADStudio/XE6/en/Database_Connectivity_(FireDAC) for details.
      Name := cConDefName;
      Params.DriverID := S_FD_OraId;
      Params.Database := 'ora_920_app';
      Params.UserName := 'addemo';
      Params.Password := 'a';
    end;
  end;
  FADConnection := TFDConnection.Create(nil);
  FADConnection.ConnectionDefName := cConDefName;
  FADConnection.Connected := True;
end;

procedure TfrmDMLArrayTest.AddLog(AStr: string);
begin
  memLog.Lines.Add(AStr);
end;

procedure TfrmDMLArrayTest.CloseConnection;
begin
  FreeAndNil(FADConnection);
end;

function TfrmDMLArrayTest.GetDMLArraySize: Integer;
begin
  Result := StrToInt(edtDMLArraySize.Text);
end;

function TfrmDMLArrayTest.GetNoOfRecords: Integer;
begin
  Result := StrToInt(edtNoOfRecords.Text);
end;

procedure TfrmDMLArrayTest.butDeleteAllRowsClick(Sender: TObject);
begin
  OpenConnection;
  try
    DeleteAllRows;
  finally
    CloseConnection;
  end;
end;

procedure TfrmDMLArrayTest.butRunSingleTestClick(Sender: TObject);
var
  d1, d2: TDateTime;
begin
  FNoOfRecords := GetNoOfRecords;
  OpenConnection;
  try
    d1 := Now;
    PerformTest;
  finally
    CloseConnection;
  end;
  d2 := Now - d1;
  AddLog('DML Array Size: ' + IntToStr(GetDMLArraySize) + ' -> ' +
    TimeToStr(d2) + ' for ' + IntToStr(FNoOfRecords) + ' Recs -> ' +
    FloatToStr(FNoOfRecords / (d2 * 86400)) + ' per second');
end;

procedure TfrmDMLArrayTest.PerformTest;
var
  oADQuery: TFDQuery;
  iRecTest, iRecArray: Integer;
begin
  oADQuery := TFDQuery.Create(nil);
  try
    oADQuery.Connection := FADConnection;
    oADQuery.SQL.Text := 'insert into {id FDQA_Batch_test}(tint, tstring) values(:f1, :f2)';
    oADQuery.Params.ArraySize := GetDMLArraySize;
    // record index in the test
    iRecTest := 0;
    // record index in a current array
    iRecArray := 0;
    // define size of the parameter (in order that not a default size is assumed for the transport)
    oADQuery.Params[1].Size := 20;
    while iRecTest < FNoOfRecords do begin
      oADQuery.Params[0].AsIntegers[iRecArray] := iRecTest;
      oADQuery.Params[1].AsStrings[iRecArray] := 'Test' + IntToStr(iRecTest);
      inc(iRecTest);
      Inc(iRecArray);
      // execute the command for a next array
      if (iRecArray >= oADQuery.Params.ArraySize - 1) or (iRecTest = FNoOfRecords) then begin
        if (oADQuery.Params.ArraySize > 1) and cbUseTransactions.Checked then
          FADConnection.StartTransaction;
        try
          oADQuery.Execute(iRecArray);
        finally
          if (oADQuery.Params.ArraySize > 1) and cbUseTransactions.Checked then
            FADConnection.Commit;
        end;
        // reset the record index in an array to zero
        iRecArray := 0;
      end;
    end;
  finally
    oADQuery.Free;
  end;
end;

procedure TfrmDMLArrayTest.butRunArraySizeTestClick(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to 9 do begin
    butDeleteAllRowsClick(nil);
    case iLoop of
      0: edtDMLArraySize.Text := '1';
      1: edtDMLArraySize.Text := '2';
      2: edtDMLArraySize.Text := '5';
      3: edtDMLArraySize.Text := '10';
      4: edtDMLArraySize.Text := '50';
      5: edtDMLArraySize.Text := '100';
      6: edtDMLArraySize.Text := '500';
      7: edtDMLArraySize.Text := '1000';
      8: edtDMLArraySize.Text := '5000';
      9: edtDMLArraySize.Text := '10000';
    end;
    butRunSingleTestClick(nil);
  end;
end;

procedure TfrmDMLArrayTest.DeleteAllRows;
begin
  FADConnection.ExecSQL('delete from {id FDQA_Batch_test}');
  AddLog('all records deleted from the test table');
end;

end.
