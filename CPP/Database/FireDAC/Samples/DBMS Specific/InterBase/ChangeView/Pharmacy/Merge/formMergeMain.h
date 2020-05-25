//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef formMergeMainH
#define formMergeMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.StdActns.hpp>
//---------------------------------------------------------------------------
class TfrmMergeMain : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel4;
	TSplitter *Splitter1;
	TPanel *Panel2;
	TGroupBox *GroupBox2;
	TEdit *edtMSSQLDatabase;
	TEdit *edtMSSQLServer;
	TPanel *Panel1;
	TGroupBox *GroupBox1;
	TSpeedButton *sbInterBase;
	TEdit *edtIBDatabase;
	TPanel *Panel3;
	TButton *btnMerge;
	TProgressBar *ProgressBar1;
	TProgressBar *ProgressBar2;
	TProgressBar *ProgressBar3;
	TProgressBar *ProgressBar4;
	TProgressBar *ProgressBar5;
	TProgressBar *ProgressBar6;
	TFileOpenDialog *FileOpenDialog1;
	TMainMenu *MainMenu1;
	TMenuItem *File1;
	TMenuItem *Exit1;
	TActionList *ActionList1;
	TFileExit *FileExit1;
	TLabel *Label1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
	TComponent * Controller;
public:		// User declarations
	__fastcall TfrmMergeMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMergeMain *frmMergeMain;
//---------------------------------------------------------------------------
#endif
