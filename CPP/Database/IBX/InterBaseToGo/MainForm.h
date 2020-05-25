//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef MainFormH
#define MainFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.Bind.DBXScope.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.Grid.hpp>
#include <Data.DB.hpp>
#include <Data.DBXInterbase.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <DataSnap.DBClient.hpp>
#include <Fmx.Bind.DBEngExt.hpp>
#include <Fmx.Bind.Editors.hpp>
#include <Fmx.Bind.Grid.hpp>
#include <Fmx.Bind.Navigator.hpp>
#include <FMX.Grid.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.Types.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.Rtti.hpp>
#include <FMX.StdCtrls.hpp>
#include <IBX.IBCustomDataSet.hpp>
#include <IBX.IBDatabase.hpp>
#include <Data.Bind.ObjectScope.hpp>
#include <Data.Bind.Controls.hpp>
#include <FMX.Memo.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.ScrollBox.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TCheckBox *CheckBox1;
	TIBDatabase *IBDatabase1;
	TIBTransaction *IBTransaction1;
	TStringGrid *StringGridBindSourceDB1;
	TBindNavigator *NavigatorBindSourceDB1;
	TStringGrid *StringGridBindSourceDB2;
	TBindNavigator *NavigatorBindSourceDB2;
	TIBDataSet *IBDataSet1;
	TIBDataSet *IBDataSet2;
	TBindSourceDB *BindSourceDB1;
	TBindingsList *BindingsList1;
	TLinkGridToDataSource *LinkGridToDataSourceBindSourceDB1;
	TBindSourceDB *BindSourceDB2;
	TLinkGridToDataSource *LinkGridToDataSourceBindSourceDB2;
	TMemo *MeLog;
	void __fastcall CheckBox1Change(TObject *Sender);
	void __fastcall NavigatorBindSourceDB1Click(TObject *Sender, TNavigateButton Button);



private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
