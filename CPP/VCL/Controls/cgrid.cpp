//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include  "cgrid.h"
#include <Vcl.Consts.hpp>
#pragma package(smart_init)

namespace CColorgrd
{

__fastcall TCColorGrid::TCColorGrid(TComponent *AOwner):
         TCustomControl( AOwner )
{
  ControlStyle = ControlStyle;// + [csOpaque]; // cbf
  FGridOrdering = go4x4;
  FNumXSquares = 4;
  FNumYSquares = 4;
  FForegroundEnabled = True;
  FBackgroundEnabled = True;
  Color = TColor(clBtnFace);   // cbf assinging int to Tcolor
  Canvas->Brush->Style = bsSolid;
  Canvas->Pen->Color = clBlack;
  SetBounds(0, 0, 100, 100);
  GetPaletteEntries(HPALETTE(GetStockObject(DEFAULT_PALETTE)), 0, NumberOfPaletteEntries, FPaletteEntries);
}

__fastcall TCColorGrid::TCColorGrid(HWND Parent): TCustomControl(Parent)
{}

void __fastcall TCColorGrid::CreateWnd(void)
{
   TCustomControl::CreateWnd();
   SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) | WS_CLIPSIBLINGS);
}

//class TempRect
void __fastcall TCColorGrid::DrawSquare(Integer Which, Boolean ShowSelector)
{
  Integer WinTop, WinLeft;
  Integer PalIndex;
  TRect CellRect;
  if( Which >=0 && Which <= 15 )
  {
    if( Which < 8 )
      PalIndex = Which;
    else
      PalIndex = Which + 4;
    WinTop = ( Which/FNumXSquares ) * FCellYSize;
    WinLeft = (Which % FNumXSquares) * FCellXSize;
    CellRect = Bounds(WinLeft, WinTop, FCellXSize, FCellYSize);
    if( Ctl3D ) {
      Canvas->Pen->Color = TColor(clBtnFace);
      Canvas->Rectangle(RECT(CellRect).left,
                        RECT(CellRect).top,
                        RECT(CellRect).right,
                        RECT(CellRect).bottom);
      InflateRect(&CellRect, -1, -1);
      Extctrls::Frame3D(Canvas, CellRect, TColor(clBtnShadow), TColor(clBtnHighlight), 2);
    }
    else
      Canvas->Pen->Color = TColor(clBlack);
      TPaletteEntry temp = FPaletteEntries[PalIndex];
      Canvas->Brush->Color = TColor(RGB( temp.peRed, temp.peGreen, temp.peBlue));
      if( Ctl3D )
        Canvas->Pen->Color = TColor(RGB(temp.peRed, temp.peGreen, temp.peBlue));
    if( !ShowSelector )
      Canvas->Rectangle(RECT(CellRect).left,
                        RECT(CellRect).top,
                        RECT(CellRect).right,
                        RECT(CellRect).bottom);
    else
    {
      if(Ctl3D)
      {
        Canvas->Rectangle(RECT(CellRect).left,
                          RECT(CellRect).top,
                          RECT(CellRect).right,
                          RECT(CellRect).bottom);
        InflateRect(&CellRect, -1, -1);
        DrawFocusRect((HDC)Canvas->Handle, &CellRect);
      }
      else
      {
        Canvas->Pen->Color = clBlack;
        Canvas->Pen->Mode = pmNot;
        Canvas->Rectangle(RECT(CellRect).left,
                          RECT(CellRect).top,
                          RECT(CellRect).right,
                          RECT(CellRect).bottom);
        Canvas->Pen->Mode = pmCopy;
        Canvas->Rectangle(RECT(CellRect).left +2,
                          RECT(CellRect).top +2,
                          RECT(CellRect).right -2,
                          RECT(CellRect).bottom -2);
      }
    }
  }
}




int TernaryOp( Boolean Test, Integer ResultTrue, Integer ResultFalse )
{
   int Result;
   if( Test )
     Result = ResultTrue;
   else
     Result = ResultFalse;
   return Result;
}


