//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program Transactions;

uses
  Forms,
  fTransactions in 'fTransactions.pas' {frmMain},
  dmMainBase in '..\..\..\dmMainBase.pas' {dmlMainBase: TDataModule},
  dmMainComp in '..\..\dmMainComp.pas' {dmMainComp: TdmlMainComp},
  fMainBase in '..\..\..\fMainBase.pas' {frmMainBase},
  fMainConnectionDefBase in '..\..\..\fMainConnectionDefBase.pas' {frmMainConnectionDefBase},
  fMainCompBase in '..\..\fMainCompBase.pas' {frmMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmlMainComp, dmlMainComp);
  Application.CreateForm(TfrmTransactions, frmTransactions);
  Application.Run;
end.
