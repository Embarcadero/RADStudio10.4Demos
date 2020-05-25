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

#include "uActivityIndicator.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Vcl.WinXCtrls"
#pragma resource "*.dfm"
TActivityIndicatorForm *ActivityIndicatorForm;
//---------------------------------------------------------------------------
__fastcall TActivityIndicatorForm::TActivityIndicatorForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TActivityIndicatorForm::FormCreate(TObject *Sender)
{
  for (int i = 0; i < TStyleManager::StyleNames.Length; i++)
    cbxVclStyles->Items->Add(TStyleManager::StyleNames[i]);

  cbxVclStyles->ItemIndex = cbxVclStyles->Items->IndexOf(TStyleManager::ActiveStyle->Name);
}
//---------------------------------------------------------------------------

void __fastcall TActivityIndicatorForm::cbxFormColorChange(TObject *Sender)
{
  Color = cbxFormColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TActivityIndicatorForm::cbxVclStylesChange(TObject *Sender)
{
  TStyleManager::SetStyle(cbxVclStyles->Text);
  lblFormColor->Enabled = StyleServices()->IsSystemStyle;
  cbxFormColor->Enabled = StyleServices()->IsSystemStyle;
}
//---------------------------------------------------------------------------

void __fastcall TActivityIndicatorForm::grpIndicatorColorClick(TObject *Sender)
{
  AI->IndicatorColor = (TActivityIndicatorColor) grpIndicatorColor->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TActivityIndicatorForm::grpIndicatorSizeClick(TObject *Sender)
{
  AI->IndicatorSize = (TActivityIndicatorSize) grpIndicatorSize->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TActivityIndicatorForm::grpIndicatorTypeClick(TObject *Sender)
{
  AI->IndicatorType = (TActivityIndicatorType) grpIndicatorType->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TActivityIndicatorForm::trkFrameDelayChange(TObject *Sender)
{
  AI->FrameDelay = trkFrameDelay->Position * 10;
  lblFrameDelay->Caption = "Frame Delay (" + IntToStr(AI->FrameDelay) + ")";
}
//---------------------------------------------------------------------------

void __fastcall TActivityIndicatorForm::chkAnimateClick(TObject *Sender)
{
  AI->Animate = chkAnimate->Checked;
}
//---------------------------------------------------------------------------



