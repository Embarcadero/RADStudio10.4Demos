//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "formMergeMain.h"
#include "formMergeMainController.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMergeMain *frmMergeMain;
//---------------------------------------------------------------------------
__fastcall TfrmMergeMain::TfrmMergeMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TfrmMergeMain::FormCreate(TObject *Sender)
{
	Controller = new TMergeMainController(this, this);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMergeMain::FormDestroy(TObject *Sender)
{
    delete Controller;
}
//---------------------------------------------------------------------------


