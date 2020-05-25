//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fTransactions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, Buttons, StdCtrls, ExtCtrls, ComCtrls,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmTransactions = class(TfrmMainCompBase)
    FDQuery1: TFDQuery;
    lblPInfo: TLabel;
    mmInfo: TMemo;
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransactions: TfrmTransactions;

implementation

uses
  dmMainComp;

{$R *.dfm}
{ ---------------------------------------------------------------------------- }
procedure TfrmTransactions.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  mmInfo.Lines.Add('Set up trans isolation level...');
  with dmlMainComp.dbMain do begin
    TxOptions.Isolation := xiReadCommitted;
    mmInfo.Lines.Add('  Isolation Level = ReadCommitted');

    mmInfo.Lines.Add(' ');
    mmInfo.Lines.Add('Turn off auto commit mode');
    TxOptions.AutoCommit := False;

    mmInfo.Lines.Add(' ');
    mmInfo.Lines.Add('Start first transaction...');
    StartTransaction;
    try
      mmInfo.Lines.Add('  Execute simple command inside transaction');
      FDQuery1.SQL.Text := 'select * from {id Categories}';
      FDQuery1.Open;
      mmInfo.Lines.Add('  Commit transaction');
      Commit;
    except
      mmInfo.Lines.Add('  Rollback transaction');
      Rollback;
      raise;
    end;

    mmInfo.Lines.Add(' ');
    mmInfo.Lines.Add('Start second transaction...');
    StartTransaction;
    try
      mmInfo.Lines.Add('  Execute simple command during transaction, provoke an error');
      // Now we specially provoke an error to Rollback our transaction and insert into
      // integer field a string value
      FDQuery1.SQL.Text := 'insert into {id Categories}(CategoryID) values(''Provocation'')';
      FDQuery1.ExecSQL;
      mmInfo.Lines.Add('  Commit transaction');
      Commit;
    except
      mmInfo.Lines.Add('  Rollback transaction');
      // During FDQuery1.ExecSQL it's raised an exception and transaction now rollbacking
      Rollback;
      raise;
    end;
  end;
end;

end.
