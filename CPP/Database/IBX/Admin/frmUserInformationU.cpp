//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#include <signal.h>
#pragma hdrstop

#include "frmUserInformationU.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmUserInformation *frmUserInformation;

// ---------------------------------------------------------------------------
__fastcall TfrmUserInformation::TfrmUserInformation(TComponent* Owner)
	: TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TfrmUserInformation::OkExecute(TObject *Sender) {
	RetrieveInfo();
	SecurityService->Active = true;
	if (SecurityService->SecurityAction == ActionAddUser) {
		SecurityService->AddUser();
	}
	else {
		SecurityService->ModifyUser();
	}
	SecurityService->Active = false;
}

// ---------------------------------------------------------------------------
void __fastcall TfrmUserInformation::OkUpdate(TObject *Sender) {
	dynamic_cast<TAction*>(Sender)->Enabled =
		(edtPassword->Text == edtConfirmPassword->Text) &&
		(edtUser->Text != "");
}

void __fastcall TfrmUserInformation::RetrieveInfo(void) {
	if (edtPassword->Text != edtConfirmPassword->Text)
		throw new Exception("Passwords do not match");
	SecurityService->UserName = edtUser->Text;
	SecurityService->Password = edtPassword->Text;
	SecurityService->FirstName = edtFirstName->Text;
	SecurityService->MiddleName = edtMiddleName->Text;
	SecurityService->LastName = edtLastName->Text;

}

// ---------------------------------------------------------------------------
void __fastcall TfrmUserInformation::FormShow(TObject *Sender) {
	if (edtUser->Text == "") {
		edtUser->SetFocus();
	}
	else {
		edtPassword->SetFocus();
	}
}

void __fastcall TfrmUserInformation::DisplayUser(System::UnicodeString UserName)
{
	SecurityService->Active = true;
	if (UserName != "") {
		SecurityService->DisplayUser(UserName);
		edtUser->Text = SecurityService->UserInfo[0]->UserName;
		edtUser->ReadOnly = true;
		edtPassword->Text = "";
		edtConfirmPassword->Text = "";
		edtFirstName->Text = SecurityService->UserInfo[0]->FirstName;
		edtMiddleName->Text = SecurityService->UserInfo[0]->MiddleName;
		edtLastName->Text = SecurityService->UserInfo[0]->LastName;
		SecurityService->SecurityAction = ActionModifyUser;
	}
	else {
		edtUser->Text = "";
		edtUser->ReadOnly = false;
		edtPassword->Text = "";
		edtConfirmPassword->Text = "";
		edtFirstName->Text = "";
		edtMiddleName->Text = "";
		edtLastName->Text = "";
		SecurityService->SecurityAction = ActionAddUser;
	}
	SecurityService->Active = false;
}
// ---------------------------------------------------------------------------

