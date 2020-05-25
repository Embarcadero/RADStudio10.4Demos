//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef FShareContractFrameworkH
#define FShareContractFrameworkH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.ImgList.hpp>
#include <System.Win.ShareContract.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	TLabel *Label8;
	TButton *ButtonShare;
	TEdit *EditShareText;
	TEdit *EditApplicationName;
	TEdit *EditDescription;
	TEdit *EditPackageName;
	TEdit *EditWebAddress;
	TEdit *EditContentSourceWebLink;
	TEdit *EditContentSourceApplicationLink;
	TEdit *EditDataTitle;
	TMemo *Memo1;
	TImageList *ImageList1;
	void __fastcall ButtonShareClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
	TShareContract *FShareWrapper;
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
	void __fastcall ShareContractAppChosen(System::TObject* const Sender, const Winapi::Applicationmodel::Datatransfer::_di_IDataTransferManager AManager, const Winapi::Applicationmodel::Datatransfer::_di_ITargetApplicationChosenEventArgs Args);
	void __fastcall ShareContractTranferImage(System::TObject* const Sender, const Winapi::Applicationmodel::Datatransfer::_di_IDataProviderRequest ARequest);
//	void __fastcall ShareContractTranferImage(TObject * const Sender, IDataProviderRequest * const ARequest);
//	void __fastcall ShareContractAppChosen(TObject * const Sender, IDataTransferManager * const AManager,
//		ITargetApplicationChosenEventArgs * const Args);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
