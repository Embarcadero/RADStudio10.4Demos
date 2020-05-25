//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#if !defined (REGISTER_ALL_CONTROLS)
  #include  "demolbl.h"
#else
  #include "source\demolbl.h"
#endif

#pragma resource "*.res"   //IDE links .res automatically for components
#pragma package(smart_init)

namespace Demolbl{
void __fastcall PACKAGE Register()
{
  TComponentClass classes[1] = {__classid(TDemoLabel)};
  RegisterComponents("Samples", classes, 0);
}
} //end namespace

__fastcall TDemoLabel::TDemoLabel(TComponent *AOwner):
	TGraphicControl(AOwner)
{
  FComponentStyle >> csInheritable;
  Width=64;
  Height=13;
}

void __fastcall	TDemoLabel::Notification(TComponent *AComponent, TOperation Operation)
{
  TGraphicControl::Notification(AComponent, Operation);
  if ((Operation == opRemove)  && (AComponent == FFocusControl))
    FFocusControl = 0;
}

void __fastcall	TDemoLabel::SetFocusControl(TWinControl *Value)
{
  FFocusControl = Value;

  // Calling FreeNotification ensures that this component will receive an
  // opRemove when Value is either removed from its owner or when it is
  // destroyed.

  Value->FreeNotification(Value);
}

void __fastcall	TDemoLabel::Paint()
{
  TRect Rect = ClientRect;
  Canvas->Font = Font;
  Canvas->Brush->Color = Color;
  Canvas->FillRect(Rect);
  DrawText(Canvas->Handle, Caption.c_str(), Caption.Length(), reinterpret_cast<RECT*>(&Rect),
    DT_EXPANDTABS | DT_WORDBREAK | DT_LEFT);
}

void __fastcall	TDemoLabel::CMDialogChar(TCMDialogKey &Message)
{
  if (FFocusControl != NULL &&
      Enabled == true &&
      IsAccel(Message.CharCode, Caption))
      if (FFocusControl->CanFocus()){
        FFocusControl->SetFocus();
        Message.Result = 1;
      }
}

void __fastcall	TDemoLabel::CMTextChanged(TMessage &Message)
{
  Invalidate();
}


