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
	// Connect to MongoDB and get CLI wrapping objects
	FDConnection1->Connected = true;
	FCon = (TMongoConnection*)FDConnection1->CliObj;
	FEnv = FCon->Env;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnInsertClick(TObject *Sender)
{
	// For details see:
	// https://docs.mongodb.org/getting-started/shell/insert/
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	TMongoCollection * oCol = FCon->GetCollection("test", "restaurants");
	oCol->RemoveAll();
	// Build new document
	oDoc
	  ->BeginObject("address")
		->Add("street", String("2 Avenue"))
		->Add("zipcode", String("10075"))
		->Add("building", String("1480"))
		->BeginArray("coord")
		  ->Add("0", (System::Extended)-73.9557413)
		  ->Add("1", (System::Extended)40.7720266)
		->EndArray()
	  ->EndObject()
	  ->Add("borough", String("Manhattan"))
	  ->Add("cuisine", String("Italian"))
	  ->BeginArray("grades")
		->BeginObject("0")
		  ->Add("date", EncodeDate(2000, 5, 25))
		  ->Add("grade", String("Add"))
		  ->Add("score", 11)
		->EndObject()
		->BeginObject("1")
		  ->Add("date", EncodeDate(2005, 6, 2))
		  ->Add("grade", String("B"))
		  ->Add("score", 17)
		->EndObject()
	  ->EndArray()
	  ->Add("name", String("Vella"))
	  ->Add("restaurant_id", String("41704620"));

	// Insert new document into "restaurants" collection in "test" database.
	// This may be done using "fluent" style.
	oCol->Insert(oDoc.get());

	// Find, retrieve and show all documents
	// The query condition may be build using "fluent" style.
	_di_IMongoCursor oCrs = oCol->Find(NULL, TMongoQueryFlags());
	while(oCrs->Next()) {
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
//		Memo1->Text = Memo1->Text + "\n" + oCrs->Doc->AsJSON;
	}

	// Get number of documents in the collection
	Memo1->Lines->Add("Record count " + IntToStr((__int64)oCol->Count()->Value()));
//	Memo1->Text = Memo1->Text + "\nRecord count " + IntToStr((__int64)oCol->Count()->Value());
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnPingClick(TObject *Sender)
{
	// Ping server and get server version
	FCon->Ping();
	Memo1->Text = IntToStr((__int64) FCon->ServerVersion);
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnAggProjClick(TObject *Sender)
{
	// For details see:
	// http://docs.mongodb.org/manual/reference/operator/aggregation/project/#include-computed-fields
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	TMongoCollection * oCol = FCon->GetCollection("test", "books");
	oCol->RemoveAll();
	oDoc->Add("_id", 1)
		->Add("title", String("abc123"))
		->Add("isbn", String("0001122223334"))
		->BeginObject("author")
			->Add("last", String("zzz"))
			->Add("first", String("aaa"))
		->EndObject()
		->Add("copies", 5);
	oCol->Insert(oDoc.get());
	_di_IMongoCursor oCrs = oCol->Aggregate()
		->Project()
			->Field("title")
			->FieldBegin("isbn")
				->Exp("prefix",     String("{ \"$substr\": [ \"$isbn\", 0, 3 ] }"))
				->Exp("group",      String("{ \"$substr\": [ \"$isbn\", 3, 2 ] }"))
				->Exp("publisher",  String("{ \"$substr\": [ \"$isbn\", 5, 4 ] }"))
				->Exp("title",      String("{ \"$substr\": [ \"$isbn\", 9, 3 ] }"))
				->Exp("checkDigit", String("{ \"$substr\": [ \"$isbn\", 12, 1] }"))
			->FieldEnd()
			->Exp("lastName",   String("\"$author.last\""))
			->Exp("copiesSold", String("\"$copies\""))
		->End()
		->Match()
		->Exp("copiesSold", String("{ \"$gt\" : 4, \"$lte\" : 6 }"))
		->End()
	->Open();
	while(oCrs->Next()) {
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnAggRedactClick(TObject *Sender)
{
	// For details see:
	// http://docs.mongodb.org/manual/reference/operator/aggregation/redact/
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	TMongoCollection * oCol = FCon->GetCollection("test", "forecast");
	oCol->RemoveAll();
	oDoc->Add("_id", 1)
		->Add("title", String("123 Department Report"))
		->BeginArray("tags")
			->Add("0", String("G"))
			->Add("1", String("STLW"))
		->EndArray()
		->Add("year", 2014)
		->BeginArray("subsections")
			->BeginObject("0")
				->Add("subtitle", String("Section 1: Overview"))
				->BeginArray("tags")
					->Add("0", String("SI"))
					->Add("1", String("G"))
				->EndArray()
				->Add("content", String("Section 1: This is the content of section 1->"))
			->EndObject()
			->BeginObject("1")
				->Add("subtitle", String("Section 2: Analysis"))
				->BeginArray("tags")
					->Add("0", String("STLW"))
				->EndArray()
				->Add("content", String("Section 2: This is the content of section 2->"))
			->EndObject()
			->BeginObject("2")
				->Add("subtitle", String("Section 3: Budgeting"))
				->BeginArray("tags")
					->Add("0", "TK")
				->EndArray()
				->BeginObject("content")
					->Add("text", String("Section 3: This is the content of section3->"))
					->BeginArray("tags")
						->Add("0", "HCS")
					->EndArray()
				->EndObject()
			->EndObject()
		->EndArray();
	oCol->Insert(oDoc.get());
	_di_IMongoCursor oCrs = oCol
		->Aggregate()
		->Match()
			->Exp("year", String("2014"))
		->End()
		->Redact()
			->BeginObject("$cond")
				->BeginObject("if")
					->BeginArray("$gt")
						->BeginObject("0")
						->BeginObject("$size")
							->BeginArray("$setIntersection")
								->Add("0", String("$tags"))
								->BeginArray("1")
									->Add("0", String("STLW"))
									->Add("1", String("G"))
								->EndArray()
							->EndArray()
						->EndObject()
						->EndObject()
						->Add("1", 0)
					->EndArray()
				->EndObject()
			->Add("then", String("$$DESCEND"))
			->Add("else", String("$$PRUNE"))
		->EndObject()
		->End()
	->Open();
	while(oCrs->Next()) {
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnInsFindClick(TObject *Sender)
{
	// For details see:
	// http://docs.mongodb.org/manual/reference/operator/query/
	// http://docs.mongodb.org/manual/reference/operator/query-modifier/
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	TMongoCollection * oCol = FCon->GetCollection("test", "perf_test");
	oCol->RemoveAll();
	for(int i = 1; i <= 100; i++) {
		oDoc->Clear()
			->Add("f1", i / 10)
			->Add("f2", i % 10)
			->Add("f3", String("str" + IntToStr(i)));
		oCol->Insert(oDoc.get());
	}
	_di_IMongoCursor oCrs = oCol
		->Find()
		->Match()
			->BeginObject("f1")
				->Add("$gt", 5)
			->EndObject()
		->End()
		->Sort()
			->Field("f1", false)
			->Field("f2", true)
		->End()
		->Limit(5)
	->Open();
	while(oCrs->Next()){
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnCurrentOpClick(TObject *Sender)
{
	// For details see:
	// http://docs.mongodb.org/manual/reference/method/db.currentOp/
	_di_IMongoCursor oCrs = FCon->GetCollection("admin", "$cmd.sys.inprog")->Command("{\"query\": {\"$all\": [true]}}");
	while(oCrs->Next()) {
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnListColsClick(TObject *Sender)
{
	// For details see:
	// http://docs.mongodb.org/manual/reference/command/listCollections/
	_di_IMongoCursor oCrs = FCon->GetDatabase("test")->ListCollections();
	while(oCrs->Next()){
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
	}

}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnUpdIncClick(TObject *Sender)
{
	// For details see:
	// http://docs.mongodb.org/manual/reference/operator/update/inc/
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	TMongoCollection * oCol = FCon->GetCollection("test", "products");
	oCol->RemoveAll();
	oDoc->Add("_id", 1)
		->Add("sku", String("abc123"))
		->Add("quantity", 10)
		->BeginObject("metrics")
			->Add("orders", (int)2)
			->Add("ratings", (System::Extended)3.5)
		->EndObject();
	oCol->Insert(oDoc.get());
	oCol->Update()
		->Match()
			->Add("sku", String("abc123"))
		->End()
		->Modify()
			->Inc()
				->Field("quantity", -2)
				->Field("metrics.orders", 1)
			->End()
			->Mul()
				->Field("metrics.ratings", 1.01)
			->End()
		->End()
	->Exec();
	_di_IMongoCursor oCrs = oCol->Find(NULL, TMongoQueryFlags());
	while(oCrs->Next()) {
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnUpdPushClick(TObject *Sender)
{
	// For details see:
	// http://docs.mongodb.org/manual/reference/operator/update/push/
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	TMongoCollection * oCol = FCon->GetCollection("test", "students");
	oCol->RemoveAll();
	oDoc
		->Add("_id", 5)
		->BeginArray("quizzes")
			->BeginObject("0")
				->Add("wk", 1)
				->Add("score", 10)
			->EndObject()
			->BeginObject("1")
				->Add("wk", 2)
				->Add("score", 8)
			->EndObject()
			->BeginObject("2")
				->Add("wk", 3)
				->Add("score", 5)
			->EndObject()
			->BeginObject("3")
				->Add("wk", 4)
				->Add("score", 6)
			->EndObject()
		->EndArray();
	oCol->Insert(oDoc.get());
	oCol->Update()
		->Match()
			->Add("_id", 5)
		->End()
		->Modify()
			->Push()
				->Field("quizzes", ARRAYOFCONST((
					String("{"), String("wk"), 5, String("score"), 8, String("}"),
					String("{"), String("wk"), 6, String("score"), 7, String("}"),
					String("{"), String("wk"), 7, String("score"), 6, String("}"))),
				true, 3, String("\"score\": -1"))
			->End()
		->End()
	->Exec();
	_di_IMongoCursor oCrs = oCol->Find(NULL, TMongoQueryFlags());
	while(oCrs->Next()){
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::Button9Click(TObject *Sender)
{
	// For details see:
	// http://docs.mongodb.org/manual/reference/method/Bulk/
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	TMongoCollection * oCol = FCon->GetCollection("test", "testbulk");
	oCol->RemoveAll();
	try {
		oCol->BeginBulk(false);
		for(int i = 1; i <= 10; i++) {
			oDoc->Clear()
				->Add("_id", double(i) / 2)
				->Add("name", String("rec" + IntToStr(i)));
			oCol->Insert(oDoc.get());
		}
		oCol->EndBulk();
	} catch (...) {
		ApplicationHandleException(NULL);
	}
	_di_IMongoCursor oCrs = oCol->Find(NULL, TMongoQueryFlags());
	while(oCrs->Next()) {
		Memo1->Lines->Add(oCrs->Doc->AsJSON);
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::btnIterateClick(TObject *Sender)
{
	std::unique_ptr<TMongoDocument> oDoc(FEnv->NewDoc());
	oDoc->BeginObject("address")
			->Add("street", String("2 Avenue"))
			->Add("zipcode", String("10075"))
			->Add("building", String("1480"))
			->BeginArray("coord")
				->Add("0", (System::Extended)-73.9557413)
				->Add("1", (System::Extended)40.7720266)
			->EndArray()
		->EndObject()
		->Add("borough", String("Manhattan"))
		->Add("cuisine", String("Italian"))
		->BeginArray("grades")
			->BeginObject("0")
				->Add("date", EncodeDate(2000, 5, 25))
				->Add("grade", String("Add"))
				->Add("score", 11)
			->EndObject()
			->BeginObject("1")
				->Add("date", EncodeDate(2005, 6, 2))
				->Add("grade", String("B"))
				->Add("score", 17)
			->EndObject()
		->EndArray()
		->Add("name", String("Vella"))
		->Add("restaurant_id", String("41704620"));
	std::unique_ptr<TJSONIterator> oIter(oDoc->Iterator());
	String sIdent("");
	while(true) {
		while(oIter->Next()){
			Memo1->Lines->Add(sIdent + oIter->Key);
			if((oIter->Type == TJsonToken::StartObject) || (oIter->Type == TJsonToken::StartArray)) {
				sIdent += " ";
				oIter->Recurse();
			}
		}
		if(oIter->InRecurse) {
			oIter->Return();
			sIdent = sIdent.SubString(1, sIdent.Length()-2);
		}
		else {
			break;
		}
	}
	if(oIter->Find("grades[0].score")) {
		Memo1->Lines->Add("found");
	}
	else {
		Memo1->Lines->Add("NOT found");
	}
}
//---------------------------------------------------------------------------
