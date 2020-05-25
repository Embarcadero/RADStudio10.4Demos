//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uToggleSwitchH
#define uToggleSwitchH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "Vcl.WinXCtrls.hpp"
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TToggleSwitchForm : public TForm
{
__published:	// IDE-managed Components
    TLabel *lblVclStyle;
    TCheckBox *chkEnabled;
    TComboBox *cbxVclStyles;
    TGroupBox *grpStateCaptions;
    TLabel *lblCaptionOff;
    TLabel *lblCaptionOn;
    TEdit *edtCaptionOff;
    TEdit *edtCaptionOn;
    TCheckBox *chkShowStateCaptions;
    TRadioGroup *grpAlignment;
    TRadioGroup *grpState;
    TToggleSwitch *TS;
    TCheckBox *chkReadOnly;
    TGroupBox *grpColors;
    TLabel *lblColor;
    TLabel *lblThumbColor;
    TLabel *lblFrameColor;
    TColorBox *cbxColor;
    TColorBox *cbxThumbColor;
    TColorBox *cbxFrameColor;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall cbxVclStylesChange(TObject *Sender);
    void __fastcall grpStateClick(TObject *Sender);
    void __fastcall edtCaptionOffChange(TObject *Sender);
    void __fastcall edtCaptionOnChange(TObject *Sender);
    void __fastcall chkShowStateCaptionsClick(TObject *Sender);
    void __fastcall chkEnabledClick(TObject *Sender);
    void __fastcall chkReadOnlyClick(TObject *Sender);
    void __fastcall cbxColorChange(TObject *Sender);
    void __fastcall cbxThumbColorChange(TObject *Sender);
    void __fastcall cbxFrameColorChange(TObject *Sender);
    void __fastcall grpAlignmentClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TToggleSwitchForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TToggleSwitchForm *ToggleSwitchForm;
//---------------------------------------------------------------------------
#endif
