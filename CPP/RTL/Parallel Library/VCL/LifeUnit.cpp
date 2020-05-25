//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "LifeUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TLifeForm *LifeForm;
//---------------------------------------------------------------------------
__fastcall TLifeForm::TLifeForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLifeForm::Button1Click(TObject *Sender)
{
	if(!FLifeEngine->Running) {
		FLifeEngine->Start();
		Button1->Caption = "&Stop";
	}
	else {
		FLifeEngine->Stop();
		Button1->Caption = "&Start";
    }
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::Button2Click(TObject *Sender)
{
	if(!FLifeEngine->Running) {
		FLifeEngine->Clear();
		FLifeBoard = FLifeEngine->LifeBoard;
		FormResize(Sender);
		PaintBox1->Invalidate();
	}
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::FormCloseQuery(TObject *Sender, bool &CanClose)
{
	if(FLifeEngine->Running) {
		Button1Click(Sender);
	}
  	CanClose = !FLifeEngine->Running;
}
//---------------------------------------------------------------------------
void __fastcall TLifeForm::LifeEngineUpdate(TObject * Sender)
{
	FLifeBoard = FLifeEngine->LifeBoard;
	FGensPerSecond = FLifeEngine->GensPerSecond;
	FMaxGensPerSecond = FLifeEngine->MaxGensPerSecond;
	Label2->Caption = Format("%f Generations Per Second", ARRAYOFCONST((FGensPerSecond)));
	Label3->Caption = Format("%f Max Generations Per Second", ARRAYOFCONST((FMaxGensPerSecond)));
	PaintBox1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::FormCreate(TObject *Sender)
{
	BoardSize = TSize(500,500);
	FLifeEngine = new TLifeEngine(BoardSize);
	FLifeEngine->OnUpdate = LifeEngineUpdate;
	FLifeBoard = FLifeEngine->LifeBoard;
	FLifeEngine->UpdateRate = 30;
	DoubleBuffered = true;
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::FormDestroy(TObject *Sender)
{
	FLifeEngine->Free();
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::FormResize(TObject *Sender)
{
	FViewSize = Point((PaintBox1->Width - 10) / 10, (PaintBox1->Height - 10) / 10);
	HorzScrollBar->Max = FLifeBoard.Length;
	HorzScrollBar->PageSize = FViewSize.X;
	VertScrollBar->Max = FLifeBoard[0].Length;
	VertScrollBar->PageSize = FViewSize.Y;
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::Button4Click(TObject *Sender)
{
	HorzScrollBar->Position = (FLifeBoard.Length - FViewSize.X) / 2;
	VertScrollBar->Position = (FLifeBoard[0].Length - FViewSize.Y) / 2;
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::Button3Click(TObject *Sender)
{
	if((!FLifeEngine->Running) && (OpenDialog1->Execute()))
	{
		FLifeEngine->LoadPattern(OpenDialog1->FileName);
		Hint = FLifeEngine->Description;
	}
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::CheckBox1Click(TObject *Sender)
{
	if(FLifeEngine != NULL) {
		FLifeEngine->Parallel = CheckBox1->Checked;
	}
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::HorzScrollBarChange(TObject *Sender)
{
	FViewOffset.X = HorzScrollBar->Position;
	PaintBox1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::VertScrollBarChange(TObject *Sender)
{
	FViewOffset.Y = VertScrollBar->Position;
	PaintBox1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::PaintBox1MouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
	if((!FLifeEngine->Running) && (Button == mbLeft)) {
		int Row = Y / 10;
		int Column = X / 10;
		if((Row >= 0) && (Row <= FViewSize.Y) && (Column >= 0) && (Column <= FViewSize.X)
					&& (FViewOffset.X + Column < 500) && (FViewOffset.Y + Row < 500)) {
			FLifeBoard[FViewOffset.X + Column][FViewOffset.Y + Row] =
				FLifeBoard[FViewOffset.X + Column][FViewOffset.Y + Row] ^ 1;
			PaintBox1->Invalidate();
		}
		Label1->Caption = String().sprintf(L"%d, %d", FViewSize.X + Column, FViewSize.Y + Row);
    }
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::PaintBox1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y)
{
	Label1->Caption = String().sprintf(L"%d, %d", FViewOffset.X + X / 10, FViewOffset.Y + Y / 10);
}
//---------------------------------------------------------------------------

void __fastcall TLifeForm::PaintBox1Paint(TObject *Sender)
{
	PaintBox1->Canvas->Pen->Color = clGrayText;
	if(FLifeBoard.Length > 0) {
		for(int i = 0; i < FViewSize.X; i++) {
			for(int j = 0; j < FViewSize.Y; j++) {
				if(FLifeBoard[Min(FViewOffset.X + i, FLifeBoard.High)][Min(FViewOffset.Y + j, FLifeBoard[0].High)] != 0)
				{
					PaintBox1->Canvas->Brush->Color = clBlack;
					PaintBox1->Canvas->Rectangle(Rect(i * 10, j * 10, i * 10 + 11, j * 10 + 11));
				}
				else {
					PaintBox1->Canvas->Brush->Color = clBtnFace;
					PaintBox1->Canvas->Rectangle(Rect(i * 10, j * 10, i * 10 + 11, j * 10 + 11));
                }
			}
        }
	}
	int Scale = 1000000;
	while(Scale > 10) {
		if((FMaxGensPerSecond * 10) < Scale) {
			Scale = Scale / 10;
		}
		else  {
			break;
		}
		int Gens = MulDiv(FGensPerSecond, PaintBox1->Height, Scale);
		int Max =  MulDiv(FMaxGensPerSecond, PaintBox1->Height, Scale);
		PaintBox1->Canvas->Brush->Color = clGreen;
		PaintBox1->Canvas->FillRect(Rect(PaintBox1->Width - 4, PaintBox1->Height - Gens, PaintBox1->Width, PaintBox1->Height));
		PaintBox1->Canvas->Pen->Color = clRed;
		PaintBox1->Canvas->MoveTo(PaintBox1->Width - 4, PaintBox1->Height - Max);
		PaintBox1->Canvas->LineTo(PaintBox1->Width, PaintBox1->Height - Max);
    }
}
//---------------------------------------------------------------------------

