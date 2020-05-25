//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program EchoToChannelServerProject;

uses
  Forms,
  EchoToChanneServerForm in 'EchoToChanneServerForm.pas' {Form2},
  EchoToChannelServerMethodsUnit1 in 'EchoToChannelServerMethodsUnit1.pas',
  EchoToChannelServerContainerUnit3 in 'EchoToChannelServerContainerUnit3.pas' {ServerContainer3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TServerContainer3, ServerContainer3);
  Application.Run;
end.

