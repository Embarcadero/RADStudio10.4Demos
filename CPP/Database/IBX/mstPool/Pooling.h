//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef PoolingH
#define PoolingH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <IBX.IBCustomDataSet.hpp>
#include <IBX.IBDatabase.hpp>
#include <IBX.IBQuery.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TCheckBox *MTSPooling;
	TButton *TestBtn;
	TEdit *StartTimeEdt;
	TEdit *EndTimeEdt;
	TEdit *ElpTimeEdt;
	TEdit *Count;
	TIBDatabase *Database1;
	TIBQuery *Query1;
	TIBTransaction *IBTransaction1;
	void __fastcall MTSPoolingClick(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall TestBtnClick(TObject *Sender);
	void __fastcall DoTest(void);
private:	// User declarations
	System::TDateTime dtStart;
	System::TDateTime dtEnd;
	System::TDateTime dtElp;
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
