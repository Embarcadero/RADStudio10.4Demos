//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef FSharingComponentH
#define FSharingComponentH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.ShareContract.hpp>
#include <System.Win.ShareContract.hpp>
//---------------------------------------------------------------------------
//{$HPPEMIT 'using namespace Winapi::Applicationmodel::Datatransfer;'}
class TFormSharingComponent : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TMemo *Memo1;
	TImageList *ImageList1;
	TButton *ButtonShare;
	TLabel *Label1;
	TEdit *EditShareText;
	TLabel *Label2;
	TEdit *EditApplicationName;
	TLabel *Label3;
	TEdit *EditDescription;
	TLabel *Label4;
	TEdit *EditPackageName;
	TLabel *Label5;
	TEdit *EditWebAddress;
	TLabel *Label6;
	TEdit *EditContentSourceWebLink;
	TLabel *Label7;
	TEdit *EditContentSourceApplicationLink;
	TLabel *Label8;
	TEdit *EditDataTitle;
	TSharingContract *SharingContract;
	void __fastcall ButtonShareClick(TObject *Sender);
	void __fastcall SharingContractTransferImage(TObject * const Sender, IDataProviderRequest * const ARequest);
	void __fastcall SharingContractAppChosen(TObject * const Sender, IDataTransferManager * const AManager,
		ITargetApplicationChosenEventArgs * const Args);

private:	// User declarations
public:		// User declarations
	__fastcall TFormSharingComponent(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormSharingComponent *FormSharingComponent;
//---------------------------------------------------------------------------
#endif