#pragma warn -sig
void __fastcall TCColorGrid::DrawFgBg(void)
{
  TPaletteEntry TextColor;
  Integer PalIndex;
  System::String TheText;
  Integer OldBkMode;
  TRect R;

  OldBkMode = SetBkMode((HDC)Canvas->Handle, TRANSPARENT);
  if( FForegroundEnabled )
  {
    if( (FForegroundIndex == FBackgroundIndex) && FBackgroundEnabled )
	  TheText = Vcl_Consts_SFB;
	else
	  TheText = Vcl_Consts_SFG;
    if( FForegroundIndex < 8 )
      PalIndex = FForegroundIndex;
    else
      PalIndex = FForegroundIndex + 4;
    TextColor = FPaletteEntries[PalIndex];
	TextColor.peRed = TernaryOp(TextColor.peRed >= 0x80, 0, 0xFF);
	TextColor.peGreen = TernaryOp(TextColor.peGreen >= 0x80, 0, 0xFF);
	TextColor.peBlue = TernaryOp(TextColor.peBlue >= 0x80, 0, 0xFF);
	Canvas->Font->Color = TColor(RGB(TextColor.peRed, TextColor.peGreen, TextColor.peBlue));

	R.Left = (FForegroundIndex % FNumXSquares) * FCellXSize;
	R.Right = R.Left + FCellXSize;
	R.Top = (FForegroundIndex / FNumXSquares) * FCellYSize;
	R.Bottom = R.Top + FCellYSize;
	DrawTextW((HDC)Canvas->Handle, TheText.w_str(), -1, &R,
			 DT_NOCLIP | DT_SINGLELINE | DT_CENTER | DT_VCENTER);
  }
  if( FBackgroundEnabled )
  {
	if( (FForegroundIndex == FBackgroundIndex) && FForegroundEnabled )
	  TheText = Vcl_Consts_SFB;
	else
	  TheText = Vcl_Consts_SBG;
	if( FBackgroundIndex < 8 )
	  PalIndex = FBackgroundIndex;
	else
	  PalIndex = FBackgroundIndex + 4;

	TextColor = FPaletteEntries[PalIndex];
	TextColor.peRed = TernaryOp(TextColor.peRed >= 0x80, 0, 0xFF);
	TextColor.peGreen = TernaryOp(TextColor.peGreen >= 0x80, 0, 0xFF);
	TextColor.peBlue = TernaryOp(TextColor.peBlue >= 0x80, 0, 0xFF);
	Canvas->Font->Color = TColor(RGB(TextColor.peRed, TextColor.peGreen, TextColor.peBlue));
	R.Left = (FBackgroundIndex % FNumXSquares) * FCellXSize;
	R.Right = R.Left + FCellXSize;
	R.Top = (FBackgroundIndex / FNumXSquares) * FCellYSize;
	R.Bottom = R.Top + FCellYSize;
	DrawTextW((HDC)Canvas->Handle, TheText.w_str(), -1, &R,
			 DT_NOCLIP | DT_SINGLELINE | DT_CENTER | DT_VCENTER);
  }
  SetBkMode((HDC)Canvas->Handle, OldBkMode);
}
#pragma warn .sig

void __fastcall TCColorGrid::EnableForeground(Boolean Value)
{
  if( FForegroundEnabled == Value ) 
     return ;
  FForegroundEnabled = Value;
  DrawSquare(FForegroundIndex, (FForegroundIndex == FSelection) && FHasFocus);
  DrawFgBg();
}



void __fastcall TCColorGrid::EnableBackground(Boolean Value)
{
  if( FBackgroundEnabled == Value ) 
       return;
  FBackgroundEnabled = Value;
  DrawSquare(FBackgroundIndex, (FBackgroundIndex == FSelection) && FHasFocus);
  DrawFgBg();
}



TColor __fastcall TCColorGrid::GetForegroundColor(void)
{
  Integer PalIndex;
  if( FForegroundIndex < 8 )
    PalIndex = FForegroundIndex;
  else
    PalIndex = FForegroundIndex + 4;
    return TColor(RGB(FPaletteEntries[PalIndex].peRed,
                  FPaletteEntries[PalIndex].peGreen,
                  FPaletteEntries[PalIndex].peBlue) );
}


