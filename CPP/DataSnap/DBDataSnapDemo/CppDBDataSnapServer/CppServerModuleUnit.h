//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef CppServerModuleUnitH
#define CppServerModuleUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <DSServer.hpp>
#include <Data.DB.hpp>
#include <Data.DBXInterBase.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Datasnap.DSProviderDataModuleAdapter.hpp>
#include <Datasnap.Provider.hpp>
//---------------------------------------------------------------------------
class TDSServerModule1 : public TDSServerModule
{
__published:	// IDE-managed Components
	TSQLConnection *SQLConnection1;
	TSQLQuery *CustQuery;
	TDataSetProvider *CustDataSetProvider;
	TSQLQuery *SalesQuery;
	TDataSetProvider *SalesDataSetProvider;
private:	// User declarations
public:		// User declarations
	__fastcall TDSServerModule1(TComponent* Owner); 
};
//---------------------------------------------------------------------------
extern PACKAGE TDSServerModule1 *DSServerModule1;
//---------------------------------------------------------------------------
#endif

