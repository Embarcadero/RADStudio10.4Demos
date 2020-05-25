//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop

#include "ResourceModuleU.h"
#include <memory>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TResourceModule::TResourceModule(TComponent* Owner)
	: TDataModule(Owner)
{
}

namespace Resourcemoduleu
{
	void __fastcall PACKAGE Register()
	{
		std::auto_ptr<TEMSResourceAttributes> attributes(new TEMSResourceAttributes());
		attributes->ResourceName = "test";
		attributes->ResourceSuffix["EMSDataSetResource1"] = "/";
		RegisterResource(__typeinfo(TResourceModule), attributes.release());
	}
}


