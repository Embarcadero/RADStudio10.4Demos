
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
library Project2;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  FireDAC.Comp.Client,
  FireDAC.Stan.Factory,
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

procedure ShowData(ACliHandle: Pointer); stdcall;
begin
  TForm2.ShowData(ACliHandle);
end;

procedure Shutdown; stdcall;
var
  i: Integer;
begin
  for i := Application.ComponentCount - 1 downto 0 do
    if Application.Components[i] is TForm then
      Application.Components[i].Free;
  FDTerminate;
end;

exports
  ShowData,
  Shutdown;

begin
end.
