//---------------------------------------------------------------------------

#ifndef fMainH
#define fMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.UI.hpp>
#include <FireDAC.FMXUI.Wait.hpp>
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
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Memo.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
#include <System.JSON.BSON.hpp>
#include <System.JSON.Builders.hpp>
#include <System.JSON.Readers.hpp>
#include <System.JSON.Types.hpp>
#include <System.Rtti.hpp>
#include <System.Diagnostics.hpp>
#include <memory>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
	TButton *btnLoadData;
	TMemo *Memo1;
	TButton *btnAggregate;
	TButton *btnIndexes;
	TButton *btnInsert;
	TButton *btnRemove;
	TButton *btnUpdate;
	TButton *btnQuery;
	TFDConnection *FDConnection1;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
	TFDPhysMongoDriverLink *FDPhysMongoDriverLink1;
	void __fastcall btnLoadDataClick(TObject *Sender);
	void __fastcall btnQueryClick(TObject *Sender);
	void __fastcall btnInsertClick(TObject *Sender);
	void __fastcall btnUpdateClick(TObject *Sender);
	void __fastcall btnRemoveClick(TObject *Sender);
	void __fastcall btnIndexesClick(TObject *Sender);
	void __fastcall btnAggregateClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
	TMongoEnv * FEnv;
	TMongoConnection * FCon;
	void __fastcall DumpCursor(_di_IMongoCursor ACrs);
public:		// User declarations
	__fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
