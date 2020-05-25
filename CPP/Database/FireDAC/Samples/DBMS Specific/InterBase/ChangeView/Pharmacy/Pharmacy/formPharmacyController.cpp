//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop

#include "formPharmacyController.h"
#include <VCL.Dialogs.hpp>
#include <System.IniFiles.hpp>
#include <System.IOUtils.hpp>
#include <memory>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TdmPharmacyController *dmPharmacyController;
//---------------------------------------------------------------------------
__fastcall TdmPharmacyController::TdmPharmacyController(TfrmPharmacy *AView,
	TdtmdLocalDB * ADataModel) : TDataModule(AView), FView(AView), FDataModel(ADataModel)
{
	// Setup the BindSources->
	FView->bsCategory->DataSource->DataSet = FDataModel->qryCategory;
	FView->bsMedicines->DataSource->DataSet = FDataModel->qryMedicines;
	FView->bsOrder->DataSource->DataSet = FDataModel->qryOrders;
	FView->bsPharmacy->DataSource->DataSet = FDataModel->qryPharmacy;
	FView->bsCustomer->DataSource->DataSet = FDataModel->qryCustomer;
	FView->gridOrders->DataSource = FDataModel->dsOrders;

	std::unique_ptr<TIniFile> Ini(new TIniFile(ExtractFilePath(ParamStr(0))+"PharmacyApp.Ini"));
	FDataModel->FDConnection->Params->Database = Ini->ReadString("Database", "Local","c:\\data\\pharmacy.ib");
	FView->edtCentralServer->Text = Ini->ReadString("Database", "Remote","127.0.0.1:c:\\data\\medicines.ib");

	FDataModel->FDConnection->Open();

	// Make the ini first time
	Ini->WriteString("Database", "Local",FDataModel->FDConnection->Params->Database);
	Ini->WriteString("Database", "Remote",FView->edtCentralServer->Text);

	FView->btnAddOrder->Action = actAddOrder;
	FView->btnWebdetailsLoad->OnClick = NavigateToMeds;
	FView->PageControl1->ActivePageIndex = 0;
	FView->PageControl2->ActivePageIndex = 0;

	FView->btnFetchDeltas->Action = actFetchDeltas;
	FView->btnPostDeltas->Action = actPostDeltas;
}
//---------------------------------------------------------------------------
void __fastcall TdmPharmacyController::DataModuleDestroy(TObject *Sender)
{
	if(dtmdlDelta) {
		delete dtmdlDelta;
		dtmdlDelta = NULL;
	}
}
//---------------------------------------------------------------------------
void __fastcall TdmPharmacyController::NavigateToMeds(TObject * Sender)
{
	FView->WebBrowser1->Navigate(FDataModel->qryMedicinesURL->Value);
	FView->lblURL->Caption = FDataModel->qryMedicinesURL->Value;
}
//---------------------------------------------------------------------------
void __fastcall TdmPharmacyController::actAddOrderExecute(TObject *Sender)
{
	FDataModel->qryOrders->Insert();
	FDataModel->qryOrdersMEDICINE_ID->Value = FDataModel->qryMedicinesMEDICINE_ID->Value;
	FDataModel->qryOrdersQUANTITY->Value = FView->seQuantity->Value;
	FDataModel->qryOrders->Post();
}
//---------------------------------------------------------------------------
void __fastcall TdmPharmacyController::actFetchDeltasExecute(TObject *Sender)
{
	if (dtmdlDelta) {
		delete dtmdlDelta;
		dtmdlDelta = NULL;
	}

	FDataModel->FDConnectionRemote->Close();
	FDataModel->FDConnectionRemote->Params->Database = FView->edtCentralServer->Text;
	FDataModel->FDConnectionRemote->Open();

	// Need to define the ID, Just using the record ID for now, but this could be any unique string
	dtmdlDelta = new TdtmdlDelta(this, FDataModel->qryPharmacyPHARMACY_ID->AsString,
		FView->cbShowMerged->Checked, FDataModel->FDConnection, FDataModel->FDConnectionRemote);
	dtmdlDelta->OnPostDeltas = FDataModel->RefreshMedicineData;

	// Show the data in the frames
	FView->FrameMedicine->dsCurrent->DataSet = dtmdlDelta->qryMedicine;
	//  FView->FrameMedicine->dsDelta->DataSet = dtmdlDelta->qryMedicineDelta;
	FView->FrameMedicine->dsDelta->DataSet = dtmdlDelta->mtMedicineMerged;

	FView->FrameCategory->dsCurrent->DataSet = dtmdlDelta->qryCategory;
	//  FView->FrameCategory->dsDelta->DataSet = dtmdlDelta->qryCategoryDelta;
	FView->FrameCategory->dsDelta->DataSet = dtmdlDelta->mtCategoryMerged;

	FView->FrameLinks->dsCurrent->DataSet = dtmdlDelta->qryMedicineCategories;
	//  FView->FrameLinks->dsDelta->DataSet = dtmdlDelta->qryMedicineCategoriesDelta;
	FView->FrameLinks->dsDelta->DataSet = dtmdlDelta->mtMedicineCategoriesMerged;
}
//---------------------------------------------------------------------------
void __fastcall TdmPharmacyController::actPostDeltasExecute(TObject *Sender)
{
	if(dtmdlDelta == NULL) {
		ShowMessage("Please Fetch Deltas first");
	}
	else {
		dtmdlDelta->PostDeltas();
		actFetchDeltas->Execute();
	}
}
//---------------------------------------------------------------------------
