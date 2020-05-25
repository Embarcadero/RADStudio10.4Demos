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

#include "Threshold.h"
#include "ipFunctions.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm4 *Form4;

TImage *ImageTh = NULL;

//Auxiliar image, used by monochromatic() function
static Byte **auximage=NULL;

void applyTreshold(TImage *image, int b)
{
	 int x, y;
	 Byte *p;
	 int newValue;

		for (y = 0; y < image->Picture->Bitmap->Height; y++)
		{
				p = (byte *) image->Picture->Bitmap->ScanLine[y];
				for (x = 0; x < image->Picture->Bitmap->Width; x++)
				{
					 if(auximage[y][x]<b)p[x]=0;
					 else p[x]=255;
				}
		}
		image->Refresh();
}

void loadAuxImage()
{
	int x, y;
	Byte *p;
	if(auximage==NULL)
	{
		if((auximage = (Byte **) calloc (ImageTh->Picture->Bitmap->Height,sizeof(Byte *))) == NULL)
		{
			ShowMessage("Error: Could not create auxiliar image");
			exit(1);
		}
		for(y = 0; y < ImageTh->Picture->Bitmap->Height; y++)
			if((auximage[y] = (Byte *) calloc (ImageTh->Picture->Bitmap->Width,sizeof(Byte *))) ==NULL)
			{
				ShowMessage("Error: Could not create auxiliar image");
				exit(1);
			}

		 for (y = 0; y < ImageTh->Picture->Bitmap->Height; y++)
		 {
				p = (byte *) ImageTh->Picture->Bitmap->ScanLine[y];
				for (x = 0; x < ImageTh->Picture->Bitmap->Width; x++)
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

void monochromatic(TImage *ImageSelected)
{
	ImageTh = ImageSelected;
	loadAuxImage();
	Form4->ScrollBar1->Position = 127;
	Form4->Visible = true;
}

void cancelM()
{
	 int x, y;
	 Byte *p;
	 int newValue;

		for (y = 0; y < ImageTh->Picture->Bitmap->Height; y++)
		{
				p = (byte *) ImageTh->Picture->Bitmap->ScanLine[y];
				for (x = 0; x < ImageTh->Picture->Bitmap->Width; x++)
				{
					 p[x]=auximage[y][x];
				}
		}
		Form4->Close();
		ImageTh->Refresh();
}

//---------------------------------------------------------------------------
__fastcall TForm4::TForm4(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm4::Button1Click(TObject *Sender)
{
	Form4->Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm4::Button2Click(TObject *Sender)
{
	cancelM();
}
//---------------------------------------------------------------------------
void __fastcall TForm4::ScrollBar1Change(TObject *Sender)
{
	applyTreshold(ImageTh, ScrollBar1->Position);
}
//---------------------------------------------------------------------------
void __fastcall TForm4::FormClose(TObject *Sender, TCloseAction &Action)
{
	int x,y;
	for(y = 0; y < ImageTh->Picture->Bitmap->Height; y++)
			free(auximage[y]);
	free(auximage);
	auximage=NULL;
}
//---------------------------------------------------------------------------
