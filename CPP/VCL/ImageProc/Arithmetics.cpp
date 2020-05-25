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

#include "Arithmetics.h"
#include "ipFunctions.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm5 *Form5;
TImage *ImgA = NULL;
TImage *ImgB = NULL;
TImage *ImgC = NULL;
//---------------------------------------------------------------------------
__fastcall TForm5::TForm5(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void arithmetic(TImage *Img1, TImage *Img2, TImage *Img3)
{
	ImgA = Img1;
	ImgB = Img2;
	ImgC = Img3;
	Form5->Show();
}
void __fastcall TForm5::Button1Click(TObject *Sender)
{
	TImage *First,*Second,*Result;
	switch(RadioGroup1->ItemIndex)
	{
		case 1: First=ImgB;
		break;
		case 2: First=ImgC;
		break;
		default: First=ImgA;
	}
	switch(RadioGroup2->ItemIndex)
	{
		case 0: Second=ImgA;
		break;
		case 2: Second=ImgC;
		break;
		default: Second=ImgB;
	}

	switch(RadioGroup3->ItemIndex)
	{
		case 0: Result=ImgA;
		break;
		case 1: Result=ImgB;
		break;
		default: Result=ImgC;
	}

	if(!(First->Picture->Bitmap->HandleAllocated())||First->Picture->Bitmap->PixelFormat!=pf8bit)
	{
		ShowMessage("First image must contain a grayscale image for this operation");
		return;
	}

	if(!(Second->Picture->Bitmap->HandleAllocated())||Second->Picture->Bitmap->PixelFormat!=pf8bit)
	{
		ShowMessage("Second Image must contain a grayscale image for this operation");
		return;
	}

	if(Result->Picture->Bitmap->HandleAllocated())
	if(mrCancel==MessageDlg("Current image at the resulting image position will be lost. Press OK to continue.",
				mtConfirmation,mbOKCancel,0))return;

	switch(RadioGroup4->ItemIndex)
	{
		case 0: addImages(First,Second,Result);
		break;
		case 1: subtractImages(First,Second,Result);
		break;
		default: averageImages(First,Second,Result);
	}

	Result->Refresh();
	Form5->Hide();
}
//---------------------------------------------------------------------------

void __fastcall TForm5::Button2Click(TObject *Sender)
{
	Form5->Hide();
}
//---------------------------------------------------------------------------

