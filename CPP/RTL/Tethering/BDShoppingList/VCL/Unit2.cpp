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

#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm2::CreateShoppingList(void)
{
	TStringList * LShoppingList = new TStringList();
	LShoppingList->Delimiter = ':';
	CDSProducts->First();
	while (!CDSProducts->Eof) {
		if((!CDSProductsMinimalStock->IsNull)&&(!CDSProductsStock->IsNull)) {
			if(CDSProductsMinimalStock->Value > CDSProductsStock->Value) {
				LShoppingList->Add(CDSProductsProductName->Value + "-" +
					CDSProductsCode->AsString + "-" + IntToStr(CDSProductsMinimalStock->Value -
						CDSProductsStock->Value));
			}
		}
		CDSProducts->Next();
	}
	if(LShoppingList->Count > 0) {
		TetherBDTestProfile->Resources->Items[0]->Value =
			TResourceValue::_op_Implicit(LShoppingList->DelimitedText);
	}
	else {
		TetherBDTestProfile->Resources->Items[0]->Value =
			TResourceValue::_op_Implicit("NONE");
	}
	delete LShoppingList;
}
//--------------------------------------------------------------------------
void __fastcall TForm2::FormClose(TObject *Sender, TCloseAction &Action)
{
	CDSProducts->SaveToFile("products.cds");
}
//---------------------------------------------------------------------------

void __fastcall TForm2::FormCreate(TObject *Sender)
{
	if(FileExists("products.cds")) {
		CDSProducts->LoadFromFile("products.cds");
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm2::CDSProductsAfterPost(TDataSet *DataSet)
{
	CreateShoppingList();
}
//---------------------------------------------------------------------------

void __fastcall TForm2::TetherBDTestProfileResources0ResourceReceived(const TObject *Sender,
          const TRemoteResource *AResource)
{
	if(AResource->ResType == TRemoteResourceType::Data) {
		int pId = StrToInt(AResource->Value.AsString);
		CDSProducts->First();
		while(!CDSProducts->Eof) {
			if(CDSProductsCode->Value == pId) {
				CDSProducts->Edit();
				CDSProductsStock->Value =  CDSProductsStock->Value + 100;
				CDSProducts->Post();
				break;
			}
			CDSProducts->Next();
        }
    }
}
//---------------------------------------------------------------------------
void __fastcall TForm2::actGetListExecute(TObject *Sender)
{
	CreateShoppingList();
}
//---------------------------------------------------------------------------

