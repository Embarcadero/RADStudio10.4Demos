//---------------------------------------------------------------------------

// This software is Copyright (c) 2017 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uCardPanelH
#define uCardPanelH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Imaging.jpeg.hpp>
#include <Vcl.Touch.GestureMgr.hpp>
#include "Vcl.WinXPanels.hpp"
//---------------------------------------------------------------------------
class TCardPanelForm : public TForm
{
__published:	// IDE-managed Components
	TPanel *pnlToolbar;
	TLabel *lblGestureInfo;
	TLabel *lblVclStyle;
	TCheckBox *chkLoop;
	TButton *Button1;
	TButton *Button2;
	TComboBox *cbxVclStyles;
	TCardPanel *CardPanel1;
	TCard *Card1;
	TImage *Image1;
	TCard *Card2;
	TImage *Image2;
	TCard *Card3;
	TImage *Image3;
	TCard *Card4;
	TImage *Image4;
	TCard *Card5;
	TImage *Image5;
	TGestureManager *GestureManager1;
	TActionList *ActionList1;
	TAction *actNextCard;
	TAction *actPreviousCard;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall cbxVclStylesChange(TObject *Sender);
	void __fastcall chkLoopClick(TObject *Sender);
	void __fastcall actNextCardExecute(TObject *Sender);
	void __fastcall actPreviousCardExecute(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TCardPanelForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCardPanelForm *CardPanelForm;
//---------------------------------------------------------------------------
#endif
