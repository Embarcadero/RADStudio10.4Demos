//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop
#include "perfgrap.h"
#include "perfgrap.rh"
#pragma resource "perfgrap.res" // contains strings
#pragma package(smart_init);

//---------------------------------------------------------------------------
static inline TPerformanceGraph *ValidCtrCheck()
{
	return new TPerformanceGraph(NULL);
}
//---------------------------------------------------------------------------
__fastcall TPerformanceGraph::TPerformanceGraph(TComponent* Owner)
	: TGraphicControl(Owner)
{
	ControlStyle << csFramed << csOpaque;

	// default values
	FKind	   = pgLine;
	FForeColor = clGreen;
	FBackColor = clBlack;
	FGridSize  = 15;
	FStepSize  = 3;
	FGradient  = 100;
	FGridlines = true;
	FPenWidth  = 2;
	FScale	   = 1000;
	Width	   = 100;
	Height	   = 100;

	Canvas->Pen->Width = FPenWidth;
	
	// create objects used by class.  Bands is incremented by two in
	// order to have one TDataPoints object for the oldest,
	// non-visible data (so that PaintLine can do its job correctly),
	// and one for the current "in-progress" data, which has not been
	// displayed yet.
	Allocated  = Bands + 2;
	History	   = new TDataPoints[Allocated];
	BeginY	   = 1;
	CurrentY   = 0;

	Hidden     = 0;
	SaveArea   = new Graphics::TBitmap;
	Occupied   = false;

	// simulate a history of empty data
	for	(int i = 0; i < Allocated; i++)
		History[i].used = 0;

	// initialize the save area used for painting
	Initialize(GridSize - 1);
}
//---------------------------------------------------------------------------
__fastcall TPerformanceGraph::~TPerformanceGraph()
{
	delete SaveArea;
	delete[] History;
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::Initialize(Longint Index)
{
	// define the memory area for the bitmap
	SaveArea->Width	  = Width;
	SaveArea->Height  = Height;
	
	// create a rectangle which represents the size of SaveArea
	LayoutRect.Left	  = 0;
	LayoutRect.Top	  = 0;
	LayoutRect.Right  = SaveArea->Width;
	LayoutRect.Bottom = SaveArea->Height;

	// paint the background
	SaveArea->Canvas->Brush->Color = BackColor;
	SaveArea->Canvas->FillRect(LayoutRect);

	// draw the grid lines
	if	(Gridlines)
	{
		SaveArea->Canvas->Pen->Color = ForeColor;

		// draw the vertical grid lines
		TPoint p;
		p.x = LayoutRect.Left;
		for	(int i = GridSize; i < LayoutRect.Bottom; i += GridSize)
		{
			p.y = i;
			SaveArea->Canvas->PenPos = p;
			SaveArea->Canvas->LineTo(LayoutRect.Right, i);
		}

		// draw the horizontal grid lines
		p.y = 0;
		int vert;
		for	(vert = Index; vert < LayoutRect.Right; vert += GridSize)
		{
			p.x = vert;
			SaveArea->Canvas->PenPos = p;
			SaveArea->Canvas->LineTo(vert, LayoutRect.Bottom);
		}
		Hidden = vert - LayoutRect.Right;
	}

	// cache rectangles used for updating graph display
	SourceRect = DestRect = OpenBand = LayoutRect;
	SourceRect.Left = StepSize;
	DestRect.Right -= StepSize;
	OpenBand.Left = LayoutRect.Right - StepSize;
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::Paint()
{
	// if the shape of the graph has changed at all, redraw it
	if	(Height != SaveArea->Height || Width != SaveArea->Width)
	{
		if	(Width != SaveArea->Width)
			ReallocHistory();
		Replay();
	}

	// copy the cached image to the control
	Canvas->CopyMode = cmSrcCopy;
	Canvas->Draw(0, 0, SaveArea);
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::SetGraphKind(TGraphKind Value)
{
	if	(Value != FKind)
	{
		FKind = Value;
		Replay();
	}
}

void __fastcall TPerformanceGraph::SetForeColor(TColor Value)
{
	if	(Value != FForeColor)
	{
		FForeColor = Value;
		Replay();
	}
}

void __fastcall TPerformanceGraph::SetBackColor(TColor Value)
{
	if	(Value != FBackColor)
	{
		FBackColor = Value;
		Replay();
	}
}

void __fastcall TPerformanceGraph::SetGridSize(Longint Value)
{
	if	(Value != FGridSize)
	{
		if	(Value < 2)
			Value = 2;
		FGridSize = Value;
		Replay();
	}
}

void __fastcall TPerformanceGraph::SetStepSize(Longint Value)
{
	if	(Value != FStepSize)
	{
		if	(Value < 1)
			Value = 1;
		FStepSize = Value;
		ReallocHistory();
		Replay();
	}
}

void __fastcall TPerformanceGraph::SetScale(Longint Value)
{
	if	(Value != FScale)
	{
		FScale = RoundUp(Value, Gradient);

		if	(OnScaleChange)
			OnScaleChange(this);

		Replay();
	}
}

void __fastcall TPerformanceGraph::SetGradient(Longint Value)
{
	if	(Value != FGradient)
	{
		FGradient = Value;
		Replay();
	}
}

void __fastcall TPerformanceGraph::SetGridlines(Boolean Value)
{
	if	(Value != FGridlines)
	{
		FGridlines = Value;
		Replay();
	}
}

void __fastcall TPerformanceGraph::SetPenWidth(Longint Value)
{
	if	(Value != FPenWidth)
	{
		FPenWidth = Value;
		Canvas->Pen->Width = FPenWidth;
		Replay();
	}
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::PaintBar(TColor color, Longint base,
	Longint amount)
{
	if	(! amount)
		return;

	// compute the size and shape of the bar, relative to the graph
	double range = double(LayoutRect.Bottom - LayoutRect.Top);
	long pixels  = long(range * (double(amount) / double(Scale)));
	long offset  = long(range * (double(base) / double(Scale)));

	if	(! pixels)
		return;

	// define the exact area of the bar
	TRect area;
	area.Left   = OpenBand.Left;
	area.Right  = OpenBand.Right;
	area.Top    = LayoutRect.Bottom - offset - pixels - 1;
	area.Bottom = LayoutRect.Bottom - offset;

	// paint the bar using the color specified
	SaveArea->Canvas->Brush->Color = color;
	SaveArea->Canvas->FillRect(area);
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::PaintLine(TColor color, Longint lastAmount,
	Longint amount)
{
	// compute the size and shape of the lines, relative to the graph
	double percent = double(amount) / double(Scale);
	long pixels = long(double(LayoutRect.Bottom - LayoutRect.Top) * percent);
	percent = double(lastAmount) / double(Scale);
	long lpixels = long(double(LayoutRect.Bottom - LayoutRect.Top) * percent);

	// define the left point of the line
	TPoint left;
	left.x = OpenBand.Left;
	left.y = LayoutRect.Bottom - lpixels;

	// draw the line using the color specified
	SaveArea->Canvas->Pen->Color = color;
	SaveArea->Canvas->PenPos = left;
	SaveArea->Canvas->LineTo(OpenBand.Right, LayoutRect.Bottom - pixels);
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::DataPoint(TColor color, Longint value)
{
	// check to see if the internal limit has been exceeded
	if	(History[CurrentY].used >= MAXLINES)
		throw ERangeError(LoadStr(Exceed_RC));

	// save the data point for display on the next call to Update
	History[CurrentY].color[History[CurrentY].used] = color;
	History[CurrentY].value[History[CurrentY].used] = value;
	History[CurrentY].used++;
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::ScrollGraph()
{
	// cycle the grid over, repainting the hash lines so that they
	// appear unbroken
	SaveArea->Canvas->CopyRect(DestRect, SaveArea->Canvas, SourceRect);
	SaveArea->Canvas->Brush->Color = BackColor;
	SaveArea->Canvas->FillRect(OpenBand);

	// if the user does not want gridlines, skip this step
	if	(! Gridlines)
		return;

	SaveArea->Canvas->Pen->Color = ForeColor;

	// draw the horizontal grid lines
	TPoint p;
	p.x = OpenBand.Left;
	for	(int i = GridSize; i < OpenBand.Bottom; i += GridSize)
	{
		p.y = i;
		SaveArea->Canvas->PenPos = p;
		SaveArea->Canvas->LineTo(OpenBand.Right, i);
	}

	// draw a vertical grid line, if we should
	Hidden -= StepSize;
	if	(Hidden < 0)
	{
		TPoint p;
		p.x = LayoutRect.Right + Hidden;
		p.y = LayoutRect.Top;
		SaveArea->Canvas->PenPos = p;
		SaveArea->Canvas->LineTo(p.x, LayoutRect.Bottom);
		Hidden += GridSize;
	}
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::DisplayPoints(Longint Index)
{
	long	base = 0;

	// display the data points that were added by the user
	for	(int i = 0; i < History[Index].used; i++)
	{
		if	(History[Index].value[i])
		{
			TColor	Color = History[Index].color[i];
			
			switch	(Kind)
			{
			case	pgBar: 
				PaintBar(Color, base, History[Index].value[i] - base);
				break;

			case	pgLine: 
			{
				TDataPoints& last = History[LastY(Index)];
				Longint LastValue = 0;

				for	(int j = 0; j < last.used; j++)
				{
					if	(last.color[j] == Color)
					{
						LastValue = last.value[j];
						break;
					}
				}
						
				PaintLine(Color, LastValue, History[Index].value[i]);
				break;
			}
			}
			base = History[Index].value[i];
		}
	}
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::ReallocHistory()
{
	// allocate the new history list
	Longint NewCount = Bands + 2;
	TDataPoints	*NewHistory = new TDataPoints[NewCount];
	for	(int i = 0; i < NewCount; i++)
		NewHistory[i].used = 0;

	// if the new history is smaller than the old one, then ignore the
	// first X elements in the old one, where X is how much smaller
	// the new history is
	int i = FirstY();
	if	(NewCount < Allocated)
		for	(int j = 0; j < (Allocated - NewCount); j++)
			i = NextY(i);
	
	// copy over the elements.  Because of the code just above, we
	// know that the old history will always be equal to or smaller in
	// size than the new history
	int x = 0;
	for	(; i != LIST_END; i = NextY(i))
		NewHistory[x++] = History[i];

	// delete the old history list.  We are now using the new one
	delete[] History;
	History = NewHistory;

	// reset the list pointers
	Allocated = NewCount;
	CurrentY  = x - 1;
	BeginY    = 0;
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::Update()
{
	// scroll the graph to the left by StepSize
	ScrollGraph();

	// since the graph has scrolled, drop old data
	ShiftY();

	// determine if the scale should be changed
	Longint largest = 0;
	for	(int y = FirstY(); y != LIST_END; y = NextY(y))
		for	(int x = 0; x < History[y].used; x++) 
			if	(History[y].value[x] > largest)
				largest = History[y].value[x];

	largest = RoundUp(largest, Gradient);

	// if the scale needs to be changed...
	if	(largest != Scale)
		Scale = largest;					// causes call to Replay()
	else
	{
		// otherwise just update the display
		DisplayPoints(LastY(CurrentY));
		Refresh();
	}
}
//---------------------------------------------------------------------------
void __fastcall TPerformanceGraph::Replay()
{
	// repaint the graph background, preserving vertical positions
	Longint Span = Width + Hidden;
	Longint Index = Span - ((Span / GridSize) * GridSize);
	Initialize(Index);

	// save the 'open band', which is where data gets painted
	TRect SaveBand = OpenBand;

	// begin at vertical column 'left'
	int left = Width % Bands;

	// repaint all of the historical items
	for	(int i = NextY(FirstY()); i != LIST_END; i = NextY(i))
	{
		OpenBand.Left = left;
		left += StepSize;
		OpenBand.Right = left;

		// draw the historical item
		DisplayPoints(i);
	}
	Refresh();

	// restore the open band
	OpenBand = SaveBand;
}
//---------------------------------------------------------------------------

