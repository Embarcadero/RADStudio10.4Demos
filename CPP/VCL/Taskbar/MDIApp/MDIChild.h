//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef MDIChildH
#define MDIChildH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.Win.TaskbarCore.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Taskbar.hpp>
//---------------------------------------------------------------------------
class TFrMDIChild : public TForm
{
__published:	// IDE-managed Components
	TImage *Image1;
	TTaskbar *Taskbar1;
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
	__fastcall TFrMDIChild(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrMDIChild *FrMDIChild;
//---------------------------------------------------------------------------
#endif
