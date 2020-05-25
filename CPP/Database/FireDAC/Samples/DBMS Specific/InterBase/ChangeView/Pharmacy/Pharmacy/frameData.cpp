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

#include "frameData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrame1 *Frame1;
//---------------------------------------------------------------------------
__fastcall TFrame1::TFrame1(TComponent* Owner)
	: TFrame(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrame1::FrameResize(TObject *Sender)
{
	GroupBox3->Height = static_cast<int>((this->Height - Splitter2->Height) / 2);
}
//---------------------------------------------------------------------------
void __fastcall TFrame1::DBGrid2DrawColumnCell(TObject *Sender, const TRect &Rect,
          int DataCol, TColumn *Column, TGridDrawState State)
{
	if(!State.Contains(gdFocused) && Column->Field != NULL) {
		switch(Column->Field->DataSet->UpdateStatus()) {
			case usUnmodified :
				break;
			case usModified :
				static_cast<TDBGrid*>(Sender)->Canvas->Brush->Color = clYellow;
				if(VarCompareValue(Column->Field->OldValue, Column->Field->CurValue) != vrEqual) {
					TFontStyles fs = static_cast<TDBGrid*>(Sender)->Canvas->Font->Style;
					fs << fsBold;
					static_cast<TDBGrid*>(Sender)->Canvas->Font->Style = fs;
				}
				break;
			case usInserted :
				static_cast<TDBGrid*>(Sender)->Canvas->Brush->Color = clLime;
				break;
			case usDeleted :
				static_cast<TDBGrid*>(Sender)->Canvas->Brush->Color = clRed;
				break;
		}
        static_cast<TDBGrid*>(Sender)->DefaultDrawColumnCell(Rect, DataCol, Column, State);
    }
}
//---------------------------------------------------------------------------
