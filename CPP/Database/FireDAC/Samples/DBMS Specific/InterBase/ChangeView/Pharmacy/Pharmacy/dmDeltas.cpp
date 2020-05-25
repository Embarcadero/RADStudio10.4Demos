//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop

#include "dmDeltas.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TdtmdlDelta *dtmdlDelta;
//---------------------------------------------------------------------------
__fastcall TdtmdlDelta::TdtmdlDelta(TComponent* Owner, String ID, bool ShowMerged,
	TFDConnection * LocalDB, TFDConnection * RemoteDB): TDataModule(Owner)
{
	FDTransactionDelta->Connection = RemoteDB;
	qrySubscriptionActive->Connection = RemoteDB;

	SetupQry(LocalDB, RemoteDB, qryCategory, qryCategoryDelta, "SELECT * FROM CATEGORY");
	SetupQry(LocalDB, RemoteDB, qryMedicine, qryMedicineDelta, "SELECT * FROM MEDICINE");
	SetupQry(LocalDB, RemoteDB, qryMedicineCategories, qryMedicineCategoriesDelta,
		"SELECT * FROM MEDICINE_CATEGORIES");

	OpenAll(ID, ShowMerged);
}
//---------------------------------------------------------------------------
void __fastcall TdtmdlDelta::OpenAll(String ID, bool ShowMerged)
{
	// Local connection in Cached Update Modes
	qryCategory->CachedUpdates = true;
	qryMedicine->CachedUpdates = true;
	qryMedicineCategories->CachedUpdates = true;

	qryCategory->Open();
	qryMedicine->Open();
	qryMedicineCategories->Open();

	if(FDTransactionDelta->Active){
		FDTransactionDelta->Rollback();
	}

  	FDTransactionDelta->StartTransaction();

	// Start the transaction to fetch the deltas. - this changes from Select ALL to Select subscribed changes only.
	qrySubscriptionActive->SQL->Text = Format("set subscription sub_medicineupdates at \'%s\' active;", ARRAYOFCONST((ID)));
	qrySubscriptionActive->ExecSQL();

	qryCategoryDelta->Open();
	qryMedicineDelta->Open();
	qryMedicineCategoriesDelta->Open();
	// This is for illustation only - Build a picture of local and Merged delta
	if(ShowMerged){
		mtCategoryMerged->MergeDataSet(qryCategory, TFDMergeDataMode::dmDataSet, mmUpdate);
		mtMedicineMerged->MergeDataSet(qryMedicine, TFDMergeDataMode::dmDataSet, mmUpdate);
		mtMedicineCategoriesMerged->MergeDataSet(qryMedicineCategories, TFDMergeDataMode::dmDataSet, mmUpdate);
	}
	mtCategoryMerged->MergeDataSet(qryCategoryDelta, TFDMergeDataMode::dmDeltaMerge, mmUpdate);
	mtMedicineMerged->MergeDataSet(qryMedicineDelta, TFDMergeDataMode::dmDeltaMerge, mmUpdate);
	mtMedicineCategoriesMerged->MergeDataSet(qryMedicineCategoriesDelta, TFDMergeDataMode::dmDeltaMerge, mmUpdate);
}
//---------------------------------------------------------------------------
void __fastcall TdtmdlDelta::SetupQry(TFDConnection * LocalDB, TFDConnection * RemoteDB,
	TFDQuery * LocalQuery, TFDQuery *DeltaQuery, String SQL)
{
	LocalQuery->Connection = LocalDB;
	DeltaQuery->Connection = RemoteDB;
	LocalQuery->SQL->Text = SQL;
	DeltaQuery->SQL->Text = SQL;
}
//---------------------------------------------------------------------------
void __fastcall TdtmdlDelta::PostDeltas()
{
	qryCategory->MergeDataSet(qryCategoryDelta, TFDMergeDataMode::dmDeltaMerge, mmUpdate);
	qryMedicine->MergeDataSet(qryMedicineDelta, TFDMergeDataMode::dmDeltaMerge, mmUpdate);
	qryMedicineCategories->MergeDataSet(qryMedicineCategoriesDelta, TFDMergeDataMode::dmDeltaMerge, mmUpdate);

	qryCategory->ApplyUpdates();
	qryMedicine->ApplyUpdates();
	qryMedicineCategories->ApplyUpdates();

	FDTransactionDelta->Commit();

	if(OnPostDeltas){
		OnPostDeltas(this);
	}
}
//---------------------------------------------------------------------------
