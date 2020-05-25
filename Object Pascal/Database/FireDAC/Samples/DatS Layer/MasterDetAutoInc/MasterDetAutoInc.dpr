
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
program MasterDetAutoInc;

uses
  Forms,
  fMasterDetails in 'fMasterDetails.pas' {frmMasterDetails},
  dmMainBase in '..\..\dmMainBase.pas' {dmlMainBase: TDataModule},
  fMainBase in '..\..\fMainBase.pas' {frmMainBase},
  fMainConnectionDefBase in '..\..\fMainConnectionDefBase.pas' {frmMainConnectionDefBase},
  fMainLayers in '..\..\fMainLayers.pas' {frmMainLayers},
  uDatSUtils in '..\..\uDatSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmlMainBase, dmlMainBase);
  Application.CreateForm(TfrmMasterDetails, frmMasterDetails);
  Application.Run;
end.
