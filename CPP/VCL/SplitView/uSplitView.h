//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uSplitViewH
#define uSplitViewH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "Vcl.WinXCtrls.hpp"
#include <System.Actions.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.CategoryButtons.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Imaging.pngimage.hpp>
#include <Vcl.ImgList.hpp>
//---------------------------------------------------------------------------
class TSplitViewForm : public TForm
{
__published:	// IDE-managed Components
    TPanel *pnlToolbar;
    TImage *imgMenu;
    TLabel *lblTitle;
    TSplitView *SV;
    TCategoryButtons *catMenuItems;
    TPanel *pnlSettings;
    TLabel *lblLog;
    TLabel *lblVclStyle;
    TRadioGroup *grpDisplayMode;
    TRadioGroup *grpPlacement;
    TRadioGroup *grpCloseStyle;
    TListBox *lstLog;
    TGroupBox *grpAnimation;
    TLabel *lblAnimationDelay;
    TLabel *lblAnimationStep;
    TCheckBox *chkUseAnimation;
    TTrackBar *trkAnimationDelay;
    TTrackBar *trkAnimationStep;
    TCheckBox *chkCloseOnMenuClick;
    TComboBox *cbxVclStyles;
    TImageList *imlIcons;
    TActionList *ActionList1;
    TAction *actHome;
    TAction *actLayout;
    TAction *actPower;
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall cbxVclStylesChange(TObject *Sender);
    void __fastcall imgMenuClick(TObject *Sender);
    void __fastcall grpDisplayModeClick(TObject *Sender);
    void __fastcall grpCloseStyleClick(TObject *Sender);
    void __fastcall grpPlacementClick(TObject *Sender);
    void __fastcall chkUseAnimationClick(TObject *Sender);
    void __fastcall trkAnimationDelayChange(TObject *Sender);
    void __fastcall trkAnimationStepChange(TObject *Sender);
    void __fastcall actHomeExecute(TObject *Sender);
    void __fastcall actLayoutExecute(TObject *Sender);
    void __fastcall actPowerExecute(TObject *Sender);
    void __fastcall SVClosed(TObject *Sender);
    void __fastcall SVClosing(TObject *Sender);
    void __fastcall SVOpened(TObject *Sender);
    void __fastcall SVOpening(TObject *Sender);
    void __fastcall catMenuItemsCategoryCollapase(TObject *Sender, TButtonCategory * const Category);
private:	// User declarations
public:		// User declarations
	__fastcall TSplitViewForm(TComponent* Owner);
    void Log(UnicodeString Msg);
};
//---------------------------------------------------------------------------
extern PACKAGE TSplitViewForm *SplitViewForm;
//---------------------------------------------------------------------------
#endif
