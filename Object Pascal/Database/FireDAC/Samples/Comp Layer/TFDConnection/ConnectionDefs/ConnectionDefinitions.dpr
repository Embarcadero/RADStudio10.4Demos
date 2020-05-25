//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ConnectionDefinitions;

uses
  Forms,
  dmMainBase in '..\..\..\dmMainBase.pas' {dmlMainBase: TDataModule},
  dmMainComp in '..\..\dmMainComp.pas' {dmlMainComp: TDataModule},
  fMainBase in '..\..\..\fMainBase.pas' {frmMainBase},
  fConnectionDefinitions in 'fConnectionDefinitions.pas' {frmConnectionDefinitions},
  fConnProperties in 'fConnProperties.pas' {frmProperties: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmlMainComp, dmlMainComp);
  Application.CreateForm(TfrmConnectionDefinitions, frmConnectionDefinitions);
  Application.Run;
end.
