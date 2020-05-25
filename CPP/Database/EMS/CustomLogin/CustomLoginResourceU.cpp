//---------------------------------------------------------------------------

// This software is Copyright (c) 2016 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
#pragma hdrstop

#include "CustomLoginResourceU.h"
#include <memory>
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------


void TCustomLoginResource::ValidateCredentials(const String domainName, const String userName, const String Password)
{
	void *lToken;
	if (LogonUserW(userName.c_str(), domainName.c_str(), Password.c_str(), LOGON32_LOGON_NETWORK_CLEARTEXT,
		LOGON32_PROVIDER_DEFAULT, &lToken))
	{
		CloseHandle(lToken);
	}
	else {
		unsigned long lError = GetLastError();
		EEMSHTTPError::RaiseUnauthorized("", SysErrorMessage(lError));
    }
}

void TCustomLoginResource::PostSignup(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	// Create in-process EMS API
	std::unique_ptr<TEMSInternalAPI> emsApi(new TEMSInternalAPI(AContext));
	// Extract credentials from request
	TJSONObject * lValue;
	String lUserName, lPassword;
	if(!(ARequest->Body->TryGetObject(lValue) &&
		(lValue->GetValue(TEMSInternalAPI_TJSONNames_UserName) != NULL) &&
		(lValue->GetValue(TEMSInternalAPI_TJSONNames_Password) !=NULL)))
	{
		AResponse->RaiseBadRequest("", "Missing credentials");
	}
	else {
        lUserName = lValue->Get(TEMSInternalAPI_TJSONNames_UserName)->JsonValue->Value();
		lPassword = lValue->Get(TEMSInternalAPI_TJSONNames_Password)->JsonValue->Value();
		ValidateCredentials(L"", lUserName, lPassword);
	}
	std::unique_ptr<TJSONObject> lUserFields(static_cast<TJSONObject*>(lValue->Clone()));
	// Remove metadata
	lUserFields->RemovePair(TEMSInternalAPI_TJSONNames_UserName);
	lUserFields->RemovePair(TEMSInternalAPI_TJSONNames_Password);
	// Add another field, for example
	lUserFields->AddPair("comment", "This user added by CustomResource.CustomSignupUser");
	_di_IEMSResourceResponseContent response = emsApi->SignupUser(lUserName, lPassword, lUserFields.get());
	if(response->TryGetObject(lValue)) {
        AResponse->Body->SetValue(lValue, false);
    }
}

void TCustomLoginResource::PostLogin(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	// Create in-process EMS API
	std::unique_ptr<TEMSInternalAPI> emsApi(new TEMSInternalAPI(AContext));
	// Extract credentials from request
	TJSONObject * lValue;
	String lUserName, lPassword;
	if(!(ARequest->Body->TryGetObject(lValue) &&
		(lValue->GetValue(TEMSInternalAPI_TJSONNames_UserName) != NULL) &&
		(lValue->GetValue(TEMSInternalAPI_TJSONNames_Password) !=NULL)))
	{
		AResponse->RaiseBadRequest("", "Missing credentials");
	}
	else {
		lUserName = lValue->Get(TEMSInternalAPI_TJSONNames_UserName)->JsonValue->Value();
		lPassword = lValue->Get(TEMSInternalAPI_TJSONNames_Password)->JsonValue->Value();
		ValidateCredentials("", lUserName, lPassword);
	}
	_di_IEMSResourceResponseContent lResponse = emsApi->LoginUser(lUserName, lPassword);
	if(lResponse->TryGetObject(lValue)) {
		AResponse->Body->SetValue(lValue, false);
	}
}


static void Register()
{
	std::auto_ptr<TEMSResourceAttributes> attributes(new TEMSResourceAttributes());
	attributes->ResourceName = "CustomLogin";
	attributes->ResourceSuffix["PostSignup"] = "signup";
	attributes->EndPointName["PostSignup"] = "CustomSignupUser";
	attributes->ResourceSuffix["PostLogin"] = "login";
	attributes->EndPointName["PostLogin"] = "CustomLoginUser";
	RegisterResource(__typeinfo(TCustomLoginResource), attributes.release());
}

#pragma startup Register 32


