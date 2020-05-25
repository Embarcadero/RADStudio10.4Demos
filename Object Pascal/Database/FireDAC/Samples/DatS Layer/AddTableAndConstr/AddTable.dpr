
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
program AddTable;

uses
  Forms,
  fAddTables in 'fAddTables.pas' {frmAddTables},
  fMainBase in '..\..\fMainBase.pas' {frmMainBase},
  fDatSLayerBase in '..\fDatSLayerBase.pas' {frmDatSLayerBase},
  uDatSUtils in '..\..\uDatSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAddTables, frmAddTables);
  Application.Run;
end.
