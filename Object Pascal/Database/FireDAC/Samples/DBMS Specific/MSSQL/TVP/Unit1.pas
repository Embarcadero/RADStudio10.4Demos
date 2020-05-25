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
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.ScriptCommands,
  FireDAC.Comp.Script, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Phys.MSSQLDef;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDStoredProc1: TFDStoredProc;
    btnSPAutoSetup: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnSPManualSetup: TButton;
    FDQuery2: TFDQuery;
    btnQryManualSetup: TButton;
    Memo1: TMemo;
    btnQryArrayDML: TButton;
    Bevel1: TBevel;
    btnQryRegular: TButton;
    procedure btnSPAutoSetupClick(Sender: TObject);
    procedure btnSPManualSetupClick(Sender: TObject);
    procedure btnQryManualSetupClick(Sender: TObject);
    procedure btnQryArrayDMLClick(Sender: TObject);
    procedure btnQryRegularClick(Sender: TObject);
  private
    FStart: LongWord;
    procedure Start;
    procedure Done(const AMode: String);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Note: SQL Server Native Client v 11 or higher has an issue which leads 
// to "Invalid string or buffer length" error on operations with TVP.
// Install and use SQL Server Native Client v 10. For that set the
// FDPhysMSSQLDriverLink1.ODBCDriver to "SQL Server Native Client 10.0".

{-------------------------------------------------------------------------------}
const
  C_Recs = 10000;

procedure TForm1.Start;
begin
  FDConnection1.Connected := False;
  FDConnection1.Connected := True;
  FDQuery2.ExecSQL('delete from TVPTab');
  FStart := GetTickCount();
end;

procedure TForm1.Done(const AMode: String);
begin
  Memo1.Lines.Add(AMode + ' = ' + FloatToStr((GetTickCount() - FStart) / 1000));
  FDQuery1.Close;
  FDQuery1.Open;
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnSPAutoSetupClick(Sender: TObject);
var
  i: Integer;
begin
  Start;

  FDStoredProc1.FetchOptions.Items := FDStoredProc1.FetchOptions.Items + [fiMeta];
  FDStoredProc1.StoredProcName := 'TVPProc';
  FDStoredProc1.Prepare;

  (FDStoredProc1.Params[1].AsDataSet as TFDMemTable).EmptyDataSet;
  for i := 1 to C_Recs do
    with FDStoredProc1.Params[1].AsDataSet do begin
      Append;
      Fields[0].AsInteger := i;
      Fields[1].AsString := 'str' + IntToStr(i * 10);
      Fields[2].AsDateTime := Date() + i;
      Fields[3].AsString := StringOfChar('x', 1000);
      Post;
    end;

  FDConnection1.StartTransaction;
  FDStoredProc1.Execute;
  FDConnection1.Commit;

  Done('TVP SP auto setup');
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnSPManualSetupClick(Sender: TObject);
var
  oDS: TFDMemTable;
  i: Integer;
begin
  Start;

  FDStoredProc1.FetchOptions.Items := FDStoredProc1.FetchOptions.Items - [fiMeta];
  FDStoredProc1.StoredProcName := 'TVPProc';
  FDStoredProc1.Params.Clear;
  FDStoredProc1.Params.Add('@RETURN_VALUE', ftInteger, -1, ptResult);

  oDS := TFDMemTable.Create(nil);
  oDS.FieldDefs.Add('Code', ftInteger);
  oDS.FieldDefs.Add('Name', ftString, 100);
  oDS.FieldDefs.Add('RegDate', ftTimeStamp);
  oDS.FieldDefs.Add('Notes', ftMemo);
  with FDStoredProc1.Params.Add('@Items', ftDataSet, -1, ptInput) do begin
    DataTypeName := 'TVPType';
    AsDataSet := oDS;
  end;
  FDStoredProc1.Prepare;

  (FDStoredProc1.Params[1].AsDataSet as TFDMemTable).EmptyDataSet;
  for i := 1 to C_Recs do
    with FDStoredProc1.Params[1].AsDataSet do begin
      Append;
      Fields[0].AsInteger := i;
      Fields[1].AsString := 'str' + IntToStr(i * 10);
      Fields[2].AsDateTime := Date() + i;
      Fields[3].AsString := StringOfChar('x', 1000);
      Post;
    end;

  FDConnection1.StartTransaction;
  FDStoredProc1.Execute;
  FDConnection1.Commit;

  Done('TVP SP manual setup');
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnQryManualSetupClick(Sender: TObject);
var
  oDS: TFDMemTable;
  i: Integer;
begin
  Start;

  FDQuery2.SQL.Text := 'insert into TVPTab (Code, Name, RegDate, Notes) ' +
    'select Code, Name, RegDate, Notes from :t';
  oDS := TFDMemTable.Create(nil);
  oDS.FieldDefs.Add('Code', ftInteger);
  oDS.FieldDefs.Add('Name', ftString, 100);
  oDS.FieldDefs.Add('RegDate', ftTimeStamp);
  oDS.FieldDefs.Add('Notes', ftMemo);
  with FDQuery2.Params[0] do begin
    DataTypeName := 'TVPType';
    AsDataSet := oDS;
  end;

  (FDQuery2.Params[0].AsDataSet as TFDMemTable).EmptyDataSet;
  for i := 1 to C_Recs do
    with FDQuery2.Params[0].AsDataSet do begin
      Append;
      Fields[0].AsInteger := i;
      Fields[1].AsString := 'str' + IntToStr(i * 10);
      Fields[2].AsDateTime := Now() + i;
      Fields[3].AsString := StringOfChar('x', 1000);
      Post;
    end;

  FDConnection1.StartTransaction;
  FDQuery2.Execute;
  FDConnection1.Commit;

  Done('TVP Qry manual setup');
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnQryArrayDMLClick(Sender: TObject);
var
  i: Integer;
begin
  Start;

  FDQuery2.SQL.Text := 'insert into TVPTab (Code, Name, RegDate, Notes) values (:code, :name, :regdate, :notes)';
  FDQuery2.Params.ArraySize := C_Recs;

  for i := 1 to C_Recs do
    with FDQuery2 do begin
      Params[0].AsIntegers[i - 1] := i;
      Params[1].AsStrings[i - 1] := 'str' + IntToStr(i * 10);
      Params[2].AsDateTimes[i - 1] := Now() + i;
      Params[3].AsStrings[i - 1] := StringOfChar('x', 1000);
    end;

  FDConnection1.StartTransaction;
  FDQuery2.Execute(C_Recs, 0) ;
  FDConnection1.Commit;

  Done('Array DML Qry');
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnQryRegularClick(Sender: TObject);
var
  i: Integer;
begin
  Start;

  FDQuery2.SQL.Text := 'insert into TVPTab (Code, Name, RegDate, Notes) values (:code, :name, :regdate, :notes)';

  FDConnection1.StartTransaction;
  for i := 1 to C_Recs do
    with FDQuery2 do begin
      Params[0].AsInteger := i;
      Params[1].AsString := 'str' + IntToStr(i * 10);
      Params[2].AsDateTime := Now() + i;
      Params[3].AsString := StringOfChar('x', 1000);
      ExecSQL;
    end;
  FDConnection1.Commit;

  Done('Regular Qry');
end;

end.
