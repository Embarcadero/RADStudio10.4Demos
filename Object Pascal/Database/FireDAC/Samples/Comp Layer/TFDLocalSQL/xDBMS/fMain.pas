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
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLite, FireDAC.Phys.MSAcc,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI, FireDAC.Comp.Client, FireDAC.Phys.SQLiteVDataSet,
  Data.DB, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Phys.MSAccDef,
  FireDAC.Phys.SQLiteDef;

type
  TfrmMain = class(TForm)
    cnSQLite: TFDConnection;
    qOrders: TFDQuery;
    cnMSAccess: TFDConnection;
    qDetails: TFDQuery;
    FDConnection1: TFDConnection;
    FDLocalSQL1: TFDLocalSQL;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  FDQuery1.Active := not FDQuery1.Active;
end;

end.
