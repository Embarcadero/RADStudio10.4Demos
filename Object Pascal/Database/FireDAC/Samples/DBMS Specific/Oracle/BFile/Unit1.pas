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
  StdCtrls, DBCtrls, Grids, DBGrids, Mask, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBImage1: TDBImage;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DBEdit1: TDBEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure FDQuery1AfterOpen(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.Open;
end;

procedure TForm1.FDQuery1AfterOpen(DataSet: TDataSet);
begin
  // Specify Oracle directory name to F2 column
  FDQuery1.Table.Columns[1].SourceDirectory := 'ADDEMO_DIR';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  // To edit and assign a file name as a F2 column value:
  // 1) uncheck "Show image" to prevent exception from DBImage
  // 2) assign new value to DBEdit2 edit box
  // 3) post changes
  // 4) check "Show image" to enable image visualisation
  if CheckBox1.Checked then begin
    DBImage1.DataSource := DataSource1;
    DBEdit2.DataSource := nil;
  end
  else begin
    DBImage1.DataSource := nil;
    DBEdit2.DataSource := DataSource1;
  end;
end;

end.
