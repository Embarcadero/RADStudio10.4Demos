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
void __fastcall TfrmMain::Button1Click(TObject *Sender)
{
	String sCat, sSch, sBase, sObj;
	FDConnection1->Connected = true;
	FDConnection2->Connected = true;

	// Get MongoDB collection name from source DB table name
	FDConnection1->DecodeObjectName(FDBatchMoveSQLReader1->TableName, sCat, sSch, sBase, sObj);
	sObj = StringReplace(sObj, " ", "_", TReplaceFlags() << rfReplaceAll);

	FDMongoQuery1->Active = false;
	// Specify MongoDB database and collection names
	FDMongoQuery1->DatabaseName = "test";
	FDMongoQuery1->CollectionName = sObj;
	// Specify always-False MongoDB condition to avoid not needed documents fetching
	FDMongoQuery1->QMatch = "{\"_id\": \"\"}";
	// Delete all documents from specified MongoDB collection
	FDMongoQuery1->ServerDeleteAll();

	// Create and populate MongoDB collection
	FDBatchMove1->Execute();
	ShowMessage(String().sprintf(L"%d records inserted", FDBatchMove1->InsertCount));

	// Refresh MongoDB query
	FDMongoQuery1->Active = false;
	// Clear all definitions as field definitions may change
	FDMongoQuery1->IndexDefs->Clear();
	FDMongoQuery1->Indexes->Clear();
	FDMongoQuery1->FieldDefs->Clear();
	FDMongoQuery1->QMatch = "";
	FDMongoQuery1->Active = true;
}
//---------------------------------------------------------------------------
