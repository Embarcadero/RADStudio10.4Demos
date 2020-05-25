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

#include "About.h"
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
void __fastcall TForm2::FormCreate(TObject *Sender)
{
	Memo1->Clear();
	Memo1->Lines->Add("This project is a demo for CodeGear™ RAD Studio.");
	Memo1->Lines->Add("");
	Memo1->Lines->Add("This software contains functions for modifying \
	bitmap images (24 bit Color or 8 bit Grayscale).");
	Memo1->Lines->Add("It makes use of components: TImage, TImageList, \
	TOpenPictureDialog,TButtonGroups, TMainMenu and TSavePictureDialog.");
	Memo1->Lines->Add("");
	Memo1->Lines->Add("Copyright (c) 2009 Embarcadero Technologies Inc. All Rights Reserved.");

// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

	Memo1->Lines->Add("author: Marcio Kassouf Crocomo");
	Memo1->Lines->Add("email: marcio.crocomo@embarcadero.com");
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button1Click(TObject *Sender)
{
	Form2->Hide();
}
//---------------------------------------------------------------------------
