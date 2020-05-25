//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program Qry_CachedUpdates;

uses
  Forms,
  dmMainBase in '..\..\..\..\dmMainBase.pas' {dmlMainBase: TDataModule},
  dmMainComp in '..\..\..\dmMainComp.pas' {dmlMainComp: TdmlMainComp},
  fMainBase in '..\..\..\..\fMainBase.pas' {frmMainBase},
  fMainConnectionDefBase in '..\..\..\..\fMainConnectionDefBase.pas' {frmMainConnectionDefBase},
  fMainCompBase in '..\..\..\fMainCompBase.pas' {frmMainCompBase},
  fMainQueryBase in '..\..\fMainQueryBase.pas' {frmMainQueryBase},
  fCachedUpdates in 'fCachedUpdates.pas' {frmCachedUpdates};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmlMainComp, dmlMainComp);
  Application.CreateForm(TfrmCachedUpdates, frmCachedUpdates);
  Application.Run;
end.
