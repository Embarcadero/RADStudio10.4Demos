//---------------------------------------------------------------------------

// This software is Copyright (c) 2017 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uCardPanel.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Vcl.WinXPanels"
#pragma resource "*.dfm"
TCardPanelForm *CardPanelForm;
//---------------------------------------------------------------------------
__fastcall TCardPanelForm::TCardPanelForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCardPanelForm::FormCreate(TObject *Sender)
{
  CardPanel1->ActiveCardIndex = 0;

  for (int i = 0; i < TStyleManager::StyleNames.Length; i++)
    cbxVclStyles->Items->Add(TStyleManager::StyleNames[i]);

  cbxVclStyles->ItemIndex = cbxVclStyles->Items->IndexOf(TStyleManager::ActiveStyle->Name);
}
//---------------------------------------------------------------------------

void __fastcall TCardPanelForm::cbxVclStylesChange(TObject *Sender)
{
  TStyleManager::SetStyle(cbxVclStyles->Text);
}
//---------------------------------------------------------------------------

void __fastcall TCardPanelForm::chkLoopClick(TObject *Sender)
{
  CardPanel1->Loop = chkLoop->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCardPanelForm::actNextCardExecute(TObject *Sender)
{
  CardPanel1->NextCard();
}
//---------------------------------------------------------------------------


void __fastcall TCardPanelForm::actPreviousCardExecute(TObject *Sender)
{
  CardPanel1->PreviousCard();
}
//---------------------------------------------------------------------------

