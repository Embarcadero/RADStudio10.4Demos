//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program SimpleListView;

uses
  System.StartUpCopy,
  FMX.Forms,
  ListViewSimple in 'ListViewSimple.pas' {SimpleListViewDelete};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSimpleListViewDelete, SimpleListViewDelete);
  Application.Run;
end.
