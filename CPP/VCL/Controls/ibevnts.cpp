//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#included in IBREG.CPP which #includes IBREG.H which
// in turn #includes INEVNTS.H.  Hence #including IBEVNTS.H here is redundant with
// no ramifications (there are sentries in the header file) but has been done
// just to clarify that the function and class implementations in this file are
// prototyped in INEVNTS.H
#include <memory>     //for STL auto_ptr
#if !defined (REGISTER_ALL_CONTROLS)
  #include  "ibevnts.h"
#else
  #include "source\ibevnts.h"
#endif
#pragma resource "*.dfm"
#pragma package(smart_init)

#include "ibctrls.h"

bool __fastcall Ibevnts::EditAlerterEvents(Classes::TStrings *Events)
{
  bool result = false;
  std::auto_ptr<TIBEAEventsEditor> EEditor(new TIBEAEventsEditor(Application));
  for(int i=0; i < Events->Count ;i++) //
  {
    EEditor->cEvents->Cells[1][i] = Events->Strings[i];
  }
  if( EEditor->ShowModal() == IDOK )
  {
    result = true;
    Events->Clear();
    for(int i=0; i < MaxEvents ;i++)
    {
      if ((EEditor->cEvents->Cells[1][i].Length()) != 0)
        Events->Add( EEditor->cEvents->Cells[1][i]);
    }
  }
  return result;
}

void __fastcall TIBEAEventsEditor::FormCreate(TObject *Sender)
{
  for(int i=1; i < MaxEvents; i++ ) 
      cEvents->Cells[0][i-1] = System::String(i);
  RequestedEvents->Caption = LoadStr(57810);
  bOK->Caption = LoadStr(57811);
  bCancel->Caption = LoadStr(57812);
}
