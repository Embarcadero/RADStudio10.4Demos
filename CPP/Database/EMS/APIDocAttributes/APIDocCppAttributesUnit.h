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

#ifndef APIDocCppAttributesUnitH
#define APIDocCppAttributesUnitH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.SysUtils.hpp>
#include <EMS.Services.hpp>
#include <EMS.ResourceAPI.hpp>
#include <EMS.ResourceTypes.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.ConsoleUI.Wait.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.IB.hpp>
#include <FireDAC.Phys.IBDef.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.Comp.UI.hpp>
#include <FireDAC.Phys.IBBase.hpp>
#include <FireDAC.Stan.StorageJSON.hpp>

//---------------------------------------------------------------------------
#pragma explicit_rtti methods (public, __published)

class TSampleAttributesCppResource1 : public TDataModule
{
__published:
	TFDConnection *EmployeeConnection;
	TFDQuery *EmployeeTable;
	TFDSchemaAdapter *FDSchemaAdapterEmployees;
	TFDPhysIBDriverLink *FDPhysIBDriverLink1;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
	TFDStanStorageJSONLink *FDStanStorageJSONLink1;
	void __fastcall DataModuleCreate(TObject *Sender);
private:
public:
	__fastcall TSampleAttributesCppResource1(TComponent* Owner);
	void Get(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
	void GetItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
	void Post(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
	void PutItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
};
#endif