TColor __fastcall TCColorGrid::GetBackgroundColor(void)
{
  Integer PalIndex;

  if( FBackgroundIndex < 8 ) 
      PalIndex = FBackgroundIndex;
  else PalIndex = FBackgroundIndex + 4;
  return TColor( RGB(FPaletteEntries[PalIndex].peRed,
                 FPaletteEntries[PalIndex].peGreen,
                 FPaletteEntries[PalIndex].peBlue) );
}




void __fastcall TCColorGrid::WMSetFocus(TWMSetFocus &Message)
{
  FHasFocus = True;
  DrawSquare(FSelection, True);
  DrawFgBg();
}

void __fastcall TCColorGrid::WMKillFocus(TWMKillFocus &Message)
{
  FHasFocus = False;
  DrawSquare(FSelection, False);
  DrawFgBg();
}



void __fastcall TCColorGrid::KeyDown(Word &Key,  TShiftState Shift)
{
  Integer NewSelection;
  Integer Range;
  TCustomControl::KeyDown(Key, Shift);
  NewSelection = FSelection;
  Range = FNumXSquares * FNumYSquares;
  switch( Key )
  {
     case 0x46:
     case 0x66:
        if( !FForegroundEnabled && FClickEnablesColor ) {
          FForegroundEnabled = True;
          DrawSquare(FForegroundIndex, (FForegroundIndex == FSelection) && FHasFocus);
          FForegroundIndex = -1;
        }
        SetForegroundIndex(NewSelection);
        SetSelection(NewSelection);
        Click();
        break;
      case 0x42:
      case 0x62:
          if( !FBackgroundEnabled && FClickEnablesColor ) {
            FBackgroundEnabled = True;
            DrawSquare(FBackgroundIndex, (FBackgroundIndex == FSelection) && FHasFocus);
            FBackgroundIndex = -1;
          }
          SetBackgroundIndex(NewSelection);
          SetSelection(NewSelection);
          Click();
          break;
    case VK_HOME:
        NewSelection = 0;
        break;
    case VK_UP:
      if( FSelection >= FNumXSquares )
        NewSelection = FSelection - FNumXSquares;
      else
        if( FSelection != 0 )
          NewSelection = Range - FNumXSquares + FSelection - 1;
        else
          NewSelection = Range - 1;
      break;
    case VK_LEFT:
       if( FSelection !=  0 )
         NewSelection = FSelection - 1;
       else
         NewSelection = Range - 1;
       break;
    case VK_DOWN:
       if( FSelection + FNumXSquares < Range )
        NewSelection = FSelection + FNumXSquares;
       else
         if( FSelection != Range - 1 )
           NewSelection = FSelection % FNumXSquares + 1;
         else
           NewSelection = 0;
      break;
    case VK_SPACE:
    case VK_RIGHT:
      if( FSelection != Range - 1 )
        NewSelection = FSelection + 1;
      else
        NewSelection = 0;
      break;
    case VK_END:
       NewSelection = Range - 1;
        break;
    default:
    TCustomControl::KeyDown(Key, Shift);
    return;
  }  //end switch
  Key = 0;
  if( FSelection != NewSelection )
     SetSelection(NewSelection);
 }


void __fastcall TCColorGrid::WMGetDlgCode(TWMNoParams &Message)
{
  Message.Result = DLGC_WANTARROWS + DLGC_WANTCHARS;
}



void __fastcall TCColorGrid::WMSize(TWMSize &Message)
{
  UpdateCellSizes(False);
}

void __fastcall TCColorGrid::CMCtl3DChanged(TMessage &Message)
{
  Invalidate();
}

void __fastcall TCColorGrid::MouseDown(TMouseButton Button,  TShiftState Shift, Integer X, Integer Y)
{
  Integer Square;
  TCustomControl::MouseDown(Button, Shift, X, Y);
  FButton = Button;
  FButtonDown = True;
  Square = SquareFromPos(X, Y);
  if( Button == mbLeft ){
    if( !FForegroundEnabled && FClickEnablesColor ){
      FForegroundEnabled = True;
      DrawSquare(FForegroundIndex, (FForegroundIndex == FSelection) && FHasFocus );
      FForegroundIndex = -1;
    }
    SetForegroundIndex(Square);
  }
  else{
    MouseCapture = True;
    if( !FBackgroundEnabled && FClickEnablesColor ) {
      FBackgroundEnabled = True;
      DrawSquare(FBackgroundIndex, (FBackgroundIndex == FSelection) && FHasFocus);
      FBackgroundIndex = -1;
    }
    SetBackgroundIndex(Square);
  }
  SetSelection(Square);
  if( TabStop )
      SetFocus();
}


