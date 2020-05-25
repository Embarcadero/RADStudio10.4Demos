//---------------------------------------------------------------------------

#ifndef fMainH
#define fMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.UI.hpp>
#include <FireDAC.Moni.Base.hpp>
#include <FireDAC.Moni.FlatFile.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Phys.MongoDB.hpp>
#include <FireDAC.Phys.MongoDBDef.hpp>
#include <FireDAC.Phys.MongoDBWrapper.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Error.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
#include <System.JSON.BSON.hpp>
#include <System.JSON.Builders.hpp>
#include <System.JSON.Readers.hpp>
#include <System.JSON.Types.hpp>
#include <System.Rtti.hpp>
#include <memory>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
	TMemo *Memo1;
	TButton *btnInsert;
	TButton *btnPing;
	TButton *btnAggProj;
	TButton *btnAggRedact;
	TButton *btnInsFind;
	TButton *btnListCols;
	TButton *btnUpdInc;
	TButton *btnUpdPush;
	TButton *Button9;
	TButton *btnIterate;
	TButton *btnCurrentOp;
	TFDPhysMongoDriverLink *FDPhysMongoDriverLink1;
	TFDMoniFlatFileClientLink *FDMoniFlatFileClientLink1;
	TFDGUIxErrorDialog *FDGUIxErrorDialog1;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
	TFDConnection *FDConnection1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall btnInsertClick(TObject *Sender);
	void __fastcall btnPingClick(TObject *Sender);
	void __fastcall btnAggProjClick(TObject *Sender);
	void __fastcall btnAggRedactClick(TObject *Sender);
	void __fastcall btnInsFindClick(TObject *Sender);
	void __fastcall btnCurrentOpClick(TObject *Sender);
	void __fastcall btnListColsClick(TObject *Sender);
	void __fastcall btnUpdIncClick(TObject *Sender);
	void __fastcall btnUpdPushClick(TObject *Sender);
	void __fastcall Button9Click(TObject *Sender);
	void __fastcall btnIterateClick(TObject *Sender);
private:	// User declarations
	TMongoEnv * FEnv;
	TMongoConnection * FCon;
public:		// User declarations
	__fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
