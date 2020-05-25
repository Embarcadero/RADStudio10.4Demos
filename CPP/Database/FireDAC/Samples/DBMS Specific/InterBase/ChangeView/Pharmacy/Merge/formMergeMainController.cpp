//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop

#include "formMergeMainController.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TMergeMainController *MergeMainController;
//---------------------------------------------------------------------------
__fastcall TMergeMainController::TMergeMainController(TComponent* Owner, TfrmMergeMain * AView)
	: TDataModule(Owner)
{
	FView = AView;
}
//---------------------------------------------------------------------------
void __fastcall TMergeMainController::actMergeExecute(TObject *Sender)
{
	std::unique_ptr<TdtmdDatabase> dmMSSQL(new TdtmdDatabase(this));
	std::unique_ptr<TdtmdDatabase> dmIB(new TdtmdDatabase(this));

	dmIB->FDConnection->DriverName = "IB";
	dmIB->FDConnection->Params->Database = FView->edtIBDatabase->Text;

	dmMSSQL->FDConnection->DriverName = "MSSQL";
	dmMSSQL->FDConnection->LoginDialog = dmMSSQL->FDGUIxLoginDialog1;
	dmMSSQL->FDConnection->Params->Database = FView->edtMSSQLDatabase->Text;
	dmMSSQL->FDConnection->Params->Values["SERVER"] = FView->edtMSSQLServer->Text;
	dmMSSQL->FDConnection->Transaction->Options->Isolation = TFDTxIsolation::xiReadCommitted;

	dmIB->FDConnection->Open();
	dmMSSQL->FDConnection->Open();

	std::vector<String> category;
	category.push_back("CATEGORY_ID");

	std::vector<String> medicine;
	medicine.push_back("MEDICINE_ID");

	std::vector<String> medi_cate;
	medi_cate.push_back("MEDICINE_ID");
	medi_cate.push_back("CATEGORY_ID");

	RemoveDeletedRecords(dmIB->qryCategory, dmMSSQL->qryCategory, category, FView->ProgressBar1);
	RemoveDeletedRecords(dmIB->qryMedicine, dmMSSQL->qryMedicine, medicine, FView->ProgressBar2);
	RemoveDeletedRecords(dmIB->qryMedicineCategories, dmMSSQL->qryMedicineCategories, medi_cate, FView->ProgressBar3);

	ProcessUpdatesToIB(dmIB->qryCategory, dmMSSQL->qryCategory, category, FView->ProgressBar4);
	ProcessUpdatesToIB(dmIB->qryMedicine, dmMSSQL->qryMedicine, medicine, FView->ProgressBar5);
	ProcessUpdatesToIB(dmIB->qryMedicineCategories, dmMSSQL->qryMedicineCategories, medi_cate, FView->ProgressBar6);
}
//---------------------------------------------------------------------------
void __fastcall TMergeMainController::actGetIBFileNameExecute(TObject *Sender)
{
	if(FView->FileOpenDialog1->Execute()) {
		FView->edtIBDatabase->Text = FView->FileOpenDialog1->FileName;
	}
}
//---------------------------------------------------------------------------
void __fastcall  TMergeMainController::SetUpProgress(TFDQuery * Qry,
	TProgressBar *ProgressBar)
{
	ProgressBar->Position = 0;
	ProgressBar->Max = Qry->RecordCount;
}
//---------------------------------------------------------------------------
void __fastcall TMergeMainController::RemoveDeletedRecords(TFDQuery *IBData, TFDQuery *MasterData,
    std::vector<String> ValueFields, TProgressBar *ProgressBar)
{
	this->SetUpProgress(IBData, ProgressBar);
	IBData->First();
	String KeyFields = "";

	for(std::vector<String>::iterator it = ValueFields.begin(); it != ValueFields.end(); ++it) {
		if(KeyFields > "") {
			KeyFields += ";" + *it;
		} else {
			KeyFields = *it;
		}
	}
	System::Variant LocateData;
	while (!IBData->Eof) {
		switch(ValueFields.size()) {
			case 1 :
				LocateData = VarArrayOf(OPENARRAY(System::Variant,(IBData->FieldByName(ValueFields[0])->Value)));
				break;
			case 2 :
				LocateData = VarArrayOf(OPENARRAY(System::Variant,(IBData->FieldByName(ValueFields[0])->Value,
					IBData->FieldByName(ValueFields[1])->Value)));
				break;
		}

		if(!MasterData->Locate(KeyFields, LocateData, TLocateOptions())) {
			MasterData->Delete();
		}
		ProgressBar->Position++;
		IBData->Next();
	}
}
//---------------------------------------------------------------------------
void __fastcall TMergeMainController::ProcessUpdatesToIB(TFDQuery * IBData, TFDQuery *MasterData,
	std::vector<String> ValueFields, TProgressBar * ProgressBar)
{
	SetUpProgress(MasterData, ProgressBar);
	MasterData->First();

	String KeyFields = "";
    for(std::vector<String>::iterator it = ValueFields.begin(); it != ValueFields.end(); ++it) {
		if(KeyFields > "") {
			KeyFields += ";" + *it;
		} else {
			KeyFields = *it;
		}
	}

    System::Variant LocateData;
	while (!IBData->Eof) {
		switch(ValueFields.size()) {
			case 1 :
				LocateData = VarArrayOf(OPENARRAY(System::Variant,(IBData->FieldByName(ValueFields[0])->Value)));
				break;
			case 2 :
				LocateData = VarArrayOf(OPENARRAY(System::Variant,(IBData->FieldByName(ValueFields[0])->Value,
					IBData->FieldByName(ValueFields[1])->Value)));
				break;
		}
        TField *IBField, *Field;
		if(!IBData->Locate(KeyFields, LocateData, TLocateOptions())) {
			IBData->Insert();
			for(int i = 0; i < MasterData->FieldCount; i++) {
				Field = MasterData->Fields->Fields[i];
				IBField = IBData->Fields->FindField(Field->FieldName);
				if(IBField != NULL) {
					IBField->Value = Field->Value;
				}
                IBData->Post();
            }
		}
		else {
			for(int i = 0; i < MasterData->FieldCount; i++) {
				Field = MasterData->Fields->Fields[i];
				IBField = IBData->Fields->FindField(Field->FieldName);
				if(IBField != NULL) {
					if(IBField->Value != Field->Value) {
						if(IBData->State != TDataSetState::dsEdit) {
							IBData->Edit();
						}
                        IBField->Value = Field->Value;
                    }
                }
			}
			if(IBData->State == TDataSetState::dsEdit) {
				IBData->Post();
			}
		}
		ProgressBar->Position++;
		MasterData->Next();
	}
}
//---------------------------------------------------------------------------
