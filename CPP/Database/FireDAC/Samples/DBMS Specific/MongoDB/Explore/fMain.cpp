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
	FDConnection1->Connected = true;
	FMongoConn = (TMongoConnection*)FDConnection1->CliObj;

	mdDatabases->Close();
	mdDatabases->Cursor = FMongoConn->ListDatabases();
	mdDatabases->Open();
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::dsDatabasesDataChange(TObject *Sender, TField *Field)
{
	mdCollections->Close();
	if(!mdDatabases->IsEmpty()){
		mdCollections->Cursor = FMongoConn->Databases
			[mdDatabases->Fields->operator [](0)->AsString]->ListCollections();
		mdCollections->Open();
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::dsCollectionsDataChange(TObject *Sender, TField *Field)
{
	mqData->Close();
	if(!mdCollections->IsEmpty()){
		mqData->DatabaseName = mdDatabases->Fields->operator [](0)->AsString;
		mqData->CollectionName = mdCollections->Fields->operator [](0)->AsString;
		mqData->Open();
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::dsDataDataChange(TObject *Sender, TField *Field)
{
	Label4->Caption = IntToStr(mqData->RecNo) + "/" + IntToStr(mqData->RecordCount);
}
//---------------------------------------------------------------------------
