//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef CGridH
#define CGridH
//----------------------------------------------------------------------------
#include <Menus.hpp>
#include <ExtCtrls.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Graphics.hpp>
#include <Classes.hpp>
#include <Messages.hpp>
#include <Windows.hpp>
#include <System.hpp>
#include <Consts.hpp>

//-- type declarations -------------------------------------------------------
namespace CColorgrd
{
enum TGridOrdering { go16x1, go8x2, go4x4, go2x8, go1x16 };

class PACKAGE TCColorGrid : public TCustomControl
{
private:
    TPaletteEntry FPaletteEntries[20];
    Boolean FClickEnablesColor;
    Integer FForegroundIndex;
    Integer FBackgroundIndex;
    Boolean FForegroundEnabled;
    Boolean FBackgroundEnabled;
    Integer FSelection;
    Integer FCellXSize;
    Integer FCellYSize;
    Integer FNumXSquares;
    Integer FNumYSquares;
    TGridOrdering FGridOrdering;
    Boolean FHasFocus;
    TNotifyEvent FOnChange;
    TMouseButton FButton;
    Boolean FButtonDown;
    void __fastcall DrawSquare(Integer Which, Boolean ShowSelector);
    void __fastcall DrawFgBg(void);
    void __fastcall UpdateCellSizes(Boolean DoRepaint);
    void __fastcall SetGridOrdering(TGridOrdering Value);
    TColor __fastcall GetForegroundColor(void);
    TColor __fastcall GetBackgroundColor(void);
    void __fastcall SetForegroundIndex(Integer Value);
    void __fastcall SetBackgroundIndex(Integer Value);
    void __fastcall SetSelection(Integer Value);
    void __fastcall EnableForeground(Boolean Value);
    void __fastcall EnableBackground(Boolean Value);
    MESSAGE void __fastcall WMSetFocus(TWMSetFocus &Message);
    MESSAGE void __fastcall WMKillFocus(TWMKillFocus &Message);
    MESSAGE void __fastcall WMGetDlgCode(TWMNoParams &Message);
    MESSAGE void __fastcall WMSize(TWMSize &Message);
    MESSAGE void __fastcall CMCtl3DChanged(TMessage &Message);

protected:
    DYNAMIC void __fastcall KeyDown(Word &Key,  TShiftState Shift);
    DYNAMIC void __fastcall MouseDown(TMouseButton Button,  TShiftState Shift, Integer X, Integer Y);
    DYNAMIC void __fastcall MouseMove( TShiftState Shift, Integer X, Integer Y);
    DYNAMIC void __fastcall MouseUp(TMouseButton Button,  TShiftState Shift, Integer X, Integer Y);
    virtual void __fastcall CreateWnd(void);
    virtual void __fastcall Paint(void);
    virtual void __fastcall Change(void);
    Integer __fastcall SquareFromPos(Integer X, Integer Y);

public:
    __fastcall virtual TCColorGrid(TComponent *AOwner);
    __fastcall TCColorGrid(HWND Parent);
    __property TColor ForegroundColor = {read=GetForegroundColor, nodefault};
    __property TColor BackgroundColor = {read=GetBackgroundColor, nodefault};

__published:
    __property Anchors ;
    __property Boolean ClickEnablesColor = {read=FClickEnablesColor, write=FClickEnablesColor, default=0};
    __property Constraints ;
    __property Ctl3D ;
    __property DragCursor ;
    __property DragMode ;
    __property Enabled ;
    __property TGridOrdering GridOrdering = {read=FGridOrdering, write=SetGridOrdering, default=2};
    __property Integer ForegroundIndex = {read=FForegroundIndex, write=SetForegroundIndex, default=0};
    __property Integer BackgroundIndex = {read=FBackgroundIndex, write=SetBackgroundIndex, default=0};
    __property Boolean ForegroundEnabled = {read=FForegroundEnabled, write=EnableForeground, default=1}
        ;
    __property Boolean BackgroundEnabled = {read=FBackgroundEnabled, write=EnableBackground, default=1}
        ;
    __property Font ;
    __property ParentCtl3D ;
    __property ParentFont ;
    __property ParentShowHint ;
// 	__property PopUpMenu ;
    __property Integer Selection = {read=FSelection, write=SetSelection, default=0};
    __property ShowHint ;
    __property TabOrder ;
    __property TabStop ;
    __property Visible ;
    __property TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
    __property OnClick ;
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
    VCL_MESSAGE_HANDLER(WM_SETFOCUS, TWMSetFocus, WMSetFocus);
    VCL_MESSAGE_HANDLER(WM_KILLFOCUS, TWMKillFocus, WMKillFocus);
    VCL_MESSAGE_HANDLER(WM_GETDLGCODE, TWMNoParams, WMGetDlgCode);
    VCL_MESSAGE_HANDLER(CM_CTL3DCHANGED,TMessage, CMCtl3DChanged);
END_MESSAGE_MAP(TCustomControl);
};

//-- var, const, procedure ---------------------------------------------------
#define NumberOfPaletteEntries Byte(20)
}	/* namespace CColorgrd */
using namespace CColorgrd;
//-- end unit ----------------------------------------------------------------
#endif // CGridH
