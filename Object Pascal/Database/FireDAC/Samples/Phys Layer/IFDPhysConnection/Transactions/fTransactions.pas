
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
    Dialogs, Menus, StdCtrls, ExtCtrls, DB, Buttons, ComCtrls,
  fMainLayers,
  FireDAC.Stan.Option, 
  FireDAC.Phys.Intf;

type
  TfrmTransactions = class(TfrmMainLayers)
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
    FCommIntf: IFDPhysCommand;
  public
    { Public declarations }
  end;

var
  frmTransactions: TfrmTransactions;

implementation

{$R *.dfm}

procedure TfrmTransactions.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  // Create command interface
  FConnIntf.CreateCommand(FCommIntf);

  Console.Lines.Add('Transaction isolation level is READ COMMITTED');
  // Set up trans isolation level
  FTxIntf.Options.Isolation := xiReadCommitted;

  Console.Lines.Add('Begin transaction');
  // Start transaction
  FTxIntf.StartTransaction;
  // Execute simple command during transaction
  try
    with FCommIntf do begin
      Prepare('delete from {id FDQA_TransTable}');
      Execute;
    end;

    Console.Lines.Add('Committing transaction');
    // Commit transaction
    FTxIntf.Commit;
  except
    Console.Lines.Add('Rollbacking transaction');
    // If exception - Rollback transaction
    FTxIntf.Rollback;
    raise;
  end;
end;

end.
