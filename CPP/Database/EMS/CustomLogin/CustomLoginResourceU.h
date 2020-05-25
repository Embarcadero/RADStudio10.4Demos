//---------------------------------------------------------------------------

// This software is Copyright (c) 2016 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
// EMS Resource Modules
//---------------------------------------------------------------------------

#ifndef CustomLoginResourceUH
#define CustomLoginResourceUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.SysUtils.hpp>
#include <EMS.Services.hpp>
#include <EMS.ResourceAPI.hpp>
#include <EMS.ResourceTypes.hpp>
#include <WinApi.windows.hpp>
//---------------------------------------------------------------------------
#pragma explicit_rtti methods (public, private)
class TCustomLoginResource : public TObject
{
__published:
private:
	void ValidateCredentials(const String domainName, const String userName,
    	const String Password);
public:
	__fastcall ~TCustomLoginResource(){}
	void PostSignup(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
	void PostLogin(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
};
#endif


