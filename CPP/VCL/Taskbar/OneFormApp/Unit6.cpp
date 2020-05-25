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

#include "Unit6.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm6 *Form6;
//---------------------------------------------------------------------------
__fastcall TForm6::TForm6(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm6::Button2Click(TObject *Sender)
{
  Taskbar1->PreviewClipRegion->Left = EdLeft->Value;
  Taskbar1->PreviewClipRegion->Top = EdTop->Value;
  Taskbar1->PreviewClipRegion->Height = EdHeight->Value;
  Taskbar1->PreviewClipRegion->Width = EdWidth->Value;
  Taskbar1->ApplyClipAreaChanges();
}
//---------------------------------------------------------------------------
void __fastcall TForm6::Button3Click(TObject *Sender)
{
  Taskbar1->ClearClipArea();
}
//---------------------------------------------------------------------------
void __fastcall TForm6::Button1Click(TObject *Sender)
{
  Action1->Visible = cb1Visible->Checked;
  Action2->Visible = cb2Visible->Checked;
  Action3->Visible = cb3Visible->Checked;
  Taskbar1->ApplyButtonsChanges();

}
//---------------------------------------------------------------------------
void __fastcall TForm6::ComboBox1Change(TObject *Sender)
{

  switch (ComboBox1->ItemIndex) {
	case 0: Taskbar1->ProgressState = TTaskBarProgressState(0); break; //TTaskBarProgressState.None;
	case 1: Taskbar1->ProgressState = TTaskBarProgressState(2); break; //TTaskBarProgressState.Normal;
	case 2: Taskbar1->ProgressState = TTaskBarProgressState(1); break; //TTaskBarProgressState.Indeterminate;
	case 3: Taskbar1->ProgressState = TTaskBarProgressState(3); break; //TTaskBarProgressState.Error;
	case 4: Taskbar1->ProgressState = TTaskBarProgressState(4); break; //TTaskBarProgressState.Paused;
  };
}
//---------------------------------------------------------------------------
void __fastcall TForm6::TrackBar1Change(TObject *Sender)
{
  Taskbar1->ProgressMaxValue = TrackBar1->Max;
  Taskbar1->ProgressValue = TrackBar1->Position;
}
//---------------------------------------------------------------------------
void __fastcall TForm6::Image1Click(TObject *Sender)
{
  Taskbar1->OverlayIcon = Image1->Picture->Icon;
}
//---------------------------------------------------------------------------

void __fastcall TForm6::Image2Click(TObject *Sender)
{
  Taskbar1->OverlayIcon = Image2->Picture->Icon;
}
//---------------------------------------------------------------------------

void __fastcall TForm6::Image3Click(TObject *Sender)
{
  Taskbar1->OverlayIcon = Image3->Picture->Icon;
}
//---------------------------------------------------------------------------

void __fastcall TForm6::Action1Execute(TObject *Sender)
{
  if (EdBtn1->Text != ""){
	ShowMessage("Message from button:" + EdBtn1->Text);}
}
//---------------------------------------------------------------------------

void __fastcall TForm6::Action2Execute(TObject *Sender)
{
  if (EdBtn2->Text != ""){
	ShowMessage("Message from button:" + EdBtn2->Text);}
}
//---------------------------------------------------------------------------

void __fastcall TForm6::Action3Execute(TObject *Sender)
{
  if (EdBtn3->Text != ""){
	ShowMessage("Message from button:" + EdBtn3->Text);}
}
//---------------------------------------------------------------------------

