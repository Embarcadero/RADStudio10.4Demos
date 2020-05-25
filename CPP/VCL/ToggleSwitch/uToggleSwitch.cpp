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

#include "uToggleSwitch.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Vcl.WinXCtrls"
#pragma resource "*.dfm"
TToggleSwitchForm *ToggleSwitchForm;
//---------------------------------------------------------------------------
__fastcall TToggleSwitchForm::TToggleSwitchForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TToggleSwitchForm::FormCreate(TObject *Sender)
{
  for (int i = 0; i < TStyleManager::StyleNames.Length; i++)
    cbxVclStyles->Items->Add(TStyleManager::StyleNames[i]);

  cbxVclStyles->ItemIndex = cbxVclStyles->Items->IndexOf(TStyleManager::ActiveStyle->Name);
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::cbxVclStylesChange(TObject *Sender)
{
  TStyleManager::SetStyle(cbxVclStyles->Text);
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::grpStateClick(TObject *Sender)
{
  TS->State = TToggleSwitchState(grpState->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::chkEnabledClick(TObject *Sender)
{
  TS->Enabled = chkEnabled->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::chkReadOnlyClick(TObject *Sender)
{
  TS->ReadOnly = chkReadOnly->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::chkShowStateCaptionsClick(TObject *Sender)
{
  TS->ShowStateCaption = chkShowStateCaptions->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::edtCaptionOffChange(TObject *Sender)
{
  TS->StateCaptions->CaptionOff = edtCaptionOff->Text;
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::edtCaptionOnChange(TObject *Sender)
{
  TS->StateCaptions->CaptionOn = edtCaptionOn->Text;
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::grpAlignmentClick(TObject *Sender)
{
  TS->Alignment = TLeftRight(grpAlignment->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::cbxColorChange(TObject *Sender)
{
  TS->Color = cbxColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::cbxFrameColorChange(TObject *Sender)
{
  TS->FrameColor = cbxFrameColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TToggleSwitchForm::cbxThumbColorChange(TObject *Sender)
{
  TS->ThumbColor = cbxThumbColor->Selected;
}
//---------------------------------------------------------------------------


