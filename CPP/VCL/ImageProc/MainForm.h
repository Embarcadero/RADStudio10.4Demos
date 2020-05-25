//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef MainFormH
#define MainFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <ExtDlgs.hpp>
#include <Menus.hpp>
#include <ButtonGroup.hpp>
#include <ComCtrls.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TSavePictureDialog *SavePictureDialog1;
	TOpenPictureDialog *OpenPictureDialog1;
	TMainMenu *MainMenu1;
	TMenuItem *File1;
	TMenuItem *F1;
	TMenuItem *Edit1;
	TMenuItem *oGrayscale1;
	TMenuItem *ApplySobeloperator1;
	TMenuItem *Negative1;
	TMenuItem *Exit1;
	TMenuItem *Filters1;
	TMenuItem *Average1;
	TMenuItem *Median1;
	TMenuItem *FlipHorizontally1;
	TMenuItem *FlipVertically1;
	TMenuItem *Save1;
	TMenuItem *Light1;
	TMenuItem *Brightness1;
	TMenuItem *AutomaticContrast1;
	TMenuItem *ApplyTreshold1;
	TPanel *Panel1;
	TMenuItem *Effects1;
	TMenuItem *Edges1;
	TImage *Image2;
	TImage *Image3;
	TMenuItem *Select1;
	TMenuItem *Image11;
	TMenuItem *Image21;
	TMenuItem *Image31;
	TImage *Image1;
	TMenuItem *View2;
	TMenuItem *Buttons2;
	TMenuItem *ArithmeticOperators1;
	TStatusBar *StatusBar1;
	TButtonGroup *ButtonGroup1;
	TImageList *ImageList1;
	TMenuItem *OldPicture1;
	TMenuItem *Draw1;
	TMenuItem *DetailedDraw1;
	TMenuItem *Help1;
	TMenuItem *About1;
	void __fastcall F1Click(TObject *Sender);
	void __fastcall oGrayscale1Click(TObject *Sender);
	void __fastcall ApplySobeloperator1Click(TObject *Sender);
	void __fastcall Negative1Click(TObject *Sender);
	void __fastcall Exit1Click(TObject *Sender);
	void __fastcall Average1Click(TObject *Sender);
	void __fastcall Median1Click(TObject *Sender);
	void __fastcall FlipHorizontally1Click(TObject *Sender);
	void __fastcall FlipVertically1Click(TObject *Sender);
	void __fastcall Save1Click(TObject *Sender);
	void __fastcall Brightness1Click(TObject *Sender);
	void __fastcall ApplyTreshold1Click(TObject *Sender);
	void __fastcall Buttons1Click(TObject *Sender);
	void __fastcall AutomaticContrast1Click(TObject *Sender);
	void __fastcall Edges1Click(TObject *Sender);
	void __fastcall Image11Click(TObject *Sender);
	void __fastcall Image21Click(TObject *Sender);
	void __fastcall Image31Click(TObject *Sender);
	void __fastcall Buttons2Click(TObject *Sender);
	void __fastcall ArithmeticOperators1Click(TObject *Sender);
	void __fastcall ButtonGroup1Items1Click(TObject *Sender);
	void __fastcall ButtonGroup1Items0Click(TObject *Sender);
	void __fastcall ButtonGroup1Items2Click(TObject *Sender);
	void __fastcall ButtonGroup1Items3Click(TObject *Sender);
	void __fastcall ButtonGroup1Items4Click(TObject *Sender);
	void __fastcall ButtonGroup1Items5Click(TObject *Sender);
	void __fastcall ButtonGroup1Items6Click(TObject *Sender);
	void __fastcall ButtonGroup1Items7Click(TObject *Sender);
	void __fastcall ButtonGroup1Items8Click(TObject *Sender);
	void __fastcall ButtonGroup1Items9Click(TObject *Sender);
	void __fastcall ButtonGroup1Items10Click(TObject *Sender);
	void __fastcall ButtonGroup1Items11Click(TObject *Sender);
	void __fastcall ButtonGroup1Items12Click(TObject *Sender);
	void __fastcall ButtonGroup1Items13Click(TObject *Sender);
	void __fastcall ButtonGroup1Items14Click(TObject *Sender);
	void __fastcall ButtonGroup1Items15Click(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall OldPicture1Click(TObject *Sender);
	void __fastcall Draw1Click(TObject *Sender);
	void __fastcall DetailedDraw1Click(TObject *Sender);
	void __fastcall About1Click(TObject *Sender);
	void __fastcall FormPaint(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
