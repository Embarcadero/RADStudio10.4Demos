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

#include "FSharingComponent.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormSharingComponent *FormSharingComponent;
//---------------------------------------------------------------------------
__fastcall TFormSharingComponent::TFormSharingComponent(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormSharingComponent::ButtonShareClick(TObject *Sender)
{
  // Set the shared properties
  SharingContract->ApplicationName = EditApplicationName->Text;
  SharingContract->Description = EditDescription->Text;
  SharingContract->DataTitle = EditDataTitle->Text;
  SharingContract->DataText = EditShareText->Text;
  SharingContract->PackageName = EditPackageName->Text;
  SharingContract->ContentSourceApplicationLink = EditContentSourceApplicationLink->Text;
  SharingContract->ContentSourceWebLink = EditContentSourceWebLink->Text;

  SharingContract->IconFile  = L"Penguins.bmp";
  SharingContract->ImageFile = L"Penguins.jpg";
  SharingContract->LogoFile  = L"Penguins.bmp";

  SharingContract->RtfText = L"This is the RTF Text. Should be a large RTF text that is shared...";
  SharingContract->HTML = "<p>Here is our store logo: <img src='Penguins.bmp'>.</p>";

  SharingContract->WebAddress = EditWebAddress->Text;

  // Launch Sharing process-> Shows applications that can receive our shared information->
  SharingContract->InitSharing();

}
//---------------------------------------------------------------------------

void __fastcall TFormSharingComponent::SharingContractAppChosen(TObject * const Sender, IDataTransferManager * const AManager,
		  ITargetApplicationChosenEventArgs * const Args)
{
  // With this event we can know which application is going to receive our data.
  Memo1->Lines->Add("Application Chosen: " + TWindowsString::HStringToString(Args->ApplicationName));
}
//---------------------------------------------------------------------------

void __fastcall TFormSharingComponent::SharingContractTransferImage(TObject * const Sender,
	IDataProviderRequest * const ARequest)

{
  // We must provide the stream with the data, the source of the stream can be any we can imagine. Hence the event
  // to retrieve it.
  // For testing purposes we do the same that we do in the TShareContract class.
  ARequest->SetData(TShareContract::FileNameToStream(static_cast<TShareContract *>(Sender)->ImageFile));
}
//---------------------------------------------------------------------------

