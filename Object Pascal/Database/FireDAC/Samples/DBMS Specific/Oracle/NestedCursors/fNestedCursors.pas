
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fNestedCursors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, Grids, DBGrids, StdCtrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Stan.Error, FireDAC.Stan.Param,
    FireDAC.Stan.ExprFuncs, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.DatS,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.Intf, FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleCli, FireDAC.Phys.OracleWrapper,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TfrmNestedCursors = class(TForm)
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDQuery1CRS: TDataSetField;
    FDMemTable1: TFDMemTable;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    btnOpenClose: TButton;
    btnPrepUnprep: TButton;
    Panel1: TPanel;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDQuery1CATEGORYID: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btnOpenCloseClick(Sender: TObject);
    procedure btnPrepUnprepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNestedCursors: TfrmNestedCursors;

implementation

{$R *.dfm}

procedure TfrmNestedCursors.FormCreate(Sender: TObject);
begin
  FDConnection1.Connected := True;
end;

procedure TfrmNestedCursors.btnOpenCloseClick(Sender: TObject);
begin
  FDQuery1.Active := not FDQuery1.Active;
end;

procedure TfrmNestedCursors.btnPrepUnprepClick(Sender: TObject);
begin
  FDQuery1.Prepared := not FDQuery1.Prepared;
end;

end.
