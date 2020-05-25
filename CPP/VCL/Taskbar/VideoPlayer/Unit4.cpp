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

#include "Unit4.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm4 *Form4;
//---------------------------------------------------------------------------
__fastcall TForm4::TForm4(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm4::Panel1DblClick(TObject *Sender)
{

  if (OpenDialog1->Execute()) {
	MediaPlayer1->FileName = OpenDialog1->FileName;
	MediaPlayer1->Open();
  }

}
//---------------------------------------------------------------------------
void __fastcall TForm4::Taskbar1ThumbButtonClick(TObject *Sender, int AButtonID)
{
	switch (AButtonID) {
		case 0: MediaPlayer1->Play(); break;
		case 1: MediaPlayer1->Pause(); break;
	}
}
//---------------------------------------------------------------------------
