
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
  FireDAC.DatS,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Stan.Error, FireDAC.Stan.Param,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.ExprFuncs,
  FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Phys.Intf, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteCli, FireDAC.Phys.SQLiteWrapper,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI;


type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    procedure DoAuthorize(ADB: TSQLiteDatabase; ACode: Integer; const AArg1,
      AArg2, AArg3, AArg4: String; var AResult: Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DoAuthorize(ADB: TSQLiteDatabase; ACode: Integer;
  const AArg1, AArg2, AArg3, AArg4: String; var AResult: Integer);
begin
  // See http://www.sqlite.org/c3ref/set_authorizer.html for
  // a detailed description of the arguments.

  Memo1.Lines.Add(Format('%d - %s - %s - %s - %s', [ACode, AArg1, AArg2, AArg3, AArg4]));

  // Deny any delete operation
  if ACode = SQLITE_DELETE then
    AResult := SQLITE_DENY
  else
    AResult := SQLITE_OK;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDConnection1.Connected := True;
  // Set a update callback after a connection is established.
  TSQLiteDatabase(FDConnection1.ConnectionIntf.CliObj).OnAutorize := DoAuthorize;

  FDQuery1.Open;
end;

end.
