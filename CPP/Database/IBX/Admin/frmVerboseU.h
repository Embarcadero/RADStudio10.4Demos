//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef frmVerboseUH
#define frmVerboseUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
//---------------------------------------------------------------------------
class TfrmVerbose : public TForm
{
__published:	// IDE-managed Components
	TStatusBar *stbStatusBar;
	TRichEdit *edOutput;
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmVerbose(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmVerbose *frmVerbose;
//---------------------------------------------------------------------------
#endif
