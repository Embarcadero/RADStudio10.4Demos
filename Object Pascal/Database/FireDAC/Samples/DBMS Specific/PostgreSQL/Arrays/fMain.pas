unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TFrmMain = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnOpen: TButton;
    btnWrite: TButton;
    ComboBox1: TComboBox;
    procedure btnOpenClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
If you do not install FireDAC demo database on PostgreSQL, then you should
install it or manually create the table below:

CREATE TABLE FDQA_Array (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(20),
  items VARCHAR(5)[4]
);

Note, although above DDL specifies array size, it has no real effect. So,
the size is used only for documentation purposes. It is not stored in the
database dictionary and is not accessible as part of column metadata.
The ArrayScanSample connection definition parameter may be used to evaluate
the array size basing on the actual data stored in the array columns.
*)

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  ComboBox1Click(nil);
end;

procedure TFrmMain.ComboBox1Click(Sender: TObject);
begin
  FDConnection1.Connected := False;
  if ComboBox1.ItemIndex = 0 then
    // Array as ftArray -> set ArrayScanSample=N;M
    // Where:
    //  N - the number of records to analyze and evaluate maximum array size
    //  M - default array size, when there are no records or all array values
    //      are NULL's or of zero length
    FDConnection1.Params.Values['ArrayScanSample'] := '5;5'
  else
    // Array as ftDataSet -> remove ArrayScanSample ot set ArrayScanSample=0;0
    FDConnection1.Params.Values['ArrayScanSample'] := '0;0';
  FDConnection1.Connected := True;
end;

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
