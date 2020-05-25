//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Phys.Intf,
  FireDAC.DatS, FireDAC.Stan.Param, FireDAC.DApt.Intf, StdCtrls, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Button1: TButton;
    Button2: TButton;
    procedure FDQuery1Error(ASender, AInitiator: TObject; 
      var AException: Exception);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Error;

procedure TForm1.FDQuery1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  if AException is EFDDBArrayExecuteError then begin
    // Check EFDDBArrayExecuteError(AException).Exception for original
    // EFDDBEngineException exception object.

    // Fix bad value
    FDQuery1.Params[0].AsIntegers[EFDDBArrayExecuteError(AException).Offset] :=
      EFDDBArrayExecuteError(AException).Offset;

    // Ask to retry last operation
    EFDDBArrayExecuteError(AException).Action := eaRetry;
    // Possible values:
    // eaApplied - skip row, but add +1 to the number of updated records
    // eaSkip - just skip this row
    // eaRetry - retry this row
    // eaFail = eaDefault - just raise original exception
    // eaExitSuccess - exit from Execute
    // eaExitFailure - exit from Execute, and do something other
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  FDQuery1.SQL.Text := 'delete from batch_demo';
  FDQuery1.Params.ArraySize := 1;
  FDQuery1.ExecSQL;

  FDQuery1.SQL.Text := 'insert into batch_demo values (:id, :name)';
  FDQuery1.Params.ArraySize := 10;
  FDQuery1.OnError := FDQuery1Error;
  for i := 0 to FDQuery1.Params.ArraySize - 1 do begin
    if (i <> 0) and (i mod 3 = 0) then
      FDQuery1.Params[0].AsIntegers[i] := 1
    else
      FDQuery1.Params[0].AsIntegers[i] := i;
    FDQuery1.Params[1].AsStrings[i] := IntToStr(i);
  end;
  FDQuery1.Execute(FDQuery1.Params.ArraySize);
  ShowMessage('Update [' + InttoStr(FDQuery1.RowsAffected) + '] rows');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: Integer;
  iOffset, iTimes: Integer;
begin
  FDQuery1.SQL.Text := 'delete from batch_demo';
  FDQuery1.Params.ArraySize := 1;
  FDQuery1.ExecSQL;

  FDQuery1.SQL.Text := 'insert into batch_demo values (:id, :name)';
  FDQuery1.Params.ArraySize := 10;
  FDQuery1.OnError := nil;
  for i := 0 to FDQuery1.Params.ArraySize - 1 do begin
    if (i <> 0) and (i mod 3 = 0) then
      FDQuery1.Params[0].AsIntegers[i] := 1
    else
      FDQuery1.Params[0].AsIntegers[i] := i;
    FDQuery1.Params[1].AsStrings[i] := IntToStr(i);
  end;

  iTimes := FDQuery1.Params.ArraySize;
  iOffset := 0;
  while iOffset < iTimes do begin
    try
      FDQuery1.Execute(iTimes, iOffset);
      Inc(iOffset, FDQuery1.RowsAffected);
    except
      on E: EFDDBEngineException do begin
        // Fix bad value
        FDQuery1.Params[0].AsIntegers[E.Errors[0].RowIndex] := E.Errors[0].RowIndex;
        // Adjust the row index to start execution
        iOffset := E.Errors[0].RowIndex;
      end;
    end;
  end;

  ShowMessage('Update [' + InttoStr(iOffset) + '] rows');
end;

end.
