//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ClientFormU.h"
#include "ClientModuleU.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TClientForm *ClientForm;
//---------------------------------------------------------------------------
__fastcall TClientForm::TClientForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TClientForm::ActionGetTablesExecute(TObject *Sender)
{
	 EMSFireDACClient1->GetData();
}
//---------------------------------------------------------------------------

void __fastcall TClientForm::ActionGetTablesUpdate(TObject *Sender)
{
	//
}
//---------------------------------------------------------------------------

void __fastcall TClientForm::ActionPostUpdatesExecute(TObject *Sender)
{
	EMSFireDACClient1->PostUpdates();
}
//---------------------------------------------------------------------------

void __fastcall TClientForm::ActionPostUpdatesUpdate(TObject *Sender)
{
	static_cast<TAction*>(Sender)->Enabled = EMSFireDACClient1->CanPostUpdates;
}
//---------------------------------------------------------------------------

