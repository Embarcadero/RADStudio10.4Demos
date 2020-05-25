//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include "cspin.h"
#pragma resource "cspin.res" // contains up and down arrows
#pragma package(smart_init)

//!BB Hack until RTL/Lib fixes GetSystemMetrics being remapped to something that's not resolved by Linker
#define xGetSystemMetrics GetSystemMetrics

//---------------------------------------------------------------------------
// TCSpinButton

__fastcall TCSpinButton::TCSpinButton(TComponent *AOwner)
                      : TWinControl(AOwner)
{
  (((ControlStyle >> csAcceptsControls)
                  >> csSetCaption)
                  << csFramed)
                  << csOpaque;

  FUpButton = CreateButton();
  FDownButton = CreateButton();
  UpGlyph = NULL;
  DownGlyph = NULL;

  Width = 20;
  Height = 25;
  FFocusedButton = FUpButton;
}

__fastcall TCSpinButton::TCSpinButton(HWND Parent): TWinControl(Parent) 
{}

TTimerSpeedButton *__fastcall TCSpinButton::CreateButton(void)
{
  TTimerSpeedButton * Result;

  Result = new TTimerSpeedButton((TComponent *) this);
  Result->OnClick = BtnClick;
  Result->OnMouseDown = BtnMouseDown;
  Result->Visible = True;
  Result->Enabled = True;
  Result->TimeBtnState << tbAllowTimer;
  Result->NumGlyphs = 1;
  Result->Parent = this;

  return Result;
}

void __fastcall TCSpinButton::AdjustSize(int &W, int &H)
{
  if ((FUpButton == NULL))//||(ComponentState.Contains(csLoading)))
     return;

  if (W < 15)
      W = 15;

  FUpButton->SetBounds (0, 0, W, H / 2);
  FDownButton->SetBounds (0, FUpButton->Height - 1, W, H - FUpButton->Height + 1);
}

void __fastcall TCSpinButton::SetBounds(int ALeft, int ATop, int AWidth, int AHeight)
{
  int W, H;

  W = AWidth;
  H = AHeight;
  AdjustSize (W, H);
  TWinControl::SetBounds (ALeft, ATop, W, H);
}

void __fastcall TCSpinButton::WMSize(TWMSize &Message)
{
  int W, H;
  TWinControl::Dispatch(&Message);
  // check for minimum size
  W = Width;
  H = Height;
  AdjustSize (W, H);

  if ((W != Width) || (H != Height))
      TWinControl::SetBounds(Left, Top, W, H);

  Message.Result = 0;
}

void __fastcall TCSpinButton::WMSetFocus(TWMSetFocus &Message)
{
  FFocusedButton->TimeBtnState << tbFocusRect;
  FFocusedButton->Invalidate();
}

void __fastcall TCSpinButton::WMKillFocus(TWMKillFocus &Message)
{
  FFocusedButton->TimeBtnState >> tbFocusRect;
  FFocusedButton->Invalidate();
}

void __fastcall TCSpinButton::KeyDown(Word &Key,  TShiftState Shift)
{
  switch (Key) {
    case VK_UP:
          SetFocusBtn (FUpButton);
          FUpButton->Click();
          break;
    case VK_DOWN:
          SetFocusBtn (FDownButton);
          FDownButton->Click();
          break;
    case VK_SPACE:
        FFocusedButton->Click();
  }
}

void __fastcall TCSpinButton::BtnMouseDown(TObject *Sender, TMouseButton Button,
                                       TShiftState Shift, int X, int Y)
{
  if (Button == mbLeft) {
    SetFocusBtn ((TTimerSpeedButton*) Sender);
    if((FFocusControl != NULL) && ( FFocusControl->TabStop ) &&
      (FFocusControl->CanFocus()) && (GetFocus() != FFocusControl->Handle))
            FFocusControl->SetFocus();
    else if (TabStop && (GetFocus() != Handle) && CanFocus() )
      SetFocus();
  }
}

void __fastcall TCSpinButton::BtnClick(TObject *Sender)
{
  if (Sender == FUpButton) {
    if (FOnUpClick != NULL)
        FOnUpClick(this);
  }
  else
    if (FOnDownClick != NULL)
       FOnDownClick(this);
}

void __fastcall TCSpinButton::SetFocusBtn(TTimerSpeedButton *Btn)
{
  if (TabStop && CanFocus() &&  (Btn != FFocusedButton)) {
    FFocusedButton->TimeBtnState >> tbFocusRect;
    FFocusedButton = Btn;
    if (GetFocus() == Handle) {
       FFocusedButton->TimeBtnState << tbFocusRect;
       Invalidate();
    }
  }
}

void __fastcall TCSpinButton::WMGetDlgCode(TWMNoParams &Message)
{
  Message.Result = DLGC_WANTARROWS;
}

void __fastcall TCSpinButton::Loaded(void)
{

  int W, H;

  W = Width;
  H = Height;
  AdjustSize (W, H);

  if ((W != Width) || (H != Height))
    TWinControl::SetBounds(Left, Top, W, H);
}

Graphics::TBitmap *__fastcall TCSpinButton::GetUpGlyph(void)
{
  Graphics::TBitmap * Result;

  Result = FUpButton->Glyph;
  return Result;
}

void __fastcall TCSpinButton::SetUpGlyph(Graphics::TBitmap *Value)
{
  if (Value != NULL)
    FUpButton->Glyph = Value;
  else {
    FUpButton->Glyph->Handle = LoadBitmap(HInstance, "SpinUp");
    FUpButton->NumGlyphs = 1;
    FUpButton->Invalidate();
  }
}

Graphics::TBitmap *__fastcall TCSpinButton::GetDownGlyph(void)
{
  Graphics::TBitmap * Result;

  Result = FDownButton->Glyph;
  return Result;
}

void __fastcall TCSpinButton::SetDownGlyph(Graphics::TBitmap *Value)
{
  if (Value != NULL)
    FDownButton->Glyph = Value;
  else {
    FDownButton->Glyph->Handle = LoadBitmap(HInstance, "SpinDown");
    FDownButton->NumGlyphs = 1;
    FDownButton->Invalidate();
  }
}

// TCSpinEdit

__fastcall TCSpinEdit::TCSpinEdit(TComponent *AOwner) : TCustomEdit(AOwner)
{
  FButton = new TCSpinButton(this);

  FButton->Width = 15;
  FButton->Height = 17;
  FButton->Visible = True;
  FButton->Parent = this;
  FButton->FocusControl = this;
  FButton->OnUpClick = UpClick;
  FButton->OnDownClick = DownClick;
  Text = "0";
  ControlStyle >> csSetCaption;
  FIncrement = 1;
  FEditorEnabled = True;
}

__fastcall TCSpinEdit::TCSpinEdit(HWND Parent): TCustomEdit(Parent) 
{}

__fastcall TCSpinEdit::~TCSpinEdit(void)
{
  FButton = NULL;
}

void __fastcall TCSpinEdit::GetChildren(TGetChildProc Proc, TComponent * Root)
{
}

void __fastcall TCSpinEdit::KeyDown(Word &Key,  TShiftState Shift)
{
  if (Key == VK_UP)
    UpClick (this);
  else if (Key == VK_DOWN)
         DownClick (this);
  TCustomEdit::KeyDown(Key, Shift);
}

void __fastcall TCSpinEdit::KeyPress(Char& Key)
{
  if (!IsValidChar(Key)) {
    Key = 0;
    MessageBeep(0);
  }
  if (Key != 0)
    TCustomEdit::KeyPress(Key);
}

bool __fastcall TCSpinEdit::IsValidChar(Char Key)
{
  bool Result;
  if(((Key == FormatSettings.DecimalSeparator)       ||
      (Key == '+')                    ||
      (Key == '-')                    ||
     ((Key >= '0') && (Key <= '9')))  ||
     ((Key < 0x32) && (Key != Char(VK_RETURN))))
   Result = True;

  if (!(FEditorEnabled) &&
      Result &&
      ((Key >= 0x32) ||
       (Key == Char(VK_BACK)) ||
       (Key == Char(VK_DELETE))))
    Result = False;
  return Result;
}

void __fastcall TCSpinEdit::CreateParams(TCreateParams &Params)
{
  TCustomEdit::CreateParams(Params);
  //Params->Style &= ~WS_BORDER;
  Params.Style |=  ES_MULTILINE | WS_CLIPCHILDREN;
}

void __fastcall TCSpinEdit::CreateWnd()
{
  TCustomEdit::CreateWnd();
  SetEditRect();
}

void __fastcall TCSpinEdit::SetEditRect(void)
{
  TRect Loc;

  SendMessage(Handle, EM_GETRECT, 0, long(&Loc));
  Loc.Bottom = ClientHeight + 1;  // +1 is workaround for windows paint bug
  Loc.Right = ClientWidth - FButton->Width - 2;
  Loc.Top = 0;
  Loc.Left = 0;
  SendMessage(Handle, EM_SETRECTNP, 0, long(&Loc));
  SendMessage(Handle, EM_GETRECT, 0, long(&Loc));  // debug
}

void __fastcall TCSpinEdit::WMSize(TWMSize &Message)
{
  int MinHeight;

  MinHeight = GetMinHeight();
    // text edit bug: if size to less than minheight, then edit ctrl does
    //  not display the text
  if (Height < MinHeight)
    Height = MinHeight;
  else if (FButton != NULL) {
    if (NewStyleControls)
      FButton->SetBounds(Width - FButton->Width - 5, 0, FButton->Width, Height - 5);
    else FButton->SetBounds (Width - FButton->Width, 0, FButton->Width, Height);
    SetEditRect();
  };
}

int __fastcall TCSpinEdit::GetMinHeight(void)
{
  HDC DC;
  HFONT SaveFont;
  int I, Result;
  TTextMetric SysMetrics, Metrics;

  DC = GetDC(NULL);
  GetTextMetricsW(DC, &SysMetrics);
  SaveFont = HFONT(SelectObject(DC, Font->Handle));
  GetTextMetricsW(DC, &Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  I = SysMetrics.tmHeight;
  if (I > Metrics.tmHeight)
    I = Metrics.tmHeight;

  Result = Metrics.tmHeight + I / 4 + GetSystemMetrics(SM_CYBORDER) * 4 + 2;
  return Result;
}

void __fastcall TCSpinEdit::UpClick(TObject *Sender)
{
  if (ReadOnly)
    MessageBeep(0);
  else Value += FIncrement;
}

void __fastcall TCSpinEdit::DownClick(TObject *Sender)
{
  if (ReadOnly)
    MessageBeep(0);
  else
    Value -= FIncrement;
}

void __fastcall TCSpinEdit::WMPaste(TWMNoParams &Message)
{
  if (!FEditorEnabled || ReadOnly)
    return;
}

void __fastcall TCSpinEdit::WMCut(TWMNoParams &Message)
{
  if (!FEditorEnabled || ReadOnly)
    return;
}

void __fastcall TCSpinEdit::CMExit(TWMNoParams &Message)
{
  if (CheckValue (Value) != Value)
    SetValue (Value);
}

long __fastcall TCSpinEdit::GetValue(void)
{
  long Result;
  try {
    Result = Text.ToInt();
    }
  catch(...) {
	Text=System::String((int)FMinValue);
    return FMinValue;
  }
  return Result;
}

void __fastcall TCSpinEdit::SetValue(long NewValue)
{
  Text = System::String((int)CheckValue(NewValue));
}

long __fastcall TCSpinEdit::CheckValue(long NewValue)
{
  long Result;
  Result = NewValue;
  if (FMaxValue != FMinValue) {
    if (NewValue < FMinValue)
      Result = FMinValue;
    else if (NewValue > FMaxValue)
      Result = FMaxValue;
  }
  return Result;
}

void __fastcall TCSpinEdit::CMEnter(TWMNoParams &Message)
{
  if (AutoSelect && !(ControlState.Contains(csLButtonDown)))
    SelectAll();
}

// TTimerSpeedButton

 __fastcall TTimerSpeedButton::TTimerSpeedButton(TComponent *AOwner) :
                               TSpeedButton(AOwner) { }

__fastcall TTimerSpeedButton::~TTimerSpeedButton()
{
  if (FRepeatTimer != NULL)
    delete FRepeatTimer;
}

void __fastcall TTimerSpeedButton::MouseDown(TMouseButton Button,  TShiftState Shift,
                          int X, int Y)
{
  TSpeedButton::MouseDown (Button, Shift, X, Y);

  if (FTimeBtnState.Contains(tbAllowTimer))
  {
    if (FRepeatTimer == NULL)
      FRepeatTimer = new TTimer(this);

    FRepeatTimer->OnTimer = TimerExpired;
    FRepeatTimer->Interval = InitRepeatPause;
    FRepeatTimer->Enabled  = True;
  };
}

void __fastcall TTimerSpeedButton::MouseUp(TMouseButton Button,  TShiftState Shift,
                                    int X, int Y)
{
  TSpeedButton::MouseUp (Button, Shift, X, Y);
  if (FRepeatTimer != NULL)
    FRepeatTimer->Enabled  = false;
}

void __fastcall TTimerSpeedButton::TimerExpired(TObject *Sender)
{
  FRepeatTimer->Interval = RepeatPause;
  if ((FState == bsDown) && MouseCapture) {
    try {
      Click();
    }
    catch(...) {
      FRepeatTimer->Enabled = false;
      throw;
    }
  }
}

void __fastcall TTimerSpeedButton::Paint(void)
{
  TRect R;

  TSpeedButton::Paint();
  if (FTimeBtnState.Contains(tbFocusRect)) {
    R.Left = 0;
    R.Top = 0;
    R.Right = Width;
    R.Bottom = Height;
    InflateRect(&R, -3, -3);
    if (FState == bsDown)
      OffsetRect(&R, 1, 1);
    DrawFocusRect(Canvas->Handle, &R);
  }
}

