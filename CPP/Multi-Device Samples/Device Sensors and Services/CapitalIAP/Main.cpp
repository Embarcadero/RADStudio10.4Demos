//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"

TMainForm *MainForm;

const String EuropeID = _D("com.embarcadero.capitals.europe");
const String NoAdsID = _D("com.embarcadero.capitals.noads");
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::TakeAdvertFromMainForm(TCustomForm *Form)
{
	if(FBannerAd != NULL) {
        FBannerAd->Parent = Form;
    }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::PlaceAdvertOnMainForm()
{
	Log::d("Main form setting ad parent back to itself");
	if(FBannerAd != NULL) {
		FBannerAd->Parent = this;
    }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::InAppPurchaseOnSetupComplete(TObject *Sender)
{
	Log::d("TMainForm->InAppPurchaseOnSetupComplete");
	FInAppPurchase->QueryProducts();
	if(FInAppPurchase->IsProductPurchased(NoAdsID)) {
		DisablePurchaseUI(true);
	}
	else {
		Log::d("Create banner ad");
		FBannerAd = new TBannerAd(this);
		FBannerAd->Parent = this;
		// For Android set this ID that represents the AdMob Unit
		FBannerAd->AdUnitID = "";

		Log::d("Banner ad created");
		FBannerAd->Align = TAlignLayout::Bottom;
		FBannerAd->Hide();
		FBannerAd->OnDidLoad = &BannerAdDidLoad;
		FBannerAd->OnWillLoad = &BannerAdWillLoad;
		FBannerAd->OnDidFail = &BannerAdDidFail;
		FBannerAd->LoadAd();
		Log::d("Banner ad properties set");
		EnablePurchaseUI();
	}
	if(FInAppPurchase->IsProductPurchased(EuropeID)) {
		DisableEuropePurchaseUI(true);
	}
	else {
		EnableEuropePurchaseUI();
	}
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::DisableEuropePurchaseUI(bool BecauseOfPurchase)
{
	ConsumeListBoxItem->Enabled = true;
	EuropeListBoxItem->Enabled = false;
	EuropeListBoxItem->OnClick = nullptr;
	if(BecauseOfPurchase) {
		DisableAdsListBoxItem->Text = "Europe pack is now owned";
		ListBoxItem4->Visible = true;
	}
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::DisablePurchaseUI(bool BecauseOfPurchase)
{
	ConsumeListBoxItem->Enabled = true;
	DisableAdsListBoxItem->Enabled = false;
	DisableAdsListBoxItem->OnClick = nullptr;
	if (BecauseOfPurchase) {
		DisableAdsListBoxItem->Text = "In-App adverts are disabled";
	}
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::InAppPurchaseProductsRequestResponse(System::TObject* Sender,
	TIAPProductList* const Products, System::Classes::TStrings* const InvalidProductIDs)
{
	Log::d("TMainForm.InAppPurchaseProductsRequestResponse");
	for(int i = 0; i < Products->Count; i++) {
		TProduct * product = Products->Items[i];
		if(product->ProductID == NoAdsID) {
			FNoAdsProductIsValid = true;
		}
		if(product->ProductID == EuropeID) {
			FEuropeProductIsValid = true;
		}
	}
	if(!FNoAdsProductIsValid) {
		DisablePurchaseUI(false);
	}
	if(!FEuropeProductIsValid) {
		DisableEuropePurchaseUI(false);
    }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::InAppPurchaseError(System::TObject* Sender, TFailureKind ErrorKind,
	const System::UnicodeString ErrorMessage)
{
	Log::d("Purchasing error: " + ErrorMessage);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::InAppPurchasePurchaseCompleted(System::TObject* Sender,
	const System::UnicodeString ProductID, bool NewTransaction)
{
	Log::d("TMainForm.InAppPurchasePurchaseCompleted");
	if (ProductID == NoAdsID) {
		FBannerAd->Hide();
		FBannerAd->DisposeOf();
		FBannerAd = nullptr;
		DisablePurchaseUI(true);
	}
	if (ProductID == EuropeID) {
		DisableEuropePurchaseUI(true);
	}
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender)
{
	Log::d("Main form alive");
	FInAppPurchase = new TInAppPurchase(this);
    // Set the license Key for Android only
	// You can get this license from your Google Dev. Console.
	FInAppPurchase->ApplicationLicenseKey = "";
	FInAppPurchase->ProductIDs->Add(NoAdsID);
	FInAppPurchase->ProductIDs->Add(EuropeID);
	Log::d("Setting up IAP");
	FInAppPurchase->OnSetupComplete = &InAppPurchaseOnSetupComplete;
	FInAppPurchase->OnProductsRequestResponse = &InAppPurchaseProductsRequestResponse;
	FInAppPurchase->OnError = &InAppPurchaseError;
	FInAppPurchase->OnPurchaseCompleted = &InAppPurchasePurchaseCompleted;
	FInAppPurchase->SetupInAppPurchase();
	East = true;
	West = true;
	Central = true;
	CreateQuiz();
	CreateScore(QuizForm);
	CreateAnswer(QuizForm);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::FormActivate(TObject *Sender)
{
	Log::d("Main form active");
  	PlaceAdvertOnMainForm();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::FormDeactivate(TObject *Sender)
{
	Log::d("Main form inactive now");
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::bFiveQuestionClick(TObject *Sender)
{
	StartQuiz(5);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::bTenQuestionClick(TObject *Sender)
{
	StartQuiz(10);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::bTwentyQuestionClick(TObject *Sender)
{
	StartQuiz(20);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::PurchaseEurope()
{
    FInAppPurchase->PurchaseProduct(EuropeID);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::RestorePurchase()
{
	Log::d("Restoring purchases");
  	FInAppPurchase->RestorePurchasedProducts();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::EnableEuropePurchaseUI()
{
	EuropeListBoxItem->Enabled = true;
}
//---------------------------------------------------------------------------
void __fastcall  TMainForm::EnablePurchaseUI()
{
	DisableAdsListBoxItem->Enabled = true;
	RestoreAdsListBoxItem->Enabled = true;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::OptionsDone()
{
	if(West && !East && !Central) {
		bTwentyQuestion->Visible = false;
	}
	else if (!West && !East && Central) {
		bTwentyQuestion->Visible = false;
	}
	else {
		bTwentyQuestion->Visible = true;
    }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::DisableAdverts()
{
	FInAppPurchase->PurchaseProduct(NoAdsID);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::ConsumeProducts()
{
	TStringList * products = new TStringList();
	if (FInAppPurchase->IsProductPurchased(EuropeID)) {
		products->Add(EuropeID);
	}
	if (FInAppPurchase->IsProductPurchased(NoAdsID)) {
		products->Add(NoAdsID);
	}
	FInAppPurchase->ConsumeProducts(products);
	products->DisposeOf();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::BannerAdDidFail(TObject * Sender, const String Error)
{
	Log::d("TMainForm->BannerAdDidFail:%s", ARRAYOFCONST((Error)));
	static_cast<TBannerAd*>(Sender)->Hide();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::BannerAdDidLoad(TObject * Sender)
{
	Log::d("TMainForm.BannerAdDidLoad");
	static_cast<TBannerAd*>(Sender)->Show();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::BannerAdWillLoad(TObject * Sender)
{
	Log::d("TMainForm.BannerAdWillLoad");
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::OptionsMultiViewHidden(TObject *Sender)
{
	OptionsDone();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::OptionFormButton1Click(TObject *Sender)
{
	OptionsMultiView->HideMaster();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::OptionsListBoxItemClick(TCustomListBox * const Sender, TListBoxItem * const Item)
{
	if (Item == DisableAdsListBoxItem)
		DisableAdverts();
	if (Item == EuropeListBoxItem)
		PurchaseEurope();
	if (Item == ConsumeListBoxItem)
		ConsumeProducts();
	if (Item == RestoreAdsListBoxItem)
		RestorePurchase();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::CheckState()
{
	sCentral->HitTest = sEast->IsChecked || sWest->IsChecked || (sEurope->IsChecked && ListBoxItem4->Visible);
	sEast->HitTest = sCentral->IsChecked || sWest->IsChecked || (sEurope->IsChecked && ListBoxItem4->Visible);
	sWest->HitTest = sCentral->IsChecked || sEast->IsChecked || (sEurope->IsChecked && ListBoxItem4->Visible);
	sEurope->HitTest = sCentral->IsChecked || sEast->IsChecked || sWest->IsChecked;
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::sEastSwitch(TObject *Sender)
{
	East = sEast->IsChecked;
	CheckState();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::sCentralSwitch(TObject *Sender)
{
	Central = sCentral->IsChecked;
	CheckState();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::sWestSwitch(TObject *Sender)
{
	West = sWest->IsChecked;
	CheckState();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::sEuropeSwitch(TObject *Sender)
{
	Europe = sEurope->IsChecked;
	CheckState();
}
//---------------------------------------------------------------------------

