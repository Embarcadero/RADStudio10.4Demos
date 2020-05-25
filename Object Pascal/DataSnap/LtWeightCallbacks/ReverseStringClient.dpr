//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ReverseStringClient;

uses
  Forms,
  IPPeerClient,
  MainForm in 'MainForm.pas' {Form72},
  TransformStream in 'TransformStream.pas',
  ClientProxy in 'ClientProxy.pas',
  DSUtils in 'DSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
