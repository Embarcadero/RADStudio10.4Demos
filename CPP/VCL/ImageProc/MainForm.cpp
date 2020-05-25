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

#include "MainForm.h"
#include "ipFunctions.h"
#include "Brightness.h"
#include "Threshold.h"
#include "Arithmetics.h"
#include "About.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
TImage *CurrImage;

//Loads the image button with the correct image (enabled/disabled)-----------
void enableButton(int index)
{
	if(Form1->ButtonGroup1->Items->operator [](index)->ImageIndex>18)
		Form1->ButtonGroup1->Items->operator [](index)->ImageIndex-=19;
}

void disableButton(int index)
{
	if(Form1->ButtonGroup1->Items->operator [](index)->ImageIndex<19)
		Form1->ButtonGroup1->Items->operator [](index)->ImageIndex+=19;
}
//---------------------------------------------------------------------------


//Enable/Disable Menus and Buttons for a Colour image
void adjustPermissionsNoImage()
{
	Form1->File1->operator [](1)->Enabled=false;
	disableButton(1);

	Form1->Edit1->operator [](0)->Enabled=false;
	disableButton(2);

	Form1->Edit1->operator [](1)->Enabled=false;
	disableButton(9);

	Form1->Edit1->operator [](2)->Enabled=false;
	disableButton(3);

	Form1->Edit1->operator [](3)->Enabled=false;
	disableButton(4);

	Form1->Filters1->Enabled=false;
	Form1->Filters1->operator [](0)->Enabled=false;
	disableButton(6);

	Form1->Filters1->operator [](1)->Enabled=false;
	disableButton(7);

	Form1->Filters1->operator [](2)->Enabled=false;
	disableButton(8);

	Form1->Light1->Enabled=false;
	Form1->Light1->operator [](0)->Enabled=false;
	disableButton(10);

	Form1->Light1->operator [](1)->Enabled=false;
	disableButton(11);

	Form1->Light1->operator [](2)->Enabled=false;
	disableButton(12);

	Form1->Effects1->Enabled=false;
	Form1->Effects1->operator [](0)->Enabled=false;
	Form1->Effects1->operator [](1)->Enabled=false;
	Form1->Effects1->operator [](2)->Enabled=false;
	Form1->Effects1->operator [](3)->Enabled=false;
}

//Enable/Disable Menus and Buttons for a gray image
void adjustPermissionsGrayImage()
{
	Form1->File1->operator [](1)->Enabled=true;
    enableButton(1);

	Form1->Edit1->Enabled=true;
	Form1->Edit1->operator [](0)->Enabled=false;
	disableButton(2);

	Form1->Edit1->operator [](1)->Enabled=true;
	enableButton(9);

	Form1->Edit1->operator [](2)->Enabled=true;
	enableButton(3);

	Form1->Edit1->operator [](3)->Enabled=true;
	enableButton(4);

	Form1->Edit1->operator [](4)->Enabled=true;
	enableButton(5);

	Form1->Filters1->Enabled=true;
	Form1->Filters1->operator [](0)->Enabled=true;
	enableButton(6);

	Form1->Filters1->operator [](1)->Enabled=true;
	enableButton(7);

	Form1->Filters1->operator [](2)->Enabled=true;
	enableButton(8);

	Form1->Light1->Enabled=true;
	Form1->Light1->operator [](0)->Enabled=true;
	enableButton(10);

	Form1->Light1->operator [](1)->Enabled=true;
	enableButton(11);

	Form1->Light1->operator [](2)->Enabled=true;
	enableButton(12);

	Form1->Effects1->Enabled=true;
	Form1->Effects1->operator [](0)->Enabled=true;
	Form1->Effects1->operator [](1)->Enabled=false;
	Form1->Effects1->operator [](2)->Enabled=true;
	Form1->Effects1->operator [](3)->Enabled=true;
}

//Enable/Disable Menus and Buttons for a Colour image
void adjustPermissionsColourImage()
{
	Form1->File1->operator [](1)->Enabled=true;
	enableButton(1);

	Form1->Edit1->Enabled=true;
	Form1->Edit1->operator [](0)->Enabled=true;
	enableButton(2);

	Form1->Edit1->operator [](1)->Enabled=true;
	enableButton(9);

	Form1->Edit1->operator [](2)->Enabled=true;
	enableButton(3);

	Form1->Edit1->operator [](3)->Enabled=true;
	enableButton(4);

	Form1->Filters1->Enabled=false;
	Form1->Filters1->operator [](0)->Enabled=false;
	disableButton(6);
	Form1->Filters1->operator [](1)->Enabled=false;
	disableButton(7);
	Form1->Filters1->operator [](2)->Enabled=false;
	disableButton(8);

	Form1->Light1->Enabled=true;
	Form1->Light1->operator [](0)->Enabled=true;
	enableButton(10);
	Form1->Light1->operator [](1)->Enabled=true;
	enableButton(11);
	Form1->Light1->operator [](2)->Enabled=false;
	disableButton(12);

	Form1->Effects1->Enabled=true;
	Form1->Effects1->operator [](0)->Enabled=true;
	Form1->Effects1->operator [](1)->Enabled=true;
	Form1->Effects1->operator [](2)->Enabled=true;
	Form1->Effects1->operator [](3)->Enabled=true;
}

