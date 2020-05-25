//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
//---------------------------------------------------------------------------
class TformRegExp : public TForm
{
__published:	// IDE-managed Components
	TListBox *lbRegExp;
	TMemo *MemoRegEx;
	TLabel *Label1;
	TButton *btnEvaluate;
	TEdit *EditText;
	TLabel *lbType;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall btnEvaluateClick(TObject *Sender);
	void __fastcall lbRegExpClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TformRegExp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TformRegExp *formRegExp;
//---------------------------------------------------------------------------
#endif
