//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop
#include  "cgauges.h"
#include <Vcl.Consts.hpp>
#pragma package(smart_init)
 
/* TBltBitmap */
__fastcall TBltBitmap::TBltBitmap(): Graphics::TBitmap(){}

void __fastcall TBltBitmap::MakeLike(Graphics::TBitmap* ATemplate)
{
  Width = ATemplate->Width;
  Height = ATemplate->Height;
  Canvas->Brush->Color = TColor(clWindowFrame);
  Canvas->Brush->Style = bsSolid;
  Canvas->FillRect(Rect(0, 0, Width, Height));
}

/* This function solves for x in the equation "x is y% of z". */
Longint SolveForX(Longint Y, Longint Z)
{
  return floor( Z * (Y * 0.01) );
}

/* This function solves for y in the equation "x is y% of z". */
Longint SolveForY(Longint X, Longint Z)
{
  if (Z==0)
    return 0;
  else
    return floor( (X * 100.0) / Z );
}


/* TCGauge */

__fastcall TCGauge::TCGauge(TComponent *AOwner)
                 : TGraphicControl(AOwner) 

{
  ControlStyle << csFramed << csOpaque;
  /* default values */
  FMinValue = 0;
  FMaxValue = 100;
  FCurValue = 0;
  FKind = gkHorizontalBar;
  FShowText = True;
  FBorderStyle = bsSingle;
  FForeColor = clBlack;
  FBackColor = clWhite;
  Width = 100;
  Height = 100;
}

Longint __fastcall TCGauge::GetPercentDone()
{
  return SolveForY(FCurValue - FMinValue, FMaxValue - FMinValue);
}

void __fastcall TCGauge::Paint()
{
  std::auto_ptr<Graphics::TBitmap> TheImage(new Graphics::TBitmap());
  std::auto_ptr<TBltBitmap> OverlayImage(new TBltBitmap());
  TRect PaintTRect;

  TheImage->Height = Height;
  TheImage->Width = Width;
  PaintBackground(TheImage.get());
  PaintTRect = ClientRect;
  if (FBorderStyle == bsSingle)
    InflateRect(&PaintTRect, -1, -1);
  OverlayImage->MakeLike(TheImage.get());
  PaintBackground(OverlayImage.get());
  switch(FKind){
    case gkText:
      PaintAsNothing(OverlayImage.get(), PaintTRect);
      break;
    case gkHorizontalBar:
    case gkVerticalBar:
      PaintAsBar(OverlayImage.get(), PaintTRect);
      break;
    case gkPie:
      PaintAsPie(OverlayImage.get(), PaintTRect);
      break;
    case gkNeedle:
      PaintAsNeedle(OverlayImage.get(), PaintTRect);
      break;
  }
  TheImage->Canvas->CopyMode = cmSrcInvert;
  TheImage->Canvas->Draw(0, 0, OverlayImage.get());
  TheImage->Canvas->CopyMode = cmSrcCopy;
  if (ShowText == True)
    PaintAsText(TheImage.get(), PaintTRect);
  Canvas->CopyMode = cmSrcCopy;
  Canvas->Draw(0, 0, TheImage.get());
}

void __fastcall TCGauge::PaintBackground(Graphics::TBitmap* AnImage)
{
  TRect  ARect;
  AnImage->Canvas->CopyMode = cmBlackness;
  ARect = Rect(0, 0, Width, Height);
  AnImage->Canvas->CopyRect(ARect, AnImage->Canvas, ARect);
  AnImage->Canvas->CopyMode = cmSrcCopy;
}

void __fastcall TCGauge::PaintAsText(Graphics::TBitmap* AnImage, const TRect& PaintRect)
{
  String S;
  Integer X, Y;
  std::auto_ptr<TBltBitmap> OverRect(new TBltBitmap);

  OverRect->MakeLike(AnImage);
  PaintBackground(OverRect.get());
  S = System::String((int)PercentDone);
  S += "%";
  OverRect->Canvas->Brush->Style = bsClear;
  OverRect->Canvas->Font = Font;
  OverRect->Canvas->Font->Color = clWhite;
  X = (PaintRect.Right - PaintRect.Left + 1 - OverRect->Canvas->TextWidth(S)) / 2;
  Y = (PaintRect.Bottom - PaintRect.Top + 1 - OverRect->Canvas->TextHeight(S)) / 2;
  OverRect->Canvas->TextRect(PaintRect, X, Y, S);
  AnImage->Canvas->CopyMode = cmSrcInvert;
  AnImage->Canvas->Draw(0, 0, OverRect.get());
}

void __fastcall TCGauge::PaintAsNothing(Graphics::TBitmap* AnImage, const TRect &PaintRect)
{
    AnImage->Canvas->Brush->Color = BackColor;
    AnImage->Canvas->FillRect(PaintRect);
}

void __fastcall TCGauge::PaintAsBar(Graphics::TBitmap* AnImage, const TRect& PaintRect)
{
  Longint  FillSize;
  Integer  W, H;

  W = PaintRect.Right - PaintRect.Left + 1;
  H = PaintRect.Bottom - PaintRect.Top + 1;

  AnImage->Canvas->Brush->Color = BackColor;
  AnImage->Canvas->FillRect(PaintRect);
  AnImage->Canvas->Pen->Color = ForeColor;
  AnImage->Canvas->Pen->Width = 1;
  AnImage->Canvas->Brush->Color = ForeColor;
  switch(FKind){
    case gkHorizontalBar:
      FillSize = SolveForX(PercentDone, W);
      if (FillSize > W)
         FillSize = W;
      if (FillSize > 0)
         AnImage->Canvas->FillRect(Rect(PaintRect.Left,
                                        PaintRect.Top,
                                        FillSize,
                                        H));
     break;
   case gkVerticalBar:
     FillSize = SolveForX(PercentDone, H);
     if (FillSize >= H)
       FillSize = H - 1;
       AnImage->Canvas->FillRect(Rect(PaintRect.Left,
                                      H - FillSize,
                                      W,
                                      H));
     break;
  }
}

