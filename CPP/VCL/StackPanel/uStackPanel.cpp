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

#include "uStackPanel.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Vcl.WinXPanels"
#pragma resource "*.dfm"
TStackPanelForm *StackPanelForm;
//---------------------------------------------------------------------------
__fastcall TStackPanelForm::TStackPanelForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TStackPanelForm::FormCreate(TObject *Sender)
{
  for (int i = 0; i < TStyleManager::StyleNames.Length; i++)
	cbxVclStyles->Items->Add(TStyleManager::StyleNames[i]);

  cbxVclStyles->ItemIndex = cbxVclStyles->Items->IndexOf(TStyleManager::ActiveStyle->Name);
}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::cbxVclStylesChange(TObject *Sender)
{
  TStyleManager::SetStyle(cbxVclStyles->Text);
}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::grpOrientationClick(TObject *Sender)
{
  StackPanel1->Orientation = (TStackPanelOrientation) grpOrientation->ItemIndex;
  if (StackPanel1->Orientation == spoVertical)
  {
	grpPositioning->Caption = "Horizontal Positioning";
	grpPositioning->Items->Clear();
	grpPositioning->Items->Add("sphpLeft");
	grpPositioning->Items->Add("sphpCenter");
	grpPositioning->Items->Add("sphpRight");
	grpPositioning->Items->Add("sphpFill");
	grpPositioning->ItemIndex = (int) StackPanel1->HorizontalPositioning - 1;

	grpControlPositioning->Items->Clear();
	grpControlPositioning->Items->Add("sphpDefault");
	grpControlPositioning->Items->Add("sphpLeft");
	grpControlPositioning->Items->Add("sphpCenter");
	grpControlPositioning->Items->Add("sphpRight");
	grpControlPositioning->Items->Add("sphpFill");
	grpControlPositioning->ItemIndex = -1;
  }
  else
  {
	grpPositioning->Caption = "Vertical Positioning";
	grpPositioning->Items->Clear();
	grpPositioning->Items->Add("spvpTop");
	grpPositioning->Items->Add("spvpCenter");
	grpPositioning->Items->Add("spvpBottom");
	grpPositioning->Items->Add("spvpFill");
	grpPositioning->ItemIndex = (int) StackPanel1->VerticalPositioning - 1;

	grpControlPositioning->Items->Clear();
	grpControlPositioning->Items->Add("spvpDefault");
	grpControlPositioning->Items->Add("spvpTop");
	grpControlPositioning->Items->Add("spvpCenter");
	grpControlPositioning->Items->Add("spvpBottom");
	grpControlPositioning->Items->Add("spvpFill");
	grpControlPositioning->ItemIndex = -1;
  }
}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::grpPositioningClick(TObject *Sender)
{
  if (StackPanel1->Orientation == spoVertical)
  {
	StackPanel1->HorizontalPositioning = (TStackPanelHorizontalPositioning)(grpPositioning->ItemIndex + 1);
	ResetControlWidths();
  }
  else
  {
	StackPanel1->VerticalPositioning = (TStackPanelVerticalPositioning)(grpPositioning->ItemIndex + 1);
	ResetControlHeights();
  }
}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::trkSpacingChange(TObject *Sender)
{
  StackPanel1->Spacing = trkSpacing->Position;
}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::trkPaddingChange(TObject *Sender)
{
  int P = trkPadding->Position;
  StackPanel1->Padding->SetBounds( P, P, P, P );

}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::ResetControlWidths()
{
  Label1->Width = 31;
  Edit1->Width = 96;
  Button1->Width = 75;
  Memo1->Width = 136;
}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::ResetControlHeights()
{
  Label1->Height = 13;
  Edit1->Height = 21;
  Button1->Height = 25;
  Memo1->Height = 55;
}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::lstControlsClick(TObject *Sender)
{
  int Idx = lstControls->ItemIndex;
  if (StackPanel1->Orientation == spoVertical)
	grpControlPositioning->ItemIndex = (int)StackPanel1->ControlCollection->Items[Idx]->HorizontalPositioning;
  else
	grpControlPositioning->ItemIndex = (int)StackPanel1->ControlCollection->Items[Idx]->VerticalPositioning;
}
//---------------------------------------------------------------------------

void __fastcall TStackPanelForm::grpControlPositioningClick(TObject *Sender)
{
  int Idx = lstControls->ItemIndex;
  if (StackPanel1->Orientation == spoVertical)
	StackPanel1->ControlCollection->Items[Idx]->HorizontalPositioning = (TStackPanelControlHorizontalPositioning) grpControlPositioning->ItemIndex;
  else
	StackPanel1->ControlCollection->Items[Idx]->VerticalPositioning = (TStackPanelControlVerticalPositioning) grpControlPositioning->ItemIndex;
}
//---------------------------------------------------------------------------

