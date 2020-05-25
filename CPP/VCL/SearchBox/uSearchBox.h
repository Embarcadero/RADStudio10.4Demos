//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uSearchBoxH
#define uSearchBoxH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "Vcl.WinXCtrls.hpp"
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TSearchBoxForm : public TForm
{
__published:	// IDE-managed Components
    TLabel *Label2;
    TLabel *Label1;
    TLabel *lblSearchIndicatorHelp;
    TRadioGroup *grpSearchIndicator;
    TComboBox *cbxVclStyles;
    TListBox *lstLog;
    TCheckBox *chkEnabled;
    TRadioGroup *grpBiDiMode;
    TSearchBox *SB;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall cbxVclStylesChange(TObject *Sender);
    void __fastcall SBInvokeSearch(TObject *Sender);
    void __fastcall grpSearchIndicatorClick(TObject *Sender);
    void __fastcall chkEnabledClick(TObject *Sender);
    void __fastcall grpBiDiModeClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TSearchBoxForm(TComponent* Owner);
    void Log(UnicodeString Msg);
    static const UnicodeString IndicatorTextHelp;
    static const UnicodeString IndicatorAudioHelp;
};
//---------------------------------------------------------------------------
extern PACKAGE TSearchBoxForm *SearchBoxForm;
//---------------------------------------------------------------------------
#endif
