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

#include "uSplitView.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Vcl.WinXCtrls"
#pragma resource "*.dfm"
TSplitViewForm *SplitViewForm;
//---------------------------------------------------------------------------
__fastcall TSplitViewForm::TSplitViewForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSplitViewForm::FormCreate(TObject *Sender)
{
  for (int i = 0; i < TStyleManager::StyleNames.Length; i++)
    cbxVclStyles->Items->Add(TStyleManager::StyleNames[i]);

  cbxVclStyles->ItemIndex = cbxVclStyles->Items->IndexOf(TStyleManager::ActiveStyle->Name);
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::cbxVclStylesChange(TObject *Sender)
{
  TStyleManager::SetStyle(cbxVclStyles->Text);
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::imgMenuClick(TObject *Sender)
{
  if (SV->Opened)
    SV->Close();
  else
    SV->Open();
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::grpDisplayModeClick(TObject *Sender)
{
  SV->DisplayMode = (TSplitViewDisplayMode)grpDisplayMode->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::grpCloseStyleClick(TObject *Sender)
{
  SV->CloseStyle = (TSplitViewCloseStyle)grpCloseStyle->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::grpPlacementClick(TObject *Sender)
{
  SV->Placement = (TSplitViewPlacement)grpPlacement->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::SVClosed(TObject *Sender)
{
  // When TSplitView is closed, adjust ButtonOptions and Width
  catMenuItems->ButtonOptions = catMenuItems->ButtonOptions >> boShowCaptions;
  if (SV->CloseStyle == svcCompact)
    catMenuItems->Width = SV->CompactWidth;
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::SVClosing(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::SVOpened(TObject *Sender)
{
  // When not animating, change size of catMenuItems when TSplitView is opened
  catMenuItems->ButtonOptions = catMenuItems->ButtonOptions << boShowCaptions;
  catMenuItems->Width = SV->OpenedWidth;
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::SVOpening(TObject *Sender)
{
  // When animating, change size of catMenuItems at the beginning of open
  catMenuItems->ButtonOptions = catMenuItems->ButtonOptions << boShowCaptions;
  catMenuItems->Width = SV->OpenedWidth;
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::chkUseAnimationClick(TObject *Sender)
{
  SV->UseAnimation = chkUseAnimation->Checked;
  lblAnimationDelay->Enabled = SV->UseAnimation;
  trkAnimationDelay->Enabled = SV->UseAnimation;
  lblAnimationStep->Enabled = SV->UseAnimation;
  trkAnimationStep->Enabled = SV->UseAnimation;
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::trkAnimationDelayChange(TObject *Sender)
{
  SV->AnimationDelay = trkAnimationDelay->Position * 5;
  lblAnimationDelay->Caption = "Animation Delay (" + IntToStr(SV->AnimationDelay) + ")";
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::trkAnimationStepChange(TObject *Sender)
{
  SV->AnimationStep = trkAnimationStep->Position * 5;
  lblAnimationStep->Caption = "Animation Step (" + IntToStr(SV->AnimationStep) + ")";
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::actHomeExecute(TObject *Sender)
{
  Log(actHome->Caption + " Clicked");
  if (SV->Opened && chkCloseOnMenuClick->Checked)
    SV->Close();
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::actLayoutExecute(TObject *Sender)
{
  Log(actLayout->Caption + " Clicked");
  if (SV->Opened && chkCloseOnMenuClick->Checked)
    SV->Close();
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::actPowerExecute(TObject *Sender)
{
  Log(actPower->Caption + " Clicked");
  if (SV->Opened && chkCloseOnMenuClick->Checked)
    SV->Close();
}
//---------------------------------------------------------------------------

void __fastcall TSplitViewForm::catMenuItemsCategoryCollapase(TObject *Sender, TButtonCategory * const Category)
{
  // Prevent the catMenuItems Category group from being collapsed
  catMenuItems->Categories->Items[0]->Collapsed = false;
}
//---------------------------------------------------------------------------

void TSplitViewForm::Log(UnicodeString Msg)
{
  int Idx = lstLog->Items->Add(Msg);
  lstLog->TopIndex = Idx;
}
//---------------------------------------------------------------------------



