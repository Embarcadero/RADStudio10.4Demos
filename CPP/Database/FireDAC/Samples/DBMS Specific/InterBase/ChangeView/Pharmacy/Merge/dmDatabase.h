//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef dmDatabaseH
#define dmDatabaseH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.Comp.UI.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.IB.hpp>
#include <FireDAC.Phys.IBBase.hpp>
#include <FireDAC.Phys.IBDef.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Phys.MSSQL.hpp>
#include <FireDAC.Phys.MSSQLDef.hpp>
#include <FireDAC.Phys.ODBCBase.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Login.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
//---------------------------------------------------------------------------
class TdtmdDatabase : public TDataModule
{
__published:	// IDE-managed Components
	TFDConnection *FDConnection;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
	TFDQuery *qryCategory;
	TFDQuery *qryMedicine;
	TFDQuery *qryMedicineCategories;
	TFDPhysIBDriverLink *FDPhysIBDriverLink1;
	TFDTransaction *FDTransaction1;
	TFDPhysMSSQLDriverLink *FDPhysMSSQLDriverLink1;
	TFDGUIxLoginDialog *FDGUIxLoginDialog1;
	void __fastcall FDConnectionAfterConnect(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TdtmdDatabase(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TdtmdDatabase *dtmdDatabase;
//---------------------------------------------------------------------------
#endif
