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

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
#pragma resource ("*.LgXhdpiPh.fmx", _PLAT_ANDROID)

TTabSlidingForm *TabSlidingForm;
//---------------------------------------------------------------------------
__fastcall TTabSlidingForm::TTabSlidingForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TTabSlidingForm::FormKeyUp(TObject *Sender, WORD &Key, System::WideChar &KeyChar,
          TShiftState Shift)
{
		  if (Key == vkHardwareBack && TabControl1->TabIndex > 0) {
			TabControl1->TabIndex = (TabControl1->TabIndex - 1) % TabControl1->TabCount;
            Key = 0;
		  }
}
//---------------------------------------------------------------------------

