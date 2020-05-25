//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef ClientFormH
#define ClientFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <Data.DB.hpp>
#include <Data.DBXCommon.hpp>
#include <Data.DBXDataSnap.hpp>
#include <Data.SqlExpr.hpp>
#include <FMX.Types.hpp>
#include <IPPeerClient.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.DSConnect.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.Grid.hpp>
#include <Fmx.Bind.DBEngExt.hpp>
#include <Fmx.Bind.Editors.hpp>
#include <Fmx.Bind.Grid.hpp>
#include <Fmx.Bind.Navigator.hpp>
#include <FMX.Grid.hpp>
#include <FMX.Layouts.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.Rtti.hpp>
#include <Data.Bind.Controls.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Controls.Presentation.hpp>
//---------------------------------------------------------------------------
class TForm2 : public TForm
{
__published:	// IDE-managed Components
	TSQLConnection *SQLConnection1;
	TCheckBox *CheckBox1;
	TDSProviderConnection *CustDSProviderConnection;
	TClientDataSet *CustClientDataSet;
	Data::Db::TDataSource *CustDataSource;
	TDSProviderConnection *SalesDSProviderConnection;
	TClientDataSet *SalesClientDataSet;
	TBindingsList *BindingsList1;
	TBindSourceDB *BindSourceDB1;
	TGrid *GridBindSourceDB1;
	TLinkGridToDataSource *LinkGridToDataSource1;
	TBindNavigator *NavigatorBindSourceDB1;
	TBindSourceDB *BindSourceDB2;
	TGrid *GridBindSourceDB2;
	TLinkGridToDataSource *LinkGridToDataSource2;
	TBindNavigator *NavigatorBindSourceDB2;
	void __fastcall CheckBox1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm2(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm2 *Form2;
//---------------------------------------------------------------------------
#endif
