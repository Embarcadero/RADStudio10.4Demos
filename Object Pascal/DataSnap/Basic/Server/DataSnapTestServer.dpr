//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program DataSnapTestServer;

uses
  Forms,
  SysUtils,
  ServerContainerForm in 'ServerContainerForm.pas' {Form8},
  MethodsServerModule in 'MethodsServerModule.pas' {ServerModule1: TDataModule},
  ParametersServerModule in 'ParametersServerModule.pas' {ParametersServerModule1: TDSServerModule},
  ProviderServerModule in 'ProviderServerModule.pas' {DSServerModule2: TDSServerModule},
  DataSnapTestData in '..\examples\DataSnapTestData.pas';

{$R *.res}

begin
  try
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TServerModule1, ServerModule1);
  Application.CreateForm(TParametersServerModule1, ParametersServerModule1);
  Application.CreateForm(TDSServerModule2, DSServerModule2);
  Application.Run;
    Form8.DSServer1.Stop;
  except on Ex: Exception do
    Application.ShowException(Ex);
  end;
end.
