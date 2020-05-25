//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program GdsDemo;

uses
  Forms,
  GdsStd in 'GdsStd.pas' {GDSStdForm},
  GdsData in 'GdsData.pas' {StdDataForm},
  RecForm in 'RecForm.pas' {RecViewForm},
  GridForm in 'GridForm.pas' {GridViewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TGridViewForm, GridViewForm);
  Application.CreateForm(TRecViewForm, RecViewForm);
  Application.Run;
end.
