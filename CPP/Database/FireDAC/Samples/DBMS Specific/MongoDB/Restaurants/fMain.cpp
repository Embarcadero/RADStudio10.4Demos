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

#include "fMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TfrmMain *frmMain;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnLoadDataClick(TObject *Sender)
{
	// 2.73 secs:
	// * 0.54 - file reading
	// * 1.78 - JSON parsing
	// * 0.41 - MongoDB bulk insert
	Memo1->Lines->Clear();

	TMongoCollection * oCol = FCon->GetCollection("test", "restaurants");
	oCol->RemoveAll();
	std::unique_ptr<TFDTextFile> oText(new TFDTextFile("..\\..\\..\\..\\..\\..\\..\\..\\..\\Object Pascal\\Database\\FireDAC\\DB\\Data\\restaurants.json",
		true, false, ecANSI, elWindows));
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	TStopwatch t = TStopwatch::StartNew();
	LongWord n = 0;
	oCol->BeginBulk();
	try {
		while(true) {
			String s = oText->ReadLine();
			if(s == EmptyStr) {
				break;
			}
			oDoc->AsJSON = s;
			oCol->Insert(oDoc.get());
			n++;
		}
		oCol->EndBulk();
	} catch (...) {
		oCol->CancelBulk();
		throw;
	}
	Memo1->Lines->Add("Loaded [" + IntToStr((int)n) + "] records in [" +
		IntToStr((int)t.Elapsed.TotalSeconds) + "] secs");
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnQueryClick(TObject *Sender)
{
	_di_IMongoCursor oCrs;
	TMongoCollection * collection = FCon->GetCollection("test", "restaurants");
	Memo1->Lines->Clear();
	Memo1->Lines->Add("Collection restaurants has [" +
		IntToStr(collection->Count()->Value()) +
	"] documents");
	Memo1->Lines->Add("");
	Memo1->Lines->Add("Restaurants where cuisine is Italian and zipcode is 10075");
	oCrs = collection->Find()
		->Match()
			->Add("cuisine", String("Italian"))
			->Add("address.zipcode", String("10075"))
		->End()
	->Open();
	DumpCursor(oCrs);
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnInsertClick(TObject *Sender)
{
	Memo1->Lines->Clear();
	TMongoCollection * collection = FCon->GetCollection("test", "restaurants");
	collection->Insert()
		->Values()
			->BeginObject("address")
				->Add("street", String("2 Avenue"))
				->Add("zipcode", String("10075"))
				->Add("building", String("1480"))
				->BeginArray("coord")
					->Add("0", (System::Extended)73.9557413)
					->Add("1", (System::Extended)40.7720266)
				->EndArray()
			->EndObject()
			->Add("borough", String("Manhattan"))
			->Add("cuisine", String("Italian"))
			->BeginArray("grades")
				->BeginObject("0")
					->Add("date", EncodeDate(2014, 10, 1))
					->Add("grade", String("A"))
					->Add("score", 11)
				->EndObject()
				->BeginObject("1")
					->Add("date", EncodeDate(2014, 1, 6))
					->Add("grade", String("B"))
					->Add("score", 17)
				->EndObject()
			->EndArray()
			->Add("name", String("Vella"))
			->Add("restaurant_id", String("41704620"))
		->End()
	->Exec();
	Memo1->Lines->Add("Inserted [" + IntToStr(collection->DocsInserted) + "] documents");
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnUpdateClick(TObject *Sender)
{
	Memo1->Lines->Clear();
	TMongoCollection * collection = FCon->GetCollection("test", "restaurants");
	collection->Update()
		->Match()
			->Add("name", String("Juni"))
		->End()
		->Modify()
			->Set()
				->Field("cuisine", String("American (New)"))
			->End()
			->CurrentDate()
				->AsDate("lastModified")
			->End()
		->End()
	->Exec();
	Memo1->Lines->Add("Updated [" + IntToStr(collection->DocsModified) + "] documents");
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnRemoveClick(TObject *Sender)
{
	Memo1->Lines->Clear();
	TMongoCollection * collection = FCon->GetCollection("test", "restaurants");
	collection->Remove()
		->Match()
			->Add("borough", String("Manhattan"))
		->End()
	->Exec();
	Memo1->Lines->Add("Removed [" + IntToStr(collection->DocsRemoved) + "] documents");
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnIndexesClick(TObject *Sender)
{
	Memo1->Lines->Clear();
	// single field index
	std::unique_ptr<TMongoIndex> oInd(new TMongoIndex(FEnv));
	oInd->Keys()->Field("cuisine");
	oInd->Options->Name = "i_cuisine";
	FCon->GetCollection("test", "restaurants")->CreateIndex(oInd.get());
	Memo1->Lines->Add("Index i_cuisine created");
	// compound index
	std::unique_ptr<TMongoIndex> oInd1(new TMongoIndex(FEnv));
	String AFields[] = {"cuisine", "address.zipcode"};
	oInd1->Keys()->Ascending(AFields, 1);
	oInd1->Options->Name = "i_cuisine_zipcode";
	FCon->GetCollection("test", "restaurants")->CreateIndex(oInd1.get());
	Memo1->Lines->Add("Index i_cuisine_zipcode created");

	Memo1->Lines->Add("");
	Memo1->Lines->Add("List of restaurants collection indexes");
	_di_IMongoCursor oCrs = FCon->GetCollection("test","restaurants")->ListIndexes();
	DumpCursor(oCrs);

}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnAggregateClick(TObject *Sender)
{
	Memo1->Lines->Clear();
	Memo1->Lines->Add("Count of restaurants grouped by borough");
	_di_IMongoCursor oCrs;
	TMongoCollection * collection = FCon->GetCollection("test", "restaurants");
	oCrs = collection->Aggregate()
		->Group()
			->Add("_id", String("$borough"))
				->BeginObject("count")
					->Add("$sum", 1)
				->EndObject()
			->End()->Open();
	DumpCursor(oCrs);
	Memo1->Lines->Add("");
	Memo1->Lines->Add("Count of Brazilian restaurants in Queens grouped by zip-code");
	oCrs = collection->Aggregate()
		->Match()
			->Add("borough", String("Queens"))
			->Add("cuisine", String("Brazilian"))
		->End()
		->Group()
			->Add("_id", String("$address.zipcode"))
			->BeginObject("count")
				->Add("$sum", 1)
			->EndObject()
		->End()->Open();
	DumpCursor(oCrs);
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::DumpCursor(_di_IMongoCursor ACrs)
{
	while(ACrs->Next()) {
		Memo1->Lines->Add(ACrs->Doc->AsJSON);
	}
}

void __fastcall TfrmMain::FormCreate(TObject *Sender)
{
	FDConnection1->Connected = true;
	FCon = (TMongoConnection*)FDConnection1->CliObj;
	FEnv = FCon->Env;
}
//---------------------------------------------------------------------------
