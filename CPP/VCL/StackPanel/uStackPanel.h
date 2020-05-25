//---------------------------------------------------------------------------

// This software is Copyright (c) 2017 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uStackPanelH
#define uStackPanelH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "Vcl.WinXPanels.hpp"
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TStackPanelForm : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TLabel *lblVclStyle;
	TLabel *lblSpacing;
	TLabel *lblPadding;
	TComboBox *cbxVclStyles;
	TRadioGroup *grpOrientation;
	TTrackBar *trkSpacing;
	TRadioGroup *grpPositioning;
	TTrackBar *trkPadding;
	TPanel *Panel2;
	TLabel *lblControlOverride;
	TRadioGroup *grpControlPositioning;
	TListBox *lstControls;
	TStackPanel *StackPanel1;
	TLabel *Label1;
	TEdit *Edit1;
	TButton *Button1;
	TMemo *Memo1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall cbxVclStylesChange(TObject *Sender);
	void __fastcall grpOrientationClick(TObject *Sender);
	void __fastcall grpPositioningClick(TObject *Sender);
	void __fastcall trkSpacingChange(TObject *Sender);
	void __fastcall trkPaddingChange(TObject *Sender);
	void __fastcall lstControlsClick(TObject *Sender);
	void __fastcall grpControlPositioningClick(TObject *Sender);
private:	// User declarations
	void __fastcall ResetControlWidths();
    void __fastcall ResetControlHeights();
public:		// User declarations
	__fastcall TStackPanelForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStackPanelForm *StackPanelForm;
//---------------------------------------------------------------------------
#endif
