//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef MainFrmH
#define MainFrmH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.ImageList.hpp>
#include <FMX.Colors.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Edit.hpp>
#include <FMX.EditBox.hpp>
#include <FMX.Forms.hpp>
#include <FMX.ImgList.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.ListBox.hpp>
#include <FMX.MultiView.hpp>
#include <FMX.NumberBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.TabControl.hpp>
#include <FMX.Types.hpp>
#include "FmxMultiViewCustomPresentation.h"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TPanel *DetailPanel;
	TToolBar *ToolBar1;
	TLabel *Label2;
	TSpeedButton *MasterButton;
	TLayout *Layout2;
	TLayout *Layout4;
	TLabel *Label5;
	TComboBox *cbMultiViewMode;
	TListBoxItem *ListBoxItem8;
	TListBoxItem *ListBoxItem9;
	TListBoxItem *ListBoxItem10;
	TListBoxItem *ListBoxItem11;
	TListBoxItem *ListBoxItem16;
	TListBoxItem *ListBoxItem17;
	TTabControl *TabControl1;
	TTabItem *TabItem1;
	TLayout *Layout3;
	TLabel *Label4;
	TComboBox *cbSlidingMode;
	TListBoxItem *ListBoxItem6;
	TListBoxItem *ListBoxItem7;
	TLayout *Layout5;
	TLabel *Label8;
	TNumberBox *nbTouchAreaSize;
	TLayout *Layout7;
	TLabel *Label11;
	TComboBox *cbSlidingDirection;
	TListBoxItem *ListBoxItem12;
	TListBoxItem *ListBoxItem13;
	TLayout *Layout8;
	TLabel *Label12;
	TNumberBox *nbDurationSliding;
	TTabItem *TabItem2;
	TLayout *Layout6;
	TLabel *Label10;
	TNumberBox *nbPopupHeight;
	TLayout *Layout12;
	TLabel *Label7;
	TNumberBox *nmAppearanceDuration;
	TLayout *Layout13;
	TLabel *Label9;
	TComboColorBox *cbPopoverTint;
	TTabItem *TabItem3;
	TLayout *Layout11;
	TLabel *Label6;
	TComboBox *cbSplitViewPlacement;
	TListBoxItem *ListBoxItem14;
	TListBoxItem *ListBoxItem15;
	TTabItem *Shadow;
	TLayout *Layout1;
	TLabel *Label3;
	TSwitch *swShadow;
	TLayout *Layout9;
	TLabel *Label13;
	TComboColorBox *cbShadowColor;
	TLayout *Layout10;
	TLabel *Label14;
	TNumberBox *nbShadowOpacity;
	TTabItem *TabItem4;
	TLayout *Layout14;
	TLabel *Label15;
	TNumberBox *nbSpace;
	TMultiView *MultiView1;
	TListBox *ListBox1;
	TListBoxItem *ListBoxItem1;
	TListBoxItem *ListBoxItem2;
	TListBoxItem *ListBoxItem3;
	TListBoxItem *ListBoxItem4;
	TToolBar *ToolBar2;
	TLabel *Label1;
	TSpeedButton *MasterButton2;
	TImageList *ImageList;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall cbMultiViewModeChange(TObject *Sender);
	void __fastcall swShadowSwitch(TObject *Sender);
	void __fastcall nbShadowOpacityChangeTracking(TObject *Sender);
	void __fastcall cbShadowColorChange(TObject *Sender);
	void __fastcall cbSlidingModeChange(TObject *Sender);
	void __fastcall nbTouchAreaSizeChange(TObject *Sender);
	void __fastcall cbSlidingDirectionChange(TObject *Sender);
	void __fastcall nbDurationSlidingChange(TObject *Sender);
	void __fastcall nmAppearanceDurationChange(TObject *Sender);
	void __fastcall cbPopoverTintChange(TObject *Sender);
	void __fastcall nbPopupHeightChange(TObject *Sender);
	void __fastcall cbSplitViewPlacementChange(TObject *Sender);
	void __fastcall MultiView1PresenterChanging(TObject *Sender, TMultiViewPresentationClass &PresenterClass);
	void __fastcall nbSpaceChange(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
