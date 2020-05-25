//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef PerfGrapH
#define PerfGrapH
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Controls.hpp>
#include <Classes.hpp>
#include <Forms.hpp>

//-- type declarations -------------------------------------------------------
enum TGraphKind { pgBar, pgLine };

class PACKAGE TPerformanceGraph : public TGraphicControl
{
private:
	TGraphKind FKind;
	TColor FForeColor;
	TColor FBackColor;
	Longint FGridSize;
	Longint FStepSize;
	Longint FScale;
	Longint FGradient;
	Boolean FGridlines;
	Longint FPenWidth;
	TNotifyEvent FOnScaleChange;

	void __fastcall SetGraphKind(TGraphKind Value);
	void __fastcall SetForeColor(TColor Value);
	void __fastcall SetBackColor(TColor Value);
	void __fastcall SetGridSize(Longint Value);
	void __fastcall SetStepSize(Longint Value);
	void __fastcall SetScale(Longint Value);
	void __fastcall SetGradient(Longint Value);
	void __fastcall SetGridlines(Boolean Value);
	void __fastcall SetPenWidth(Longint Value);

private:
	TRect LayoutRect;
	TRect SourceRect;
	TRect DestRect;
	TRect OpenBand;
	Longint Hidden;
	Graphics::TBitmap *SaveArea;
	Boolean Occupied;

	void __fastcall Initialize(Longint Index);
	void __fastcall PaintBar(TColor color, Longint base, Longint amount);
	void __fastcall PaintLine(TColor color, Longint lastAmount,
		Longint amount);

#define MAXLINES 16

	struct TDataPoints
	{
		Longint	used;
		TColor	color[MAXLINES];
		Longint	value[MAXLINES];
	};

	TDataPoints	*History;
	Longint		Allocated;
	int			BeginY, CurrentY;

#define LIST_END -1

	int __fastcall CountY() {
		return Allocated - 1;
	}

	int __fastcall FirstY() {
		return BeginY;
	}
	
	int __fastcall NextY(int Y) {
		Y++;
		if	(Y == Allocated)
			Y = 0;
		if	(Y == BeginY)
			return -1;
		return Y;
	}
	
	int __fastcall LastY(int Y) {
		if	(Y == 0)
			return Allocated - 1;
		return Y - 1;
	}

	int __fastcall ShiftY() {
		Longint nextY = CurrentY;
		nextY++;
		if	(nextY == Allocated)
			nextY = 0;

		History[nextY].used = 0;
		BeginY = nextY + 1;
		if	(BeginY == Allocated)
			BeginY = 0;

		CurrentY = nextY;
                return CurrentY;
	}

protected:
	virtual void __fastcall Paint(void);
	void __fastcall ScrollGraph();
	void __fastcall DisplayPoints(Longint Index);
	void __fastcall ReallocHistory();
	void __fastcall Replay(void);

	Longint __fastcall GetBandCount() {
		return Width / StepSize;
	}
	__property Longint Bands = {read=GetBandCount};

	Longint __fastcall RoundUp(Longint Value, Longint Increment) {
		if	(Increment && Value % Increment)
			return ((Value / Increment) + 1) * Increment;
		return Value;
	}

public:
	__fastcall TPerformanceGraph(TComponent* Owner);
	virtual __fastcall ~TPerformanceGraph();

	void __fastcall DataPoint(TColor color, Longint value);
	void __fastcall Update();

__published:
	__property Align ;
	__property Anchors ;
	__property Constraints ;
	__property Enabled ;
	__property TGraphKind Kind = {read=FKind, write=SetGraphKind, default=1};
	__property TColor ForeColor = {read=FForeColor, write=SetForeColor, default=clGreen};
	__property TColor BackColor = {read=FBackColor, write=SetBackColor, default=clBlack};
	__property ParentShowHint ;
	__property Longint GridSize = {read=FGridSize, write=SetGridSize, default=15};
	__property Longint StepSize = {read=FStepSize, write=SetStepSize, default=3};
	__property Longint Scale = {read=FScale, write=SetScale, default=1000};
	__property Longint Gradient = {read=FGradient, write=SetGradient, default=1000};
	__property Boolean Gridlines = {read=FGridlines, write=SetGridlines, default=true};
	__property Longint PenWidth = {read=FPenWidth, write=SetPenWidth, default=2};
	__property TNotifyEvent OnScaleChange = {read=FOnScaleChange, write=FOnScaleChange};
	__property ShowHint ;
	__property Visible ;
};
//---------------------------------------------------------------------------
#endif  // PerfGrapH
