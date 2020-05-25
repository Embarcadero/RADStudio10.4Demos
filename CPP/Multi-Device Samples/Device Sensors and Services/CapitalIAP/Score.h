//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef ScoreH
#define ScoreH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.Objects.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TScoreForm : public TForm
{
__published:	// IDE-managed Components
	TToolBar *ToolBar1;
	TLabel *Label1;
	TLayout *Layout1;
	TImage *Image1;
	TLabel *lRight;
	TLabel *lWrong;
	TLabel *lResults;
	TLayout *Layout2;
	TButton *Button1;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall FormDeactivate(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TScoreForm(TComponent* Owner);
	void __fastcall PrepareForm(int Right, int Wrong);
};

void CreateScore(const TForm *Form);
void ShowScore(const TForm * Form, int TotalNumberOfQuestions, int CorrectAnswers);
//---------------------------------------------------------------------------
extern PACKAGE TScoreForm *ScoreForm;
//---------------------------------------------------------------------------
#endif
