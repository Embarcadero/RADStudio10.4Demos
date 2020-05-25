unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmMain = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblLBound: TLabel;
    lblHBound: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  FireDAC.Phys.PGCli;

(*
  PostgreSQL 9.2 introduces range types:
  http://www.postgresql.org/docs/9.2/static/rangetypes.html

  FireDAC represents a range type column as ftADT field with 3 subfields:
  * lbound - lower range bound. Field is of range base data type, eg ftInteger.
  * hbound - upper range bound. Field is of range base data type, eg ftInteger.
  * flags - range flags. See RANGE_* constants in FireDAC.Phys.PGCli.
  Columns of range type are read-only. To update them use SQL commands.

  To get a range column attributes use code like that:
  * FDQuery1.FieldByName('<range column name>.lbound').AsXxxx
  * FDQuery1.FieldByName('<range column name>.hbound').AsXxxx
  * FDQuery1.FieldByName('<range column name>.flags').AsInteger
  For example:

  var
    l: Integer;
  ...
    l := FDQuery1.FieldByName('rng.lbound').AsInteger;
*)

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FDQuery1.Active := True;
end;

procedure TFrmMain.DataSource1DataChange(Sender: TObject; Field: TField);
var
  iFlags: Integer;
  s: String;

  procedure Add(var AStr: String; const AItem: String);
  begin
    if AStr <> '' then
      AStr := AStr + ', ';
    AStr := AStr + AItem;
  end;

begin
  if Field = nil then begin
    iFlags := FDQuery1.FieldByName('rng.flags').AsInteger;

    s := '';
    if RANGE_EMPTY and iFlags <> 0 then
      Add(s, 'Empty');
    if RANGE_LB_INC and iFlags <> 0 then
      Add(s, 'Inclusive');
    if RANGE_LB_INF and iFlags <> 0 then
      Add(s, '-Infinity');
    if RANGE_LB_NULL and iFlags <> 0 then
      Add(s, 'Null');
    lblLBound.Caption := s;

    s := '';
    if RANGE_EMPTY and iFlags <> 0 then
      Add(s, 'Empty');
    if RANGE_UB_INC and iFlags <> 0 then
      Add(s, 'Inclusive');
    if RANGE_UB_INF and iFlags <> 0 then
      Add(s, 'Infinity');
    if RANGE_UB_NULL and iFlags <> 0 then
      Add(s, 'Null');
    lblHBound.Caption := s;
  end;
end;

end.
