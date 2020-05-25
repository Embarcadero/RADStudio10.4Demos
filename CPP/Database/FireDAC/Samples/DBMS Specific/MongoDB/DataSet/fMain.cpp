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

#include "fMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMain *frmMain;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::FormCreate(TObject *Sender)
{
	// Mode=fmAll helps to measure fetch performance
	FDMongoQuery1->FetchOptions->Mode << fmAll;
	// CachedUpdates=True helps to measure update performance
	FDMongoQuery1->CachedUpdates = true;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::Button1Click(TObject *Sender)
{
	TStopwatch rWatch = TStopwatch::StartNew();
	try {
		FDMongoQuery1->Close();
		FDMongoQuery1->QMatch = edtJSONQuery->Text;
		FDMongoQuery1->Open();
        // When query returned no documents or collection does not exist, then
		// dataset will have only single _id field.
		if(FDMongoQuery1->IsEmpty() && (FDMongoQuery1->FieldDefList->Count == 1)){
			ShowMessage("No documents returned by query or [" + FDMongoQuery1->CollectionName +
					  "] collection does not exist.\n" +
					  "To load restaurants demo data use MongoDB\Restaurants demo.");
		  return;
		}
		// Attach datasources to nested datasets
		dsCoords->DataSet = static_cast<TDataSetField*>(FDMongoQuery1->FieldByName("address.coord"))->NestedDataSet;
		dsGrades->DataSet = static_cast<TDataSetField*>(FDMongoQuery1->FieldByName("grades"))->NestedDataSet;
	}
	__finally {
		lblTimeElapsed->Caption = rWatch.Elapsed;
    }
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::Button2Click(TObject *Sender)
{
  TStopwatch rWatch = TStopwatch::StartNew();
  try {
	FDMongoQuery1->ApplyUpdates();
  }
  __finally {
	lblTimeElapsed->Caption = rWatch.Elapsed;
  }
}
//---------------------------------------------------------------------------

