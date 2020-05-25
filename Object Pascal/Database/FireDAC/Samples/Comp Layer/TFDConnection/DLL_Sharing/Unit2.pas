//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Phys.Intf,
  FireDAC.DatS, FireDAC.Stan.Param, FireDAC.DApt.Intf, Grids, DBGrids, DB,
  FireDAC.Phys, FireDAC.Phys.MSAcc, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys.MSAccDef, FireDAC.DApt, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
  public
    class procedure ShowData(ACliHandle: Pointer);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

class procedure TForm2.ShowData(ACliHandle: Pointer);
var
  oForm: TForm2;
begin
  oForm := TForm2.Create(Application);
  oForm.FDConnection1.SharedCliHandle := ACliHandle;
  oForm.FDConnection1.Connected := True;
  oForm.FDQuery1.Active := True;
  oForm.Show;
end;

end.
