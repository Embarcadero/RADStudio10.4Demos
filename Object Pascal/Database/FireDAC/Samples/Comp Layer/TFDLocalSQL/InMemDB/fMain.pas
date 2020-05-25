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
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLite,
  FireDAC.Comp.UI, FireDAC.Comp.Client, FireDAC.Phys.SQLiteVDataSet, DB, FireDAC.Comp.DataSet,
  ComCtrls, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmMain = class(TForm)
    Brands: TFDMemTable;
    Models: TFDMemTable;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDLocalSQL1: TFDLocalSQL;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    DBNavigator3: TDBNavigator;
    DBGrid3: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  with Brands do begin
    with FieldDefs do begin
      Clear;
      Add('Code', ftInteger);
      Add('Name', ftString, 20);
    end;
    Active := True;
    AppendRecord([1, 'Audi']);
    AppendRecord([2, 'BMW']);
    AppendRecord([3, 'Mercedes']);
  end;

  with Models do begin
    with FieldDefs do begin
      Clear;
      Add('Brand', ftInteger);
      Add('Name', ftString, 20);
      Add('ModelYear', ftInteger);
      Add('Price', ftCurrency);
    end;
    Active := True;
    AppendRecord([1, 'A4', 2012, 40000]);
    AppendRecord([1, 'A6', 2012, 50000]);
    AppendRecord([1, 'Q7', 2012, 70000]);
    AppendRecord([2, '3', 2012, 40000]);
    AppendRecord([2, '5', 2012, 50000]);
    AppendRecord([2, 'X5', 2012, 70000]);
    AppendRecord([3, 'C', 2012, 40000]);
    AppendRecord([3, 'E', 2012, 50000]);
    AppendRecord([3, 'G', 2012, 70000]);
  end;
end;

procedure TfrmMain.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet3 then begin
    FDQuery1.Close;
    FDQuery1.Open();
  end;
end;

end.
