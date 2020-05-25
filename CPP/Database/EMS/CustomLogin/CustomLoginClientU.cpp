//---------------------------------------------------------------------------

// This software is Copyright (c) 2016 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "CustomLoginClientU.h"
#include <REST.Json.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TEMSClientForm *EMSClientForm;
//---------------------------------------------------------------------------
__fastcall TEMSClientForm::TEMSClientForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionLoginExecute(TObject *Sender)
{
	BackendAuth1->Login();
	// Clear fields after successful login
	BackendAuth1->ClearFieldValues();
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionLoginUpdate(TObject *Sender)
{
	(static_cast<TAction*>(Sender))->Enabled = !BackendAuth1->LoggedIn;
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionLogoutExecute(TObject *Sender)
{
	BackendAuth1->Logout();
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionLogoutUpdate(TObject *Sender)
{
	(static_cast<TAction*>(Sender))->Enabled = BackendAuth1->LoggedIn;
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionSignupExecute(TObject *Sender)
{
  BackendAuth1->Signup();
  // Clear fields after successful login
  BackendAuth1->ClearFieldValues();
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionCurrentUserNameExecute(TObject *Sender)
{
	//
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionCurrentUserNameUpdate(TObject *Sender)
{
	String lText;
	if(BackendAuth1->LoggedInUserName != EmptyStr)
		lText = String().sprintf(L"UserName: %s", BackendAuth1->LoggedInUserName.c_str());
	else
		lText = "No current user";
	(static_cast<TAction*>(Sender))->Text = lText;
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionDeleteUserExecute(TObject *Sender)
{
	TEMSClientAPI * emsApi = (static_cast<_di_IGetEMSApi>(BackendAuth1->ProviderService))->EMSAPI;
	emsApi->DeleteUser(BackendAuth1->LoggedInValue.ObjectID);
	BackendAuth1->Logout();
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionDeleteUserUpdate(TObject *Sender)
{
	TAction* action = (static_cast<TAction*>(Sender));
	action->Enabled = BackendAuth1->LoggedIn;
	if(BackendAuth1->LoggedIn)
		action->Text = String().sprintf(L"Delete %s", BackendAuth1->LoggedInUserName.c_str());
	else
		action->Text = "Delete user";
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionRetrieveUserFieldsExecute(TObject *Sender)
{
	TEMSClientAPI::TUser lUser;
	// Extract underlying EMSAPI from backend component.
	TEMSClientAPI * emsApi = (static_cast<_di_IGetEMSApi>(BackendAuth1->ProviderService))->EMSAPI;
	std::unique_ptr<TJSONArray> jsonArray(new TJSONArray());
	if(emsApi->RetrieveCurrentUser(lUser, jsonArray.get()))
	{
		TJSONObject * jsonObj = (static_cast<TJSONObject*>(jsonArray->Get(0)));
		// Remove meta data fields
		jsonObj->RemovePair(TEMSClientAPI_TJSONNames_UserName);
		jsonObj->RemovePair(TEMSClientAPI_TJSONNames_MetaData);
		jsonObj->RemovePair(TEMSClientAPI_TJSONNames_UserID);
		MemoJSONUser->Text = Rest::Json::TJson::Format(jsonObj);
    }
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionRetrieveUserFieldsUpdate(TObject *Sender)
{
	(static_cast<TAction*>(Sender))->Enabled = BackendAuth1->LoggedIn;
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionUpdateUserFieldsExecute(TObject *Sender)
{
	TEMSClientAPI::TUpdatedAt lUpdated;
	TEMSClientAPI::TUser lUser;
	// Extract underlying EMSAPI from backend component.
	TEMSClientAPI * emsApi = (static_cast<_di_IGetEMSApi>(BackendAuth1->ProviderService))->EMSAPI;
	std::unique_ptr<TJSONObject> jsonObj((static_cast<TJSONObject*>(
		TJSONObject::ParseJSONValue(MemoJSONUser->Text))));
	if(jsonObj.get() == NULL){
		throw System::Sysutils::Exception("Not valid JSON");
	}
	emsApi->UpdateUser(BackendAuth1->LoggedInValue.ObjectID, jsonObj.get(), lUpdated);
}
//---------------------------------------------------------------------------

void __fastcall TEMSClientForm::ActionUpdateUserFieldsUpdate(TObject *Sender)
{
	  (static_cast<TAction*>(Sender))->Enabled = BackendAuth1->LoggedIn;
}
//---------------------------------------------------------------------------

void __fastcall TEMSClientForm::ActionUseCustomResourceExecute(TObject *Sender)
{
	if(EMSProvider1->LoginResource == EmptyStr)
		EMSProvider1->LoginResource = EditLoginResource->Text;
	else
		EMSProvider1->LoginResource = "";
}
//---------------------------------------------------------------------------
void __fastcall TEMSClientForm::ActionUseCustomResourceUpdate(TObject *Sender)
{
	(static_cast<TAction*>(Sender))->Checked = (EMSProvider1->LoginResource != EmptyStr);
	// Allow editing when not checked
	EditLoginResource->Enabled = !(static_cast<TAction*>(Sender))->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEMSClientForm::FormCreate(TObject *Sender)
{
	EditLoginResource->Text = EMSProvider1->LoginResource;
}
//---------------------------------------------------------------------------

