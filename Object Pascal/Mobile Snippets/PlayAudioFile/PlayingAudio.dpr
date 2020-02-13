//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program PlayingAudio;

uses
  System.StartUpCopy,
  FMX.Forms,
  PlayAudioFile in 'PlayAudioFile.pas' {AudioPlayBackForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAudioPlayBackForm, AudioPlayBackForm);
  Application.Run;
end.
