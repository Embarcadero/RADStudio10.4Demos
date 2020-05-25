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

#include "Brightness.h"
#include "ipFunctions.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm3 *Form3;

TImage *Image = NULL;

//Auxiliar image, used by linearTransformation
Byte **auximage=NULL;

void loadAuxImageBC()
{
	int x, y;
	Byte *p;
	int hValues; //Number of values the image have in each line (3 x width for colour images)
	if(Image->Picture->Bitmap->PixelFormat==pf24bit)
		hValues = 3*Image->Picture->Bitmap->Width;
	else
		hValues = Image->Picture->Bitmap->Width;

	if(auximage==NULL)
	{
		if((auximage = (Byte **) calloc (Image->Picture->Bitmap->Height,sizeof(Byte *))) == NULL)
		{
			ShowMessage("Error: Could not create auxiliar image");
			exit(1);
		}
		for(y = 0; y < Image->Picture->Bitmap->Height; y++)
			if((auximage[y] = (Byte *) calloc (hValues,sizeof(Byte *))) ==NULL)
			{
				ShowMessage("Error: Could not create auxiliar image");
				exit(1);
			}

		 for (y = 0; y < Image->Picture->Bitmap->Height; y++)
		 {
				p = (byte *) Image->Picture->Bitmap->ScanLine[y];
				for (x = 0; x < hValues; x++)
				{
					 auximage[y][x]=p[x];
				}
		 }
	}
	else
	{
	   ShowMessage("Internal Error");
	   exit(1);
	}
}

void brightnessContrast(TImage *ImageSelected)
{
	Image = ImageSelected;
	loadAuxImageBC();
	Form3->ScrollBar1->Position = 0;
	Form3->ScrollBar2->Position = 400;
	Form3->Visible = true;
}

void cancelBC()
{
	 int x, y;
	 Byte *p;
	 int newValue;
	 int hValues; //Number of values the image have in each line (3 x width for colour images)
	 if(Image->Picture->Bitmap->PixelFormat==pf24bit)
		hValues = 3*Image->Picture->Bitmap->Width;
	 else
		hValues = Image->Picture->Bitmap->Width;

		for (y = 0; y < Image->Picture->Bitmap->Height; y++)
		{
				p = (byte *) Image->Picture->Bitmap->ScanLine[y];
				for (x = 0; x < hValues; x++)
				{
					 p[x]=auximage[y][x];
				}
		}
		Form3->Close();
		Image->Refresh();
}

//---------------------------------------------------------------------------
__fastcall TForm3::TForm3(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm3::ScrollBar1Change(TObject *Sender)
{
	linearTransformation(Image, auximage, float(ScrollBar2->Position)/400,ScrollBar1->Position);
}
//---------------------------------------------------------------------------
void __fastcall TForm3::ScrollBar2Change(TObject *Sender)
{
	linearTransformation(Image, auximage, float(ScrollBar2->Position)/400,ScrollBar1->Position);
}
//---------------------------------------------------------------------------
void __fastcall TForm3::FormClose(TObject *Sender, TCloseAction &Action)
{
	int x,y;
	for(y = 0; y < Image->Picture->Bitmap->Height; y++)
			free(auximage[y]);
	free(auximage);
	auximage=NULL;
}
//---------------------------------------------------------------------------

void __fastcall TForm3::Button2Click(TObject *Sender)
{
	cancelBC();
}
//---------------------------------------------------------------------------

void __fastcall TForm3::Button1Click(TObject *Sender)
{
	Form3->Close();
}
//---------------------------------------------------------------------------

