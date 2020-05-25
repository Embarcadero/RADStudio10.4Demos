//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ToggleSwitch;

uses
  Vcl.Forms,
  uToggleSwitch in 'uToggleSwitch.pas' {ToggleSwitchForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TToggleSwitch Demo';
  Application.CreateForm(TToggleSwitchForm, ToggleSwitchForm);
  Application.Run;
end.
