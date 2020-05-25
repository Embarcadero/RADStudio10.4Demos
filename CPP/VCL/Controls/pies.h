//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef PiesH
#define PiesH
//----------------------------------------------------------------------------
#include <StdCtrls.hpp>
#include <Graphics.hpp>
#include <Forms.hpp>
#include <Controls.hpp>
#include <Classes.hpp>
#include <System.hpp>
#include <math.h>

//-- type declarations -------------------------------------------------------
class  PACKAGE TAngles : public TPersistent
{
private:
	int FStartAngle;
	int FEndAngle;
	TNotifyEvent FOnChange;
	void __fastcall SetStart(int Value);
	void __fastcall SetEnd(int Value);
public:
	void __fastcall Assign(TPersistent* Value);
	void __fastcall Changed(void);
	
__published:
	__property int StartAngle = {read=FStartAngle, write=SetStart, nodefault};
	__property int EndAngle = {read=FEndAngle, write=SetEnd, nodefault};
	__property TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
public:
	__fastcall TAngles(void);
	__fastcall virtual ~TAngles(void);
};

class  PACKAGE TPie : public TGraphicControl
{
__published:
	TPen* FPen;
	TBrush* FBrush;
	TEdit* FEdit;
	TAngles* FAngles;
	virtual void __fastcall Paint(void);
	void __fastcall SetBrush(TBrush* Value);
	void __fastcall SetPen(TPen* Value);
	void __fastcall SetAngles(TAngles* Value);
	void __fastcall StyleChanged(TObject* Sender);
	__property Anchors ;
	__property Constraints ;
	__property TAngles* Angles = {read=FAngles, write=SetAngles, nodefault};
	__property TBrush* Brush = {read=FBrush, write=SetBrush, nodefault};
	__property TPen* Pen = {read=FPen, write=SetPen, nodefault};
	__property ShowHint ;
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnStartDock ;
	__property OnStartDrag ;
   
public:
	__fastcall virtual TPie(TComponent* AOwner);
	__fastcall virtual ~TPie(void);
};

//-- var, const, procedure ---------------------------------------------------
#define PI 3.1415926535897932385
//-- end unit ----------------------------------------------------------------
#endif // PiesH
