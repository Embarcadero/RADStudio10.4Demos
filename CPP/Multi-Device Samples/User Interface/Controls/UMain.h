//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef UMainH
#define UMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.DateTimeCtrls.hpp>
#include <FMX.Edit.hpp>
#include <FMX.ExtCtrls.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.ListBox.hpp>
#include <FMX.Memo.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.TabControl.hpp>
#include <FMX.Types.hpp>
#include <FMX.ComboEdit.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.EditBox.hpp>
#include <FMX.SearchBox.hpp>
#include <FMX.SpinBox.hpp>
#include <FMX.ScrollBox.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TTabControl *TabControl1;
	TTabItem *ToolBarPage;
	TToolBar *ToolBar1;
	TSpeedButton *SpeedButton12;
	TSpeedButton *SpeedButton13;
	TSpeedButton *SpeedButton1;
	TSpeedButton *SpeedButton2;
	TSpeedButton *SpeedButton10;
	TToolBar *ToolBar13;
	TSpeedButton *SpeedButton7;
	TToolBar *ToolBar2;
	TLabel *Label1;
	TSpeedButton *SpeedButton4;
	TSpeedButton *SpeedButton6;
	TSpeedButton *SpeedButton79;
	TSpeedButton *SpeedButton80;
	TGroupBox *GroupBox1;
	TLayout *Layout2;
	TEdit *Edit2;
	TEdit *Edit5;
	TClearEditButton *ClearEditButton2;
	TSpeedButton *SpeedButton3;
	TTabItem *ToolButtonPage;
	TToolBar *ToolBar5;
	TSpeedButton *SpeedButton27;
	TSpeedButton *SpeedButton31;
	TSpeedButton *SpeedButton30;
	TSpeedButton *SpeedButton29;
	TSpeedButton *SpeedButton23;
	TSpeedButton *SpeedButton28;
	TSpeedButton *SpeedButton24;
	TSpeedButton *SpeedButton21;
	TSpeedButton *SpeedButton25;
	TSpeedButton *SpeedButton26;
	TSpeedButton *SpeedButton22;
	TToolBar *ToolBar6;
	TSpeedButton *SpeedButton49;
	TSpeedButton *SpeedButton54;
	TSpeedButton *SpeedButton50;
	TSpeedButton *SpeedButton58;
	TSpeedButton *SpeedButton55;
	TSpeedButton *SpeedButton56;
	TToolBar *ToolBar7;
	TSpeedButton *SpeedButton59;
	TSpeedButton *SpeedButton48;
	TSpeedButton *SpeedButton60;
	TSpeedButton *SpeedButton53;
	TSpeedButton *SpeedButton57;
	TSpeedButton *SpeedButton52;
	TSpeedButton *SpeedButton51;
	TToolBar *ToolBar8;
	TSpeedButton *SpeedButton72;
	TSpeedButton *SpeedButton47;
	TSpeedButton *SpeedButton42;
	TSpeedButton *SpeedButton43;
	TSpeedButton *SpeedButton62;
	TSpeedButton *SpeedButton5;
	TSpeedButton *SpeedButton65;
	TSpeedButton *SpeedButton63;
	TSpeedButton *SpeedButton64;
	TSpeedButton *SpeedButton61;
	TSpeedButton *SpeedButton8;
	TToolBar *ToolBar9;
	TSpeedButton *SpeedButton20;
	TSpeedButton *SpeedButton40;
	TSpeedButton *SpeedButton34;
	TSpeedButton *SpeedButton38;
	TSpeedButton *SpeedButton33;
	TSpeedButton *SpeedButton32;
	TSpeedButton *SpeedButton35;
	TSpeedButton *SpeedButton41;
	TSpeedButton *SpeedButton39;
	TSpeedButton *SpeedButton36;
	TSpeedButton *SpeedButton37;
	TTabItem *Tabs;
	TTabControl *TabControl2;
	TTabItem *TabItem1;
	TTabItem *TabItem10;
	TTabItem *TabItem11;
	TTabItem *TabItem12;
	TTabControl *TabControl3;
	TTabItem *TabItem5;
	TTabItem *TabItem6;
	TTabItem *TabItem7;
	TTabItem *TabItem8;
	TTabControl *TabControl4;
	TTabItem *TabItem2;
	TTabItem *TabItem3;
	TTabItem *TabItem4;
	TTabItem *TabItem9;
	TTabControl *TabControl5;
	TTabItem *TabItem13;
	TTabItem *TabItem14;
	TTabItem *TabItem16;
	TTabItem *TabItem15;
	TTabItem *TabItem17;
	TTabItem *ListBoxPage;
	TListBox *ListBox2;
	TListBoxGroupHeader *ListBoxGroupHeader2;
	TListBoxItem *ListBoxItem14;
	TListBoxItem *ListBoxItem16;
	TListBoxGroupHeader *ListBoxGroupHeader3;
	TListBoxItem *ListBoxItem17;
	TListBoxItem *ListBoxItem18;
	TListBoxItem *ListBoxItem19;
	TListBoxItem *ListBoxItem20;
	TListBoxHeader *ListBoxHeader1;
	TLabel *Label6;
	TSearchBox *SearchBox1;
	TListBox *ListBox3;
	TListBoxGroupHeader *ListBoxGroupHeader1;
	TListBoxItem *ListBoxItem15;
	TListBoxItem *ListBoxItem21;
	TListBoxGroupHeader *ListBoxGroupHeader4;
	TListBoxItem *ListBoxItem22;
	TLabel *Label13;
	TLabel *Label14;
	TLabel *Label15;
	TListBoxItem *ListBoxItem23;
	TListBoxItem *ListBoxItem24;
	TSwitch *Switch2;
	TListBoxItem *ListBoxItem25;
	TListBoxGroupFooter *ListBoxGroupFooter1;
	TListBoxItem *ListBoxItem7;
	TListBoxHeader *ListBoxHeader2;
	TLabel *Label7;
	TTabItem *ControlPage;
	TProgressBar *ProgressBar1;
	TTrackBar *TrackBar1;
	TProgressBar *ProgressBar2;
	TTrackBar *TrackBar2;
	TProgressBar *ProgressBar3;
	TTrackBar *TrackBar3;
	TProgressBar *ProgressBar4;
	TTrackBar *TrackBar4;
	TSwitch *Switch1;
	TLabel *Label5;
	TAniIndicator *AniIndicator1;
	TButton *Button15;
	TSpeedButton *SpeedButton68;
	TSpeedButton *SpeedButton69;
	TSpeedButton *SpeedButton70;
	TButton *Button7;
	TButton *Button8;
	TSpeedButton *SpeedButton73;
	TSpeedButton *SpeedButton74;
	TTabItem *TabItem18;
	TToolBar *ToolBar11;
	TEdit *Edit4;
	TClearEditButton *ClearEditButton1;
	TMemo *Memo1;
	TEdit *Edit3;
	TEdit *Edit1;
	TClearEditButton *ClearEditButton3;
	TComboBox *ComboBox1;
	TListBoxItem *ListBoxItem1;
	TListBoxItem *ListBoxItem2;
	TListBoxItem *ListBoxItem3;
	TListBoxItem *ListBoxItem4;
	TListBoxItem *ListBoxItem5;
	TListBoxItem *ListBoxItem6;
	TPopupBox *PopupBox1;
	TComboEdit *ComboEdit1;
	TSpinBox *SpinBox1;
	TDateEdit *DateEdit1;
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
