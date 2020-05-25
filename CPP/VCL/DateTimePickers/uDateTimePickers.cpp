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

#include "uDateTimePickers.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Vcl.WinXPickers"
#pragma resource "*.dfm"
TDateTimePickersForm *DateTimePickersForm;
//---------------------------------------------------------------------------
__fastcall TDateTimePickersForm::TDateTimePickersForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDateTimePickersForm::FormCreate(TObject *Sender)
{
  for (int i = 0; i < TStyleManager::StyleNames.Length; i++)
    cbxVclStyles->Items->Add(TStyleManager::StyleNames[i]);

  cbxVclStyles->ItemIndex = cbxVclStyles->Items->IndexOf(TStyleManager::ActiveStyle->Name);
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxVclStylesChange(TObject *Sender)
{
  TStyleManager::SetStyle(cbxVclStyles->Text);
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::spnDropDownCountClick(TObject *Sender, TUDBtnType Button)
{
  DatePicker1->DropDownCount = spnDropDownCount->Position;
  TimePicker1->DropDownCount = spnDropDownCount->Position;

}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::chkShowOkCancelClick(TObject *Sender)
{
  DatePicker1->ShowOkCancel = chkShowOkCancel->Checked;
  TimePicker1->ShowOkCancel = chkShowOkCancel->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxDateFormatsChange(TObject *Sender)
{
  DatePicker1->DateFormat = cbxDateFormats->Text;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxTimeFormatsChange(TObject *Sender)
{
  TimePicker1->TimeFormat = cbxTimeFormats->Text;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxMinuteIncrementsChange(TObject *Sender)
{
  TimePicker1->MinuteIncrement = StrToIntDef(cbxMinuteIncrements->Text, 1);
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxColorChange(TObject *Sender)
{
  DatePicker1->Color = cbxColor->Selected;
  TimePicker1->Color = cbxColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxFontColorChange(TObject *Sender)
{
  DatePicker1->Font->Color = cbxFontColor->Selected;
  TimePicker1->Font->Color = cbxFontColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxHotColorChange(TObject *Sender)
{
  DatePicker1->HotColor = cbxHotColor->Selected;
  TimePicker1->HotColor = cbxHotColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxHighlightColorChange(TObject *Sender)
{
  DatePicker1->HighlightColor = cbxHighlightColor->Selected;
  TimePicker1->HighlightColor = cbxHighlightColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxPopupColorChange(TObject *Sender)
{
  DatePicker1->PopupColor = cbxPopupColor->Selected;
  TimePicker1->PopupColor = cbxPopupColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxSelectionColorChange(TObject *Sender)
{
  DatePicker1->SelectionColor = cbxSelectionColor->Selected;
  TimePicker1->SelectionColor = cbxSelectionColor->Selected;
}
//---------------------------------------------------------------------------

void __fastcall TDateTimePickersForm::cbxSelectionFontColorChange(TObject *Sender)
{
  DatePicker1->SelectionFontColor = cbxSelectionFontColor->Selected;
  TimePicker1->SelectionFontColor = cbxSelectionFontColor->Selected;
}
//---------------------------------------------------------------------------


