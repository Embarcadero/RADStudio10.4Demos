//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit30;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Def, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.DApt;

type
  TForm30 = class(TForm)
    FDMemTable1: TFDMemTable;
    FDTableAdapter1: TFDTableAdapter;
    FDCommand1: TFDCommand;
    FDConnection1: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

{$R *.dfm}

procedure TForm30.FormCreate(Sender: TObject);
begin
  FDCommand1.Params[0].AsInteger := 1;
  FDMemTable1.Open;
  FDMemTable1.FetchAll;

  FDCommand1.Close;
  FDCommand1.Params[0].AsInteger := 2;
  FDCommand1.Open;
  FDCommand1.Fetch(FDMemTable1.Table, True);

  FDCommand1.Close;
  FDCommand1.Params[0].AsInteger := 3;
  FDCommand1.Open;
  FDCommand1.Fetch(FDMemTable1.Table, True);
end;

end.
