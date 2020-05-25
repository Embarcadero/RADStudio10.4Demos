//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef LifeUnitH
#define LifeUnitH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include "LifeEngine.h"
//---------------------------------------------------------------------------
class TLifeForm : public TForm
{
__published:	// IDE-managed Components
	TPaintBox *PaintBox1;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TButton *Button1;
	TCheckBox *CheckBox1;
	TButton *Button2;
	TButton *Button3;
	TScrollBar *HorzScrollBar;
	TScrollBar *VertScrollBar;
	TButton *Button4;
	TOpenDialog *OpenDialog1;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall HorzScrollBarChange(TObject *Sender);
	void __fastcall VertScrollBarChange(TObject *Sender);
	void __fastcall PaintBox1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
		  int X, int Y);
	void __fastcall PaintBox1MouseMove(TObject *Sender, TShiftState Shift, int X, int Y);
	void __fastcall PaintBox1Paint(TObject *Sender);

private:	// User declarations
	TSize BoardSize;
	TLifeEngine * FLifeEngine;
	TLifeBoard FLifeBoard;
	double FGensPerSecond;
	double FMaxGensPerSecond;
	TPoint FViewOffset, FViewSize;
	void __fastcall LifeEngineUpdate(TObject * Sender);
public:		// User declarations
	__fastcall TLifeForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLifeForm *LifeForm;
//---------------------------------------------------------------------------
#endif
