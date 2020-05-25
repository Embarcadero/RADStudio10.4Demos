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

#include "uSearchBox.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Vcl.WinXCtrls"
#pragma resource "*.dfm"
TSearchBoxForm *SearchBoxForm;
//---------------------------------------------------------------------------
__fastcall TSearchBoxForm::TSearchBoxForm(TComponent* Owner)
	: TForm(Owner)
{
}

const UnicodeString TSearchBoxForm::IndicatorTextHelp("Enter text. Press Enter or click the search text indicator to generate OnInvokeSearch event.");
const UnicodeString TSearchBoxForm::IndicatorAudioHelp("Click the audio indicator to generate OnInvokeSearch event.");

//---------------------------------------------------------------------------
void __fastcall TSearchBoxForm::FormCreate(TObject *Sender)
{
  lblSearchIndicatorHelp->Caption = IndicatorTextHelp;

  for (int i = 0; i < TStyleManager::StyleNames.Length; i++)
    cbxVclStyles->Items->Add(TStyleManager::StyleNames[i]);

  cbxVclStyles->ItemIndex = cbxVclStyles->Items->IndexOf(TStyleManager::ActiveStyle->Name);
}
//---------------------------------------------------------------------------

void __fastcall TSearchBoxForm::cbxVclStylesChange(TObject *Sender)
{
  TStyleManager::SetStyle(cbxVclStyles->Text);
}
//---------------------------------------------------------------------------

void __fastcall TSearchBoxForm::grpSearchIndicatorClick(TObject *Sender)
{
  SB->SearchIndicator = (TSearchBoxIndicator)grpSearchIndicator->ItemIndex;
  if (SB->SearchIndicator == sbiText)
    lblSearchIndicatorHelp->Caption = IndicatorTextHelp;
  else
    lblSearchIndicatorHelp->Caption = IndicatorAudioHelp;
}
//---------------------------------------------------------------------------

void __fastcall TSearchBoxForm::chkEnabledClick(TObject *Sender)
{
  SB->Enabled = chkEnabled->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSearchBoxForm::grpBiDiModeClick(TObject *Sender)
{
  SB->BiDiMode = (TBiDiMode)grpBiDiMode->ItemIndex;
}
//---------------------------------------------------------------------------

void TSearchBoxForm::Log(UnicodeString Msg)
{
  int Idx = lstLog->Items->Add(Msg);
  lstLog->TopIndex = Idx;
}
//---------------------------------------------------------------------------

void __fastcall TSearchBoxForm::SBInvokeSearch(TObject *Sender)
{
  if (SB->SearchIndicator == sbiText)
    Log("Text: OnInvokeSearch - '" + SB->Text + "'");
  else
    Log("Audio: OnInvokeSearch");
}
//---------------------------------------------------------------------------


