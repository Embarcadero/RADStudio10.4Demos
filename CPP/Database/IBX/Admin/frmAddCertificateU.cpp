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

#include "frmAddCertificateU.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmAddCertificate *frmAddCertificate;

// ---------------------------------------------------------------------------
__fastcall TfrmAddCertificate::TfrmAddCertificate(TComponent* Owner)
	: TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAddCertificate::OKBtnClick(TObject *Sender) {

	LicensingService->ID = Trim(edID->Text);
	LicensingService->Key = Trim(edKey->Text);
	try {

		LicensingService->AddLicense();
		ModalResult = int(mbOK);
	}
	catch (Exception& E) {
		ShowMessage(
			"The certificate could not be validated based on the information given. Please recheck the id and key information.");
	}

}
// ---------------------------------------------------------------------------