void __fastcall TCColorGrid::MouseMove( TShiftState Shift, Integer X, Integer Y)
{
  Integer Square;

  TCustomControl::MouseMove(Shift, X, Y);
  if( FButtonDown ){
    Square = SquareFromPos(X, Y);
    if( FButton == mbLeft )
      SetForegroundIndex(Square);
    else
      SetBackgroundIndex(Square);
    SetSelection(Square);
  }
}


void __fastcall TCColorGrid::MouseUp(TMouseButton Button,  TShiftState Shift, Integer X, Integer Y)
{
  TCustomControl::MouseUp(Button, Shift, X, Y);
  FButtonDown = False;
  if( FButton == mbRight )
     MouseCapture = False;
 }



void __fastcall TCColorGrid::Paint(void)
{
 Integer Row, Col, wEntryIndex;
 Canvas->Font = Font;
 for( Row = 0; Row < FNumYSquares; Row++ )
      for( Col = 0; Col < FNumXSquares; Col++ )
      {
       wEntryIndex = Row * FNumXSquares + Col;
       DrawSquare(wEntryIndex, False);
      }
  DrawSquare(FSelection, FHasFocus);
  DrawFgBg();
}


void __fastcall TCColorGrid::SetBackgroundIndex(Integer Value)
{
  if( (FBackgroundIndex != Value) && FBackgroundEnabled )
  {
    DrawSquare(FBackgroundIndex, (FBackgroundIndex == FSelection) && FHasFocus);
    FBackgroundIndex = Value;
    if( FBackgroundIndex == FForegroundIndex )
      DrawSquare(FBackgroundIndex, (FBackgroundIndex == FSelection) && FHasFocus);
    DrawFgBg();
    Change();
  }
}



void __fastcall TCColorGrid::SetForegroundIndex(Integer Value)
{
  if( (FForegroundIndex != Value) && FForegroundEnabled  )
  {
    DrawSquare(FForegroundIndex, (FForegroundIndex == FSelection) && FHasFocus);
    FForegroundIndex = Value;
    if( FForegroundIndex == FBackgroundIndex )
      DrawSquare(FForegroundIndex, (FForegroundIndex == FSelection) && FHasFocus );
    DrawFgBg();
    Change();
  }
}


void __fastcall TCColorGrid::SetGridOrdering(TGridOrdering Value)
{
  if( FGridOrdering == Value  )
       return;
  FGridOrdering = Value;
  FNumXSquares = 16 >> FGridOrdering;
  FNumYSquares = 1 << FGridOrdering;
  UpdateCellSizes(True);
}

void __fastcall TCColorGrid::SetSelection(Integer Value)
{
  if( FSelection == Value )
    return;
  DrawSquare(FSelection, False);
  FSelection = Value;
  DrawSquare(FSelection, FHasFocus);
  DrawFgBg();
}


Integer __fastcall TCColorGrid::SquareFromPos(Integer X, Integer Y)
{
  if( X > Width - 1 )
     X = Width - 1;
  else
    if( X < 0 )
      X = 0;
  if( Y > Height - 1 )
   Y = Height - 1;
  else
     if( Y < 0 )
      Y = 0;
  return( Y / FCellYSize * FNumXSquares + X / FCellXSize);
}


void __fastcall TCColorGrid::UpdateCellSizes(Boolean DoRepaint)
{
  Integer NewWidth, NewHeight;
  NewWidth = (Width / FNumXSquares) * FNumXSquares;
  NewHeight = (Height / FNumYSquares) * FNumYSquares;
  BoundsRect = Bounds(Left, Top, NewWidth, NewHeight);
  FCellXSize = Width / FNumXSquares;
  FCellYSize = Height / FNumYSquares;
  if( DoRepaint )
    Invalidate();
}


void __fastcall TCColorGrid::Change(void)
{
  if( FOnChange != NULL )
     FOnChange(this);
}
} // namespace CColorgrd


