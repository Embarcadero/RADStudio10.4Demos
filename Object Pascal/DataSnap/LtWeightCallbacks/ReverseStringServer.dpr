//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program ReverseStringServer;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  ReverseStringServerMethods in 'ReverseStringServerMethods.pas',
  TransformStream in 'TransformStream.pas',
  ReverseStringServerContainer in 'ReverseStringServerContainer.pas';

begin
  try
    RunDSServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.




