//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program BeaconDeviceDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  UBeaconDevDemo in 'UBeaconDevDemo.pas' {Form37};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm37, Form37);
  Application.Run;
end.