void __fastcall TCGauge::PaintAsPie(Graphics::TBitmap* AnImage, const TRect& PaintRect)
{
  Integer  MiddleX, MiddleY;
  Double  Angle;
  Integer  W, H;

  W = PaintRect.Right - PaintRect.Left;
  H = PaintRect.Bottom - PaintRect.Top;

  if (FBorderStyle == bsSingle){
      W++;
      H++;
  }
  AnImage->Canvas->Brush->Color = Color;
  AnImage->Canvas->FillRect(PaintRect);
  AnImage->Canvas->Brush->Color = BackColor;
  AnImage->Canvas->Pen->Color = ForeColor;
  AnImage->Canvas->Pen->Width = 1;
  AnImage->Canvas->Ellipse(PaintRect.Left,
                           PaintRect.Top,
                           W, H);
  if (PercentDone > 0) {
     AnImage->Canvas->Brush->Color = ForeColor;
     MiddleX = W / 2;
     MiddleY = H / 2;
     Angle = (Pi * ((PercentDone / 50.0) + 0.5));
     AnImage->Canvas->Pie(PaintRect.Left,
                          PaintRect.Top,
                          W, H,
                          floor(MiddleX * (1 - cos(Angle))), //should be rounded, really
                          floor(MiddleY * (1 - sin(Angle))),
                          MiddleX, 0);
  }
}

void __fastcall TCGauge::PaintAsNeedle(Graphics::TBitmap* AnImage, const TRect& PaintRect)
{
  Integer  MiddleX;
  Double   Angle;
  Integer  X, Y, W, H;

  X = PaintRect.Left;
  Y = PaintRect.Top;
  W = PaintRect.Right - PaintRect.Left;
  H = PaintRect.Bottom - PaintRect.Top;
  if (FBorderStyle == bsSingle){
        W++;
        H++;
  }

  AnImage->Canvas->Brush->Color = Color;
  AnImage->Canvas->FillRect(PaintRect);
  AnImage->Canvas->Brush->Color = BackColor;
  AnImage->Canvas->Pen->Color = ForeColor;
  AnImage->Canvas->Pen->Width = 1;
  AnImage->Canvas->Pie(X, Y,
                       W, H * 2 - 1,
                       X + W,
                       PaintRect.Bottom - 1,
                       X,
                       PaintRect.Bottom - 1);
  AnImage->Canvas->MoveTo(X, PaintRect.Bottom);
  AnImage->Canvas->LineTo(X + W, PaintRect.Bottom);
  if (PercentDone > 0){
    AnImage->Canvas->Pen->Color = ForeColor;
    MiddleX = Width / 2;
    AnImage->Canvas->MoveTo(MiddleX, PaintRect.Bottom - 1);
    Angle = (Pi * ((PercentDone / 100.0)));
    AnImage->Canvas->LineTo(floor(MiddleX * (1 - cos(Angle))),
                            floor((PaintRect.Bottom - 1) * (1 - sin(Angle))));
  }
}

void __fastcall TCGauge::SeTCGaugeKind(TCGaugeKind Value)
{
  if (Value != FKind){
      FKind = Value;
      Refresh();
  }
}

void __fastcall TCGauge::SetShowText(Boolean Value)
{
  if (Value != FShowText){
      FShowText = Value;
      Refresh();
  }
}

void __fastcall TCGauge::SetBorderStyle(TBorderStyle Value)
{
  if (Value != FBorderStyle) {
      FBorderStyle = Value;
      Refresh();
  }
}

void __fastcall TCGauge::SetForeColor(TColor Value)
{
  if (Value != FForeColor){
      FForeColor = Value;
      Refresh();
  }
}

void __fastcall TCGauge::SetBackColor(TColor Value)
{
  if (Value != FBackColor){
      FBackColor = Value;
      Refresh();
  }
}

void __fastcall TCGauge::SetMinValue(Longint Value)
{
  if (Value!= FMinValue){
    if (Value > FMaxValue)
    {
	  String message;
	  throw Exception(message.sprintf(Vcl_Consts_SOutOfRange.w_str(),-MaxInt,FMaxValue - 1));
	}
	FMinValue = Value;
	if (FCurValue < Value)
	  FCurValue = Value;
	Refresh();
  }
}

void __fastcall TCGauge::SetMaxValue(Longint Value)
{
  if (Value){
	if (Value < FMinValue)
	{
	  String message;
	  throw Exception(message.sprintf(Vcl_Consts_SOutOfRange.w_str(),FMinValue + 1,MaxInt));
    }

    FMaxValue = Value;
    if (FCurValue > Value)
      FCurValue = Value;
    Refresh();
  }
}

void __fastcall TCGauge::SetProgress(Longint Value)
{
  Longint  TempPercent;
  TempPercent = GetPercentDone();  // remember where we were
  if (Value < FMinValue)
    Value = FMinValue;
  else if (Value > FMaxValue)
    Value = FMaxValue;
  if (FCurValue != Value){
    FCurValue = Value;
    if (TempPercent != GetPercentDone()) //only refresh if percentage changed
      Refresh();
  }
}

void __fastcall TCGauge::AddProgress(Longint Value)
{
  Progress = FCurValue + Value;
  Refresh();
}

