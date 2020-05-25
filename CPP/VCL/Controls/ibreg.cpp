//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop
#include <memory>       //for STL auto_ptr
#include "ibreg.h"
#include "samp.h"

#pragma package(smart_init)

#pragma resource "*.res"  

__fastcall TIBEventListProperty::TIBEventListProperty(_di_IDesigner ADesigner, int APropCount)
                                : TClassProperty(ADesigner, APropCount) { } 
__fastcall TIBEventListProperty::~TIBEventListProperty(void){}

 TPropertyAttributes __fastcall TIBEventListProperty::GetAttributes()
{
  return  (TClassProperty::GetAttributes() << paDialog ) >> paSubProperties;
}

void __fastcall TIBEventListProperty::Edit()
{
  std::auto_ptr<TStringList> Events(new TStringList());
  Events->Assign((TStrings*)GetOrdValue());
  if(Ibevnts::EditAlerterEvents(Events.get()))
    SetOrdValue(long(Events.get()));
}

namespace Ibsmp60
{
void __fastcall PACKAGE Register()
{
  TComponentClass classes[1] = {__classid(TIBEventAlerter)};
  RegisterComponents(LoadStr(Tab_101), classes, 0);
  RegisterPropertyEditor(__typeinfo(TStrings),
                         __classid(TIBEventAlerter),
                         "Events",
                         __classid(TIBEventListProperty));
}
}       /* namespace Ibreg */


