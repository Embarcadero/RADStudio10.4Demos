//---------------------------------------------------------------------------

// This software is Copyright (c) 2017 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uDateTimePickersH
#define uDateTimePickersH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "Vcl.WinXPickers.hpp"
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TDateTimePickersForm : public TForm
{
__published:	// IDE-managed Components
	TLabel *lblVclStyle;
	TLabel *Label1;
	TLabel *lblDateFormats;
	TLabel *lblTimeFormats;
	TComboBox *cbxVclStyles;
	TCheckBox *chkShowOkCancel;
	TGroupBox *grpColors;
	TLabel *lblColor;
	TLabel *lblHighlightColor;
	TLabel *lblPopupColor;
	TLabel *lblSelectionColor;
	TLabel *lblSelectionFontColor;
	TLabel *lblFontColor;
	TLabel *lblHotColor;
	TColorBox *cbxColor;
	TColorBox *cbxHighlightColor;
	TColorBox *cbxPopupColor;
	TColorBox *cbxSelectionColor;
	TColorBox *cbxSelectionFontColor;
	TColorBox *cbxFontColor;
	TColorBox *cbxHotColor;
	TDatePicker *DatePicker1;
	TTimePicker *TimePicker1;
	TUpDown *spnDropDownCount;
	TEdit *edtDropDownCount;
	TComboBox *cbxDateFormats;
	TComboBox *cbxTimeFormats;
	TLabel *lblMinuteIncrement;
	TComboBox *cbxMinuteIncrements;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall cbxVclStylesChange(TObject *Sender);
	void __fastcall spnDropDownCountClick(TObject *Sender, TUDBtnType Button);
	void __fastcall chkShowOkCancelClick(TObject *Sender);
	void __fastcall cbxDateFormatsChange(TObject *Sender);
	void __fastcall cbxTimeFormatsChange(TObject *Sender);
	void __fastcall cbxColorChange(TObject *Sender);
	void __fastcall cbxFontColorChange(TObject *Sender);
	void __fastcall cbxHotColorChange(TObject *Sender);
	void __fastcall cbxHighlightColorChange(TObject *Sender);
	void __fastcall cbxPopupColorChange(TObject *Sender);
	void __fastcall cbxSelectionColorChange(TObject *Sender);
	void __fastcall cbxSelectionFontColorChange(TObject *Sender);
	void __fastcall cbxMinuteIncrementsChange(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TDateTimePickersForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDateTimePickersForm *DateTimePickersForm;
//---------------------------------------------------------------------------
#endif
