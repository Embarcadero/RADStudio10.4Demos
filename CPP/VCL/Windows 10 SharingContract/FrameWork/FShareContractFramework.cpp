//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FShareContractFramework.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ShareContractAppChosen(System::TObject* const Sender,
	const Winapi::Applicationmodel::Datatransfer::_di_IDataTransferManager AManager,
	const Winapi::Applicationmodel::Datatransfer::_di_ITargetApplicationChosenEventArgs Args)
{
  // With this event we can know which application is going to receive our data.
  Memo1->Lines->Add("Application Chosen: " + TWindowsString::HStringToString(Args->ApplicationName));
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ShareContractTranferImage(System::TObject* const Sender,
	const Winapi::Applicationmodel::Datatransfer::_di_IDataProviderRequest ARequest)
{
  // We must provide the stream with the data, the source of the stream can be any we can imagine. Hence the event
  // to retrieve it.
  // For testing purposes we do the same that we do in the TShareContract class.
  ARequest->SetData(TShareContract::FileNameToStream(static_cast<TShareContract *>(Sender)->ImageFile));
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ButtonShareClick(TObject *Sender)
{
  // Set the shared properties
  FShareWrapper->ApplicationName = EditApplicationName->Text;
  FShareWrapper->Description = EditDescription->Text;
  FShareWrapper->DataTitle = EditDataTitle->Text;
  FShareWrapper->DataText = EditShareText->Text;
  FShareWrapper->PackageName = EditPackageName->Text;
  FShareWrapper->ContentSourceApplicationLink = EditContentSourceApplicationLink->Text;
  FShareWrapper->ContentSourceWebLink = EditContentSourceWebLink->Text;

  FShareWrapper->IconFile = "Penguins.bmp";
  FShareWrapper->ImageFile = "Penguins.jpg";
  FShareWrapper->LogoFile = "Penguins.bmp";

  FShareWrapper->RtfText = "This is the RTF Text. Should be a large RTF text that is shared...";
  FShareWrapper->HTML = "<p>Here is our store logo: <img src='Penguins.bmp'>.</p>";

  FShareWrapper->WebAddress = EditWebAddress->Text;

  // Launch Sharing process-> Shows applications that can receive our shared information->
  FShareWrapper->InitSharing();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  TShareContract::OnProcessMessages = Application->ProcessMessages;
  TShareContract::BasePath = ExtractFilePath(Application->ExeName);
  FShareWrapper = new TShareContract(this->Handle);
  FShareWrapper->OnAppChosen = this->ShareContractAppChosen;
  FShareWrapper->OnTransferImage = this->ShareContractTranferImage;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormDestroy(TObject *Sender)
{
	delete FShareWrapper;
}
//---------------------------------------------------------------------------

