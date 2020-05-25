//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef ClientModuleUH
#define ClientModuleUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.Comp.UI.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
//---------------------------------------------------------------------------
class TClientModule : public TDataModule
{
__published:	// IDE-managed Components
	TDataSource *dsOrders2;
	TFDMemTable *mtCustomers;
	TFDTableAdapter *taCustomers;
	TDataSource *dsCustomers2;
	TFDMemTable *mtOrders;
	TFDSchemaAdapter *FDSchemaAdapter2;
	TFDTableAdapter *taOrders;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
private:	// User declarations
public:		// User declarations
	__fastcall TClientModule(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TClientModule *ClientModule;
//---------------------------------------------------------------------------
#endif
