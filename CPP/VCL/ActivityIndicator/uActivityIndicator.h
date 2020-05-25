//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uActivityIndicatorH
#define uActivityIndicatorH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Themes.hpp>
#include <Vcl.Styles.hpp>
#include "Vcl.WinXCtrls.hpp"
//---------------------------------------------------------------------------
class TActivityIndicatorForm : public TForm
{
__published:	// IDE-managed Components
	TLabel *lblFrameDelay;
	TLabel *lblVclStyle;
	TLabel *lblFormColor;
	TCheckBox *chkAnimate;
	TTrackBar *trkFrameDelay;
	TRadioGroup *grpIndicatorType;
	TRadioGroup *grpIndicatorSize;
	TRadioGroup *grpIndicatorColor;
	TComboBox *cbxVclStyles;
	TActivityIndicator *AI;
	TColorBox *cbxFormColor;
	void __fastcall chkAnimateClick(TObject *Sender);
	void __fastcall trkFrameDelayChange(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall cbxVclStylesChange(TObject *Sender);
	void __fastcall cbxFormColorChange(TObject *Sender);
	void __fastcall grpIndicatorTypeClick(TObject *Sender);
	void __fastcall grpIndicatorSizeClick(TObject *Sender);
	void __fastcall grpIndicatorColorClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TActivityIndicatorForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TActivityIndicatorForm *ActivityIndicatorForm;
//---------------------------------------------------------------------------
#endif
