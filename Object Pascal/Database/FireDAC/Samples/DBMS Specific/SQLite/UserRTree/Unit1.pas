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
    Dialogs, DB, Grids, DBGrids, StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Stan.Error, FireDAC.Stan.Param,
    FireDAC.Stan.ExprFuncs, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.DatS,
  FireDAC.UI.Intf, FireDAC.Comp.UI, FireDAC.VCLUI.Wait,
  FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.Intf, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteCli, FireDAC.Phys.SQLiteWrapper, FireDAC.Phys.SQLiteDef,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDSQLiteRTree1: TFDSQLiteRTree;
    btnInit: TButton;
    btnOpen: TButton;
    procedure btnInitClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure FDSQLiteRTree1Calculate(ARTree: TSQLiteRTreeData; const AParams,
      AColumns: TSQLiteRTreeDoubleArray; var AResult: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// For details see: https://www.sqlite.org/rtree.html

procedure TForm1.FDSQLiteRTree1Calculate(ARTree: TSQLiteRTreeData;
  const AParams, AColumns: TSQLiteRTreeDoubleArray; var AResult: Boolean);
begin
  AResult := (AParams[0] >= 22.9);
end;

procedure TForm1.btnInitClick(Sender: TObject);
begin
  FDConnection1.ExecSQL('DROP TABLE demo_index', True);
  FDConnection1.ExecSQL('CREATE VIRTUAL TABLE demo_index USING rtree(id, minX, maxX, minY, maxY)');
  FDConnection1.ExecSQL('INSERT INTO demo_index VALUES(1, -80.7749, -80.7747, 35.3776, 35.3778)');
  FDConnection1.ExecSQL('INSERT INTO demo_index VALUES(2, -81.0, -79.6, 35.0, 36.2)');
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  FDSQLiteRTree1.Active := True;
  FDQuery1.Open('SELECT * FROM demo_index WHERE id MATCH RTreeCallback(45.3, 22.9, 5.0)');
end;

end.
