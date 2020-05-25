//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef Unit6H
#define Unit6H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.Actions.hpp>
#include <System.Win.TaskbarCore.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Samples.Spin.hpp>
#include <Vcl.Taskbar.hpp>
#include <System.ImageList.hpp>
//---------------------------------------------------------------------------
class TForm6 : public TForm
{
__published:	// IDE-managed Components
	TActionList *ActionList1;
	TAction *Action1;
	TAction *Action2;
	TAction *Action3;
	TImageList *ImageList1;
	TPanel *Panel1;
	TLabel *Label1;
	TComboBox *ComboBox1;
	TTrackBar *TrackBar1;
	TPanel *Panel2;
	TLabel *Label2;
	TImage *Image1;
	TImage *Image2;
	TImage *Image3;
	TPanel *Panel3;
	TLabel *Label3;
	TButton *Button1;
	TPanel *Panel5;
	TLabel *Label5;
	TLabel *Label6;
	TCheckBox *cb1Visible;
	TEdit *EdBtn1;
	TPanel *Panel6;
	TLabel *Label7;
	TLabel *Label8;
	TCheckBox *cb2Visible;
	TEdit *EdBtn2;
	TPanel *Panel7;
	TLabel *Label9;
	TLabel *Label10;
	TCheckBox *cb3Visible;
	TEdit *EdBtn3;
	TPanel *Panel4;
	TLabel *Label4;
	TLabel *Label11;
	TLabel *Label12;
	TLabel *Label14;
	TLabel *Label15;
	TButton *Button2;
	TButton *Button3;
	TSpinEdit *EdLeft;
	TSpinEdit *EdHeight;
	TSpinEdit *EdTop;
	TSpinEdit *EdWidth;
	TTaskbar *Taskbar1;
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall ComboBox1Change(TObject *Sender);
	void __fastcall TrackBar1Change(TObject *Sender);
	void __fastcall Image1Click(TObject *Sender);
	void __fastcall Image2Click(TObject *Sender);
	void __fastcall Image3Click(TObject *Sender);
	void __fastcall Action1Execute(TObject *Sender);
	void __fastcall Action2Execute(TObject *Sender);
	void __fastcall Action3Execute(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm6(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm6 *Form6;
//---------------------------------------------------------------------------
#endif
