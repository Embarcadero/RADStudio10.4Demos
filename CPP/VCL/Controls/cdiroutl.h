//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef CDirOutlH
#define CDirOutlH
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Controls.hpp>
#include <Classes.hpp>
#include <Forms.hpp>
#include <Outline.hpp>
#include <Grids.hpp>
#include <ctype.h>
#include <dir.h>

//-- type declarations -------------------------------------------------------
namespace Cdiroutl {
enum TTextCase { tcLowerCase, tcUpperCase, tcAsIs };

class PACKAGE TCDirectoryOutline : public TCustomOutline
{
private:
    typedef System::String (__fastcall *TCaseFunction)(const System::String AString);
    static int __fastcall DriveToInt(char);
    static char __fastcall IntToDrive(int);
    long __fastcall GetChildNamed(const System::String& Name, long Item);
    bool Loading;
    
    static int const InvalidIndex = -1;
    static int const RootIndex = 1;
    static void* APointer;

    char FDrive;
    TFileName FDirectory;
    TNotifyEvent FOnChange;
    TTextCase FTextCase;
    TCaseFunction FCaseFunction;
    
    
protected:
    void __fastcall SetDrive(char NewDrive);
    void __fastcall SetDirectory(TFileName NewDirectory);
    void __fastcall SetTextCase(TTextCase NewTextCase);
    void __fastcall AssignCaseProc();
    void __fastcall WalkTree(const System::String& Dest);
    
    virtual void __fastcall BuildOneLevel(long RootItem);
    virtual void __fastcall BuildTree();
    virtual void __fastcall BuildSubTree(long RootItem);
    virtual void __fastcall Change();

    // virtual overrides from base
    DYNAMIC void __fastcall Click();
    virtual void __fastcall CreateWnd();
    DYNAMIC void __fastcall Expand(int Index);
    virtual void __fastcall Loaded();

    // helper statics
    static System::String CurDir();
    

public:
    virtual __fastcall TCDirectoryOutline(TComponent* Owner);
     __fastcall TCDirectoryOutline(HWND Parent);
    System::String __fastcall ForceCase(const System::String& AString);

    __property char Drive = { read = FDrive, write = SetDrive };
    __property TFileName Directory =
            { read = FDirectory, write = SetDirectory };

    // from base class
    __property Lines = { stored = false };

__published:
    // new properties
    __property TNotifyEvent OnChange = { read = FOnChange, write = FOnChange };
    __property TTextCase TextCase = { read = FTextCase, write = SetTextCase };

    // properties from base classes
    __property Align;
    __property Anchors; 
    __property BorderStyle;
    __property Color;
    __property Constraints; 
    __property Ctl3D;
    __property DragCursor;
    __property DragMode;
    __property Enabled;
    __property Font;
    __property ItemHeight;
    __property OnClick;
    __property OnCollapse;
    __property OnDblClick;
    __property OnDragDrop;
    __property OnDragOver;
    __property OnDrawItem;
    __property OnEndDock;
    __property OnEndDrag;
    __property OnEnter;
    __property OnExit;
    __property OnExpand;
    __property OnKeyDown;
    __property OnKeyPress;
    __property OnKeyUp;
    __property OnMouseDown;
    __property OnMouseMove;
    __property OnMouseUp;
    __property OnStartDock;
    __property OnStartDrag;
    __property Options;
    __property ParentColor;
    __property ParentCtl3D;
    __property ParentFont;
    __property ParentShowHint;
    __property PictureClosed;
    __property PictureLeaf;
    __property PictureOpen;
    __property PopupMenu;
    __property ScrollBars;
    __property Style;
    __property ShowHint;
    __property TabOrder;
    __property TabStop;
    __property Visible;
};
} //end namespace
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Cdiroutl;
#endif
//---------------------------------------------------------------------------
#endif // CDirOutlH
