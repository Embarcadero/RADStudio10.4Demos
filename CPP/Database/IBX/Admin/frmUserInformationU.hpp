//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef FrmuserinformationuHPP
#define FrmuserinformationuHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <System.Actions.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ActnList.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <IBServices.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frmuserinformationu
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrmUserInformation;
class PASCALIMPLEMENTATION TfrmUserInformation : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TGroupBox* GroupBox1;
	Vcl::Stdctrls::TGroupBox* GroupBox2;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Stdctrls::TEdit* edtConfirmPassword;
	Vcl::Stdctrls::TEdit* edtPassword;
	Vcl::Stdctrls::TEdit* edtUser;
	Vcl::Stdctrls::TLabel* Label4;
	Vcl::Stdctrls::TEdit* edtFirstName;
	Vcl::Stdctrls::TLabel* Label5;
	Vcl::Stdctrls::TEdit* edtMiddleName;
	Vcl::Stdctrls::TLabel* Label6;
	Vcl::Stdctrls::TEdit* edtLastName;
	Vcl::Stdctrls::TButton* btnOk;
	Vcl::Stdctrls::TButton* btnCancel;
	Vcl::Actnlist::TActionList* ActionList1;
	Vcl::Actnlist::TAction* Ok;
	void __fastcall OkUpdate(System::TObject* Sender);
	void __fastcall OkExecute(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	
private:
	Ibservices::TIBSecurityService* FIBSecurityService;
	void __fastcall RetrieveInfo(void);
	
public:
	void __fastcall DisplayUser(System::UnicodeString UserName);
	__property Ibservices::TIBSecurityService* SecurityService = {read=FIBSecurityService, write=FIBSecurityService};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrmUserInformation(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmUserInformation(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmUserInformation(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrmUserInformation(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE TfrmUserInformation* frmUserInformation;
}	/* namespace Frmuserinformationu */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRMUSERINFORMATIONU)
using namespace Frmuserinformationu;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrmuserinformationuHPP
