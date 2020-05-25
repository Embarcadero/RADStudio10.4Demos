//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef CSpinH
#define CSpinH
//----------------------------------------------------------------------------
#include <Buttons.hpp>
#include <Menus.hpp>
#include <Graphics.hpp>
#include <Forms.hpp>
#include <SysUtils.hpp>
#include <Messages.hpp>
#include <Controls.hpp>
#include <ExtCtrls.hpp>
#include <StdCtrls.hpp>
#include <Classes.hpp>
#include <Windows.hpp>
#include <System.hpp>

//-- type declarations -------------------------------------------------------
namespace Cspin{

static const Word InitRepeatPause = 0x190; // From dbctrls.hpp
static const Shortint RepeatPause = 0x64;  // From dbctrls.hpp

class TCSpinButton;
class TTimerSpeedButton;
enum Spin_3 { tbFocusRect, tbAllowTimer };

typedef Set<Spin_3, tbFocusRect, tbAllowTimer>  TTimeBtnState;

class PACKAGE TTimerSpeedButton : public TSpeedButton
{
private:
    TTimer *FRepeatTimer;
    TTimeBtnState FTimeBtnState;
    void __fastcall TimerExpired(TObject *Sender);

protected:
    virtual void __fastcall Paint(void);
    DYNAMIC void __fastcall MouseDown(TMouseButton Button,  TShiftState Shift, int X, int Y);
    DYNAMIC void __fastcall MouseUp(TMouseButton Button,  TShiftState Shift, int X, int Y);

public:
    __fastcall virtual ~TTimerSpeedButton(void);
    __property TTimeBtnState TimeBtnState = {read=FTimeBtnState, write=FTimeBtnState, nodefault};
    __fastcall virtual TTimerSpeedButton(TComponent *AOwner);
};

class PACKAGE TCSpinButton : public TWinControl
{
    TTimerSpeedButton *FUpButton;
    TTimerSpeedButton *FDownButton;
    TTimerSpeedButton *FFocusedButton;
    TWinControl *FFocusControl;
    TNotifyEvent FOnUpClick;
    TNotifyEvent FOnDownClick;
    TTimerSpeedButton *__fastcall CreateButton(void);
    Graphics::TBitmap *__fastcall GetUpGlyph(void);
    Graphics::TBitmap *__fastcall GetDownGlyph(void);
    void __fastcall SetUpGlyph(Graphics::TBitmap *Value);
    void __fastcall SetDownGlyph(Graphics::TBitmap *Value);
    void __fastcall BtnClick(TObject *Sender);
    void __fastcall BtnMouseDown(TObject *Sender, TMouseButton Button,  TShiftState Shift, int X, int Y);
    void __fastcall SetFocusBtn(TTimerSpeedButton *Btn);
#pragma warn -hid
    void __fastcall AdjustSize(int &W, int &H);
#pragma warn .hid
    MESSAGE void __fastcall WMSize(TWMSize &Message);
    MESSAGE void __fastcall WMSetFocus(TWMSetFocus &Message);
    MESSAGE void __fastcall WMKillFocus(TWMKillFocus &Message);
    MESSAGE void __fastcall WMGetDlgCode(TWMNoParams &Message);

protected:
    virtual void __fastcall Loaded(void);
    DYNAMIC void __fastcall KeyDown(Word &Key,  TShiftState Shift);

public:
    __fastcall virtual TCSpinButton(TComponent *AOwner);
    __fastcall TCSpinButton(HWND Parent);
    virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);

__published:
    __property Align ;
    __property Anchors ;
    __property Constraints ;
    __property Ctl3D ;
    __property Graphics::TBitmap * DownGlyph = {read=GetDownGlyph, write=SetDownGlyph, nodefault};
    __property DragCursor ;
    __property DragMode ;
    __property Enabled ;
    __property TWinControl * FocusControl = {read=FFocusControl, write=FFocusControl, nodefault};
    __property ParentCtl3D ;
    __property ParentShowHint ;
    __property PopupMenu ;
    __property ShowHint ;
    __property TabOrder ;
    __property TabStop ;
    __property Graphics::TBitmap * UpGlyph = {read=GetUpGlyph, write=SetUpGlyph, nodefault};
    __property Visible ;
    __property TNotifyEvent OnDownClick = {read=FOnDownClick, write=FOnDownClick};
    __property OnDragDrop ;
    __property OnDragOver ;
    __property OnEndDock ;
    __property OnEndDrag ;
    __property OnEnter ;
    __property OnExit ;
    __property OnStartDock ;
    __property OnStartDrag ;
    __property TNotifyEvent OnUpClick = {read=FOnUpClick, write=FOnUpClick};
    __fastcall virtual ~TCSpinButton(void) { }
BEGIN_MESSAGE_MAP
    VCL_MESSAGE_HANDLER(WM_SIZE, TWMSize, WMSize);
    VCL_MESSAGE_HANDLER(WM_SETFOCUS, TWMSetFocus, WMSetFocus);
    VCL_MESSAGE_HANDLER(WM_KILLFOCUS, TWMKillFocus, WMKillFocus);
    VCL_MESSAGE_HANDLER(WM_GETDLGCODE, TWMNoParams, WMGetDlgCode);
END_MESSAGE_MAP(TWinControl);
};

class PACKAGE TCSpinEdit : public TCustomEdit
{
private:
    long FMinValue;
    long FMaxValue;
    TCanvas *FCanvas;
    long FIncrement;
    TCSpinButton *FButton;
    bool FEditorEnabled;
    int __fastcall GetMinHeight(void);
    long __fastcall GetValue(void);
    long __fastcall CheckValue(long NewValue);
    void __fastcall SetValue(long NewValue);
    void __fastcall SetEditRect(void);
    MESSAGE void __fastcall WMSize(TWMSize &Message);
    MESSAGE void __fastcall CMEnter(TWMNoParams &Message);
    MESSAGE void __fastcall CMExit(TWMNoParams &Message);
    MESSAGE void __fastcall WMPaste(TWMNoParams &Message);
    MESSAGE void __fastcall WMCut(TWMNoParams &Message);

protected:
    DYNAMIC void __fastcall GetChildren(TGetChildProc Proc, TComponent * Root);
    virtual bool __fastcall IsValidChar(Char Key);
    virtual void __fastcall UpClick(TObject *Sender);
    virtual void __fastcall DownClick(TObject *Sender);
    DYNAMIC void __fastcall KeyDown(Word &Key,  TShiftState Shift);
    DYNAMIC void __fastcall KeyPress(Char &Key);
    virtual void __fastcall CreateParams(TCreateParams &Params);
    virtual void __fastcall CreateWnd(void);

public:
    __fastcall virtual TCSpinEdit(TComponent *AOwner);
    __fastcall TCSpinEdit(HWND Parent);
    __fastcall virtual ~TCSpinEdit(void);
    __property TCSpinButton * Button = {read=FButton, nodefault};

__published:
    __property Anchors ;
    __property AutoSelect ;
    __property AutoSize ;
    __property Color ;
    __property Constraints ;
    __property Ctl3D ;
    __property DragCursor ;
    __property DragMode ;
    __property bool EditorEnabled = {read=FEditorEnabled, write=FEditorEnabled, default=1};
    __property Enabled ;
    __property Font ;
    __property long Increment = {read=FIncrement, write=FIncrement, default=1};
    __property long MaxValue = {read=FMaxValue, write=FMaxValue, nodefault};
    __property long MinValue = {read=FMinValue, write=FMinValue, nodefault};
    __property ParentColor ;
    __property ParentCtl3D ;
    __property ParentFont ;
    __property ParentShowHint ;
    __property PopupMenu ;
    __property ReadOnly ;
    __property ShowHint ;
    __property TabOrder ;
    __property TabStop ;
    __property long Value = {read=GetValue, write=SetValue, nodefault};
    __property Visible ;
    __property OnChange ;
    __property OnClick ;
    __property OnDblClick ;
    __property OnDragDrop ;
    __property OnDragOver ;
    __property OnEndDrag ;
    __property OnEnter ;
    __property OnExit ;
    __property OnKeyDown ;
    __property OnKeyPress ;
    __property OnKeyUp ;
    __property OnMouseDown ;
    __property OnMouseMove ;
    __property OnMouseUp ;
    __property OnStartDrag ;
BEGIN_MESSAGE_MAP
    VCL_MESSAGE_HANDLER(WM_SIZE, TWMSize, WMSize);
    VCL_MESSAGE_HANDLER(CM_ENTER, TWMNoParams, CMEnter);
    VCL_MESSAGE_HANDLER(CM_EXIT, TWMNoParams, CMExit);
    VCL_MESSAGE_HANDLER(WM_PASTE, TWMNoParams, WMPaste);
    VCL_MESSAGE_HANDLER(WM_CUT, TWMNoParams, WMCut);
END_MESSAGE_MAP(TCustomEdit);
};

//-- var, const, procedure ---------------------------------------------------
//-- template instantiations -------------------------------------------------

//-- end unit ----------------------------------------------------------------
} //end namespace Cspin

#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Cspin;
#endif

#endif // CSpinH