//Adjust menu permissions by calling above functions based on image pixel format
void adjustMenuPermissions()
{
	if(!(CurrImage->Picture->Bitmap->HandleAllocated()))
	   adjustPermissionsNoImage();
	else if(CurrImage->Picture->Bitmap->PixelFormat==pf8bit)
	{
		adjustPermissionsGrayImage();
	}
	else if(CurrImage->Picture->Bitmap->PixelFormat==pf24bit)
	{
		adjustPermissionsColourImage();
	}
	else adjustPermissionsNoImage();
}

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
	CurrImage = Image1;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::F1Click(TObject *Sender)
{
   if(!OpenPictureDialog1->Execute()) return;
   else
   {
	  CurrImage->Align=alNone;
	  loadImage(OpenPictureDialog1->FileName,CurrImage->Picture->Bitmap);
	  CurrImage->AutoSize=true;
	  Form1->AutoSize=true;
	  Form1->AdjustSize();
	  Form1->AutoSize=false;
	  CurrImage->Align = alClient;
	  adjustMenuPermissions();
   }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::oGrayscale1Click(TObject *Sender)
{
   convertToGrayScale(CurrImage);
   CurrImage->Refresh();
   Form1->Filters1->operator [](2)->Enabled=true;
   Form1->Edit1->operator [](1)->Enabled=true;
   adjustMenuPermissions();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ApplySobeloperator1Click(TObject *Sender)
{
   sobel(CurrImage);
   CurrImage->Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Negative1Click(TObject *Sender)
{
	negative(CurrImage);
	CurrImage->Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Exit1Click(TObject *Sender)
{
	exit(0);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Average1Click(TObject *Sender)
{
	averageFilter(CurrImage);
	CurrImage->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Median1Click(TObject *Sender)
{
	medianFilter(CurrImage);
	CurrImage->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FlipHorizontally1Click(TObject *Sender)
{
	flipH(CurrImage);
	CurrImage->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FlipVertically1Click(TObject *Sender)
{
	flipV(CurrImage);
	CurrImage->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Save1Click(TObject *Sender)
{
	if (!SavePictureDialog1->Execute()) return;
	CurrImage->Picture->Bitmap->SaveToFile(SavePictureDialog1->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Brightness1Click(TObject *Sender)
{
	brightnessContrast(CurrImage);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ApplyTreshold1Click(TObject *Sender)
{
	monochromatic(CurrImage);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Buttons1Click(TObject *Sender)
{
	CurrImage->AutoSize = false;
	CurrImage->Align = alNone;
	Panel1->Align = alNone;
	if(Panel1->Visible==true) Panel1->Visible=false;
	else Panel1->Visible=true;
	Panel1->Align = alTop;
	CurrImage->Align = alClient;
	CurrImage->Align = alNone;
	Panel1->Align = alNone;
	Form1->AdjustSize();
	//CurrImage->AutoSize = true;
	//Form1->AutoSize = true;
	Form1->AdjustSize();
	Panel1->Align = alTop;
	CurrImage->Align = alClient;
	Form1->AdjustSize();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::AutomaticContrast1Click(TObject *Sender)
{
	stretchHistogram(CurrImage);
	CurrImage->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Edges1Click(TObject *Sender)
{
	if(CurrImage->Picture->Bitmap->PixelFormat==pf24bit)
		convertToGrayScale(CurrImage);
	sobel2(CurrImage);
	CurrImage->Refresh();
	adjustMenuPermissions();
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Image11Click(TObject *Sender)
{
	CurrImage = Image1;
	Image3->Hide();
	Image2->Hide();
	Image1->Show();
	adjustMenuPermissions();
	Form1->AdjustSize();
	Form1->ButtonGroup1->Items->operator [](13)->ImageIndex=16;
	Form1->ButtonGroup1->Items->operator [](14)->ImageIndex=14;
	Form1->ButtonGroup1->Items->operator [](15)->ImageIndex=15;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Image21Click(TObject *Sender)
{
	CurrImage = Image2;
	Image3->Hide();
	Image1->Hide();
	Image2->Show();
	adjustMenuPermissions();
	Form1->AdjustSize();
	Form1->ButtonGroup1->Items->operator [](13)->ImageIndex=13;
	Form1->ButtonGroup1->Items->operator [](14)->ImageIndex=17;
	Form1->ButtonGroup1->Items->operator [](15)->ImageIndex=15;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Image31Click(TObject *Sender)
{
	CurrImage = Image3;
	Image1->Hide();
	Image2->Hide();
	Image3->Show();
	adjustMenuPermissions();
	Form1->AdjustSize();
	Form1->ButtonGroup1->Items->operator [](13)->ImageIndex=13;
	Form1->ButtonGroup1->Items->operator [](14)->ImageIndex=14;
	Form1->ButtonGroup1->Items->operator [](15)->ImageIndex=18;
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Buttons2Click(TObject *Sender)
{
	if (Panel1->Visible==true)
		Panel1->Hide();
	else Panel1->Show();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ArithmeticOperators1Click(TObject *Sender)
{
	arithmetic(Image1,Image2,Image3);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::ButtonGroup1Items1Click(TObject *Sender)
{
	if(Form1->File1->operator [](1)->Enabled==true)
	TForm1::Save1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items0Click(TObject *Sender)
{
	TForm1::F1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items2Click(TObject *Sender)
{
	if(Form1->Edit1->operator [](0)->Enabled==true)
	TForm1::oGrayscale1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items3Click(TObject *Sender)
{
	 if(Form1->Edit1->operator [](2)->Enabled==true)
	 TForm1::FlipHorizontally1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items4Click(TObject *Sender)
{
	 if(Form1->Edit1->operator [](3)->Enabled==true)
	 TForm1::FlipVertically1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items5Click(TObject *Sender)
{
	  if(Form1->Edit1->operator [](4)->Enabled==true)
	  TForm1::ArithmeticOperators1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items6Click(TObject *Sender)
{
	if(Form1->Filters1->operator [](0)->Enabled==true)
	TForm1::Average1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items7Click(TObject *Sender)
{
	if(Form1->Filters1->operator [](1)->Enabled==true)
	TForm1::Median1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items8Click(TObject *Sender)
{
	if(Form1->Filters1->operator [](2)->Enabled==true)
	TForm1::ApplySobeloperator1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items9Click(TObject *Sender)
{
	if(Form1->Edit1->operator [](1)->Enabled==true)
	TForm1::Negative1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items10Click(TObject *Sender)
{
	if(Form1->Light1->operator [](0)->Enabled==true)
	TForm1::Brightness1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items11Click(TObject *Sender)
{
	if(Form1->Light1->operator [](1)->Enabled==true)
	TForm1::AutomaticContrast1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items12Click(TObject *Sender)
{
	if(Form1->Light1->operator [](2)->Enabled==true)
	TForm1::ApplyTreshold1Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items13Click(TObject *Sender)
{
	  Select1->operator [](0)->Checked=true;
	  TForm1::Image11Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items14Click(TObject *Sender)
{
	Select1->operator [](1)->Checked=true;
	TForm1::Image21Click(Form1);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ButtonGroup1Items15Click(TObject *Sender)
{
	Select1->operator [](2)->Checked=true;
	TForm1::Image31Click(Form1);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FormCreate(TObject *Sender)
{
	adjustMenuPermissions();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::OldPicture1Click(TObject *Sender)
{
	oldPicture(CurrImage);
	CurrImage->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Draw1Click(TObject *Sender)
{
	if(CurrImage->Picture->Bitmap->PixelFormat==pf24bit)
		convertToGrayScale(CurrImage);
	linearTransformation(CurrImage,NULL,1,25);
	linearTransformation(CurrImage,NULL,1,-50);
	sobel(CurrImage);
	negative(CurrImage);
	CurrImage->Refresh();
	adjustMenuPermissions();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DetailedDraw1Click(TObject *Sender)
{
	TImage *AuxImage;
	AuxImage = new TImage(this);
	if(CurrImage->Picture->Bitmap->PixelFormat==pf24bit)
		convertToGrayScale(CurrImage);
	AuxImage->Picture->Bitmap->Assign(CurrImage->Picture->Bitmap);
	sobel(AuxImage);
	negative(AuxImage);
	averageImages(AuxImage, CurrImage, CurrImage);
	CurrImage->Refresh();
	adjustMenuPermissions();
}
//---------------------------------------------------------------------------




void __fastcall TForm1::About1Click(TObject *Sender)
{
	Form2->Show();
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FormPaint(TObject *Sender)
{
	adjustMenuPermissions();
}
//---------------------------------------------------------------------------

