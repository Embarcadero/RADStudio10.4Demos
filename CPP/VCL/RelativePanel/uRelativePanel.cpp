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

#include "uRelativePanel.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Vcl.WinXCtrls"
#pragma resource "*.dfm"
TRelativePanelForm *RelativePanelForm;
//---------------------------------------------------------------------------
__fastcall TRelativePanelForm::TRelativePanelForm(TComponent* Owner): TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRelativePanelForm::FormCreate(TObject *Sender)
{
  for (int i = 0; i < TStyleManager::StyleNames.Length; i++)
    cbxVclStyles->Items->Add(TStyleManager::StyleNames[i]);

  cbxVclStyles->ItemIndex = cbxVclStyles->Items->IndexOf(TStyleManager::ActiveStyle->Name);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxVclStylesChange(TObject *Sender)
{
  TStyleManager::SetStyle(cbxVclStyles->Text);
}
//---------------------------------------------------------------------------

TControl* TRelativePanelForm::SelectedControl(TComboBox *aComboBox)
{
  if (SameText(aComboBox->Items->Strings[aComboBox->ItemIndex], "Edit1"))
    return Edit1;
  else if (SameText(aComboBox->Items->Strings[aComboBox->ItemIndex], "Button1"))
    return Button1;
  else if (SameText(aComboBox->Items->Strings[aComboBox->ItemIndex], "Shape1"))
    return Shape1;
  else
    return NULL;
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbAlignBottomWithPanelClick(TObject *Sender)
{
  TCheckBox *CheckBox = static_cast<TCheckBox*>(Sender);
  RelativePanel1->ControlCollection->Items[CheckBox->Tag]->AlignBottomWithPanel = CheckBox->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbAlignHorizontalCenterWithPanelClick(TObject *Sender)
{
  TCheckBox *CheckBox = static_cast<TCheckBox*>(Sender);
  RelativePanel1->ControlCollection->Items[CheckBox->Tag]->AlignHorizontalCenterWithPanel = CheckBox->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbAlignLeftWithPanelClick(TObject *Sender)
{
  TCheckBox *CheckBox = static_cast<TCheckBox*>(Sender);
  RelativePanel1->ControlCollection->Items[CheckBox->Tag]->AlignLeftWithPanel = CheckBox->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbAlignRightWithPanelClick(TObject *Sender)
{
  TCheckBox *CheckBox = static_cast<TCheckBox*>(Sender);
  RelativePanel1->ControlCollection->Items[CheckBox->Tag]->AlignRightWithPanel = CheckBox->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbAlignTopWithPanelClick(TObject *Sender)
{
  TCheckBox *CheckBox = static_cast<TCheckBox*>(Sender);
  RelativePanel1->ControlCollection->Items[CheckBox->Tag]->AlignTopWithPanel = CheckBox->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbAlignVerticalCenterWithPanelClick(TObject *Sender)
{
  TCheckBox *CheckBox = static_cast<TCheckBox*>(Sender);
  RelativePanel1->ControlCollection->Items[CheckBox->Tag]->AlignVerticalCenterWithPanel = CheckBox->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxAboveChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->Above = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxAlignBottomWithChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->AlignBottomWith = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxAlignHorizontalCenterWithChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->AlignHorizontalCenterWith = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxAlignLeftWithChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->AlignLeftWith = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxAlignRightWithChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->AlignRightWith = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxAlignTopWithChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->AlignTopWith = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxAlignVerticalCenterWithChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->AlignVerticalCenterWith = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxBelowChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->Below = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxRightOfChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->RightOf = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::cbxLeftOfChange(TObject *Sender)
{
  TComboBox *ComboBox = static_cast<TComboBox*>(Sender);
  RelativePanel1->ControlCollection->Items[ComboBox->Tag]->LeftOf = SelectedControl(ComboBox);
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::SampleControlMouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift, int X, int Y)
{
  if (Button == mbLeft)
  {
    TControl *Ctrl = static_cast<TControl*>(Sender);
    Ctrl->BeginDrag(true);
    FStartDragPosOffset.SetLocation(X, Y);

    PageControl1->ActivePageIndex = Ctrl->Tag;
  }
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::RelativePanel1DragDrop(TObject *Sender, TObject *Source, int X, int Y)
{
  TControl *Ctrl = static_cast<TControl*>(Source);
  Ctrl->Left = X - FStartDragPosOffset.X;
  Ctrl->Top = Y - FStartDragPosOffset.Y;
}
//---------------------------------------------------------------------------

void __fastcall TRelativePanelForm::RelativePanel1DragOver(TObject *Sender, TObject *Source, int X, int Y, TDragState State,
          bool &Accept)
{
  Accept = true;
}
//---------------------------------------------------------------------------

