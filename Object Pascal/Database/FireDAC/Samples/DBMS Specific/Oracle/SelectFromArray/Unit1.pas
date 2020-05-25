
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
    Dialogs, DB, Grids, DBGrids, StdCtrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Stan.Error, FireDAC.Stan.Param,
    FireDAC.Stan.ExprFuncs, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.DatS,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.Intf, FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleCli, FireDAC.Phys.OracleWrapper,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDConnection1: TFDConnection;
    FDStoredProc1: TFDStoredProc;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  FmtBCD;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  FDConnection1.Connected := True;

  try
    FDConnection1.ExecSQLScalar('select * from vc2_num_tab where 0=1');
  except
    on E: Exception do begin
      ShowMessage('Before running this demo, run script ' + ExtractFilePath(ParamStr(0)) + 'SelectFromArray.sql');
      Exit;
    end;
  end;

  FDConnection1.StartTransaction;
  FDStoredProc1.Close;
  with FDStoredProc1 do begin
    Params.ArraySize := Memo1.Lines.Count;
    for i := 0 to Memo1.Lines.Count - 1 do begin
      Params[0].AsStrings[i] := Memo1.Lines.Names[i];
      Params[1].AsFMTBCDs[i] := StrToBcd(Memo1.Lines.ValueFromIndex[i]);
    end;
    Open;
    FetchAll;
  end;
  FDConnection1.Commit;
end;

end.
