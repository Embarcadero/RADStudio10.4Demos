//---------------------------------------------------------------------------
// Copyright (c) 2016 Embarcadero Technologies, Inc. All rights reserved.  
//
// This software is the copyrighted property of Embarcadero Technologies, Inc. 
// ("Embarcadero") and its licensors. You may only use this software if you 
// are an authorized licensee of Delphi, C++Builder or RAD Studio 
// (the "Embarcadero Products").  This software is subject to Embarcadero's 
// standard software license and support agreement that accompanied your 
// purchase of the Embarcadero Products and is considered a Redistributable, 
// as such term is defined thereunder. Your use of this software constitutes 
// your acknowledgement of your agreement to the foregoing software license 
// and support agreement. 
//---------------------------------------------------------------------------
unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef;

type
  TFrmMain = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnOpen: TButton;
    btnWrite: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

(*
If you does not install FireDAC demo database on InterBase, then you should
install it or manually create the table below:

CREATE TABLE FDQA_Array (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(20),
  items VARCHAR(5)[4]
);

*)

procedure TFrmMain.btnOpenClick(Sender: TObject);
begin
  FDQuery1.Open('select * from FDQA_Array');
end;

procedure TFrmMain.btnWriteClick(Sender: TObject);
var
  i: Integer;
begin
  FDQuery1.Active := False;
  FDConnection1.ExecSQL('delete from FDQA_Array');

  FDQuery1.SQL.Text := 'insert into FDQA_Array values (:id, :name, :items)';
  // TFDParam.DataTypeName must be set to <Table name>.<Field name>
  FDQuery1.Params[2].DataTypeName := 'FDQA_ARRAY.ITEMS';
  // TFDParam.ArayType must be set to atTable, not to atArray
  FDQuery1.Params[2].ArrayType := atTable;
  // TFDParam.ArraySize must be set to array size
  FDQuery1.Params[2].ArraySize := 4;
  for i := 1 to 5 do begin
    FDQuery1.Params[0].AsInteger := i;
    FDQuery1.Params[1].AsString := 'aaa' + IntToStr(i);
    FDQuery1.Params[2].AsStrings[0] := 'A' + IntToStr(i) + '1';
    FDQuery1.Params[2].AsStrings[1] := 'A' + IntToStr(i) + '2';
    FDQuery1.Params[2].AsStrings[2] := 'A' + IntToStr(i) + '3';
    FDQuery1.Params[2].AsStrings[3] := 'A' + IntToStr(i) + '4';
    // Use ExecSQL, not Execute(4, 0) or something like that
    FDQuery1.ExecSQL;
  end;

  btnOpenClick(nil);
end;

end.
