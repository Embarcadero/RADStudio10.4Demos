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

#include "formPharmacy.h"
#include "formPharmacyController.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "frameData"
#pragma resource "*.dfm"
TfrmPharmacy *frmPharmacy;
//---------------------------------------------------------------------------
__fastcall TfrmPharmacy::TfrmPharmacy(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmPharmacy::FormCreate(TObject *Sender)
{
	dtmdLocalDB = new TdtmdLocalDB(this);
  	Controller = new TdmPharmacyController(this, dtmdLocalDB);
}
//---------------------------------------------------------------------------

void __fastcall TfrmPharmacy::FormDestroy(TObject *Sender)
{
	if (dtmdLocalDB) {
	   delete dtmdLocalDB;
	   dtmdLocalDB = NULL;
	}

	if (Controller) {
	   delete Controller;
	   Controller = NULL;
	}
}
//---------------------------------------------------------------------------


