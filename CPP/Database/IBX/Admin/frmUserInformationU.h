//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef frmUserInformationUH
#define frmUserInformationUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
#include <IBX.IBServices.hpp>

//---------------------------------------------------------------------------
class TfrmUserInformation : public TForm
{
__published:	// IDE-managed Components
	TGroupBox *GroupBox1;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TEdit *edtConfirmPassword;
	TEdit *edtPassword;
	TEdit *edtUser;
	TGroupBox *GroupBox2;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TEdit *edtFirstName;
	TEdit *edtMiddleName;
	TEdit *edtLastName;
	TButton *btnOk;
	TButton *btnCancel;
	TActionList *ActionList1;
	TAction *Ok;
	void __fastcall OkExecute(TObject *Sender);
	void __fastcall OkUpdate(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
	Ibservices::TIBSecurityService* FIBSecurityService;
	void __fastcall RetrieveInfo(void);
public:		// User declarations
	void __fastcall DisplayUser(System::UnicodeString UserName);
	__fastcall TfrmUserInformation(TComponent* Owner);
	__property Ibservices::TIBSecurityService* SecurityService = {read=FIBSecurityService, write=FIBSecurityService};
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmUserInformation *frmUserInformation;
//---------------------------------------------------------------------------
#endif
