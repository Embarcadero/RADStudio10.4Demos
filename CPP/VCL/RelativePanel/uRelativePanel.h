//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uRelativePanelH
#define uRelativePanelH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Themes.hpp>
#include <Vcl.Styles.hpp>
#include "Vcl.WinXCtrls.hpp"
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TRelativePanelForm : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label2;
	TLabel *Label32;
	TComboBox *cbxVclStyles;
	TRelativePanel *RelativePanel1;
	TEdit *Edit1;
	TButton *Button1;
	TShape *Shape1;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TLabel *Label1;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	TLabel *Label8;
	TLabel *Label9;
	TLabel *Label10;
	TLabel *Label11;
	TBevel *Bevel1;
	TCheckBox *cb1AlignLeftWithPanel;
	TCheckBox *cb1AlignHorizontalCenterWithPanel;
	TCheckBox *cb1AlignRightWithPanel;
	TCheckBox *cb1AlignTopWithPanel;
	TCheckBox *cb1AlignVerticalCenterWithPanel;
	TCheckBox *cb1AlignBottomWithPanel;
	TComboBox *cbx1LeftOf;
	TComboBox *cbx1AlignLeftWith;
	TComboBox *cbx1AlignHorizontalCenterWith;
	TComboBox *cbx1AlignRightWith;
	TComboBox *cbx1RightOf;
	TComboBox *cbx1Above;
	TComboBox *cbx1AlignTopWith;
	TComboBox *cbx1AlignVerticalCenterWith;
	TComboBox *cbx1AlignBottomWith;
	TComboBox *cbx1Below;
	TTabSheet *TabSheet2;
	TLabel *Label12;
	TLabel *Label13;
	TLabel *Label14;
	TLabel *Label15;
	TLabel *Label16;
	TLabel *Label17;
	TLabel *Label18;
	TLabel *Label19;
	TLabel *Label20;
	TLabel *Label21;
	TBevel *Bevel2;
	TCheckBox *cb2AlignLeftWithPanel;
	TCheckBox *cb2AlignHorizontalCenterWithPanel;
	TCheckBox *cb2AlignRightWithPanel;
	TCheckBox *cb2AlignTopWithPanel;
	TCheckBox *cb2AlignVerticalCenterWithPanel;
	TCheckBox *cb2AlignBottomWithPanel;
	TComboBox *cbx2LeftOf;
	TComboBox *cbx2AlignLeftWith;
	TComboBox *cbx2AlignHorizontalCenterWith;
	TComboBox *cbx2AlignRightWith;
	TComboBox *cbx2RightOf;
	TComboBox *cbx2Above;
	TComboBox *cbx2AlignTopWith;
	TComboBox *cbx2AlignVerticalCenterWith;
	TComboBox *cbx2AlignBottomWith;
	TComboBox *cbx2Below;
	TTabSheet *TabSheet3;
	TLabel *Label22;
	TLabel *Label23;
	TLabel *Label24;
	TLabel *Label25;
	TLabel *Label26;
	TLabel *Label27;
	TLabel *Label28;
	TLabel *Label29;
	TLabel *Label30;
	TLabel *Label31;
	TBevel *Bevel3;
	TCheckBox *cb3AlignLeftWithPanel;
	TCheckBox *cb3AlignHorizontalCenterWithPanel;
	TCheckBox *cb3AlignRightWithPanel;
	TCheckBox *cb3AlignTopWithPanel;
	TCheckBox *cb3AlignVerticalCenterWithPanel;
	TCheckBox *cb3AlignBottomWithPanel;
	TComboBox *cbx3LeftOf;
	TComboBox *cbx3AlignLeftWith;
	TComboBox *cbx3AlignHorizontalCenterWith;
	TComboBox *cbx3AlignRightWith;
	TComboBox *cbx3RightOf;
	TComboBox *cbx3Above;
	TComboBox *cbx3AlignTopWith;
	TComboBox *cbx3AlignVerticalCenterWith;
	TComboBox *cbx3AlignBottomWith;
	TComboBox *cbx3Below;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall cbxVclStylesChange(TObject *Sender);
	void __fastcall SampleControlMouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift, int X, int Y);
	void __fastcall cbAlignLeftWithPanelClick(TObject *Sender);
	void __fastcall cbAlignHorizontalCenterWithPanelClick(TObject *Sender);
	void __fastcall cbAlignRightWithPanelClick(TObject *Sender);
	void __fastcall cbAlignTopWithPanelClick(TObject *Sender);
	void __fastcall cbAlignVerticalCenterWithPanelClick(TObject *Sender);
	void __fastcall cbAlignBottomWithPanelClick(TObject *Sender);
	void __fastcall cbxLeftOfChange(TObject *Sender);
	void __fastcall cbxAlignLeftWithChange(TObject *Sender);
	void __fastcall cbxAlignHorizontalCenterWithChange(TObject *Sender);
	void __fastcall cbxAlignRightWithChange(TObject *Sender);
	void __fastcall cbxRightOfChange(TObject *Sender);
	void __fastcall cbxAboveChange(TObject *Sender);
	void __fastcall cbxAlignTopWithChange(TObject *Sender);
	void __fastcall cbxAlignVerticalCenterWithChange(TObject *Sender);
	void __fastcall cbxAlignBottomWithChange(TObject *Sender);
	void __fastcall cbxBelowChange(TObject *Sender);
    void __fastcall RelativePanel1DragDrop(TObject *Sender, TObject *Source, int X, int Y);
    void __fastcall RelativePanel1DragOver(TObject *Sender, TObject *Source, int X, int Y, TDragState State, bool &Accept);


private:	// User declarations
	TPoint FStartDragPosOffset;
public:		// User declarations
	__fastcall TRelativePanelForm(TComponent* Owner);
    TControl* SelectedControl(TComboBox *aComboBox);
};
//---------------------------------------------------------------------------
extern PACKAGE TRelativePanelForm *RelativePanelForm;
//---------------------------------------------------------------------------
#endif
