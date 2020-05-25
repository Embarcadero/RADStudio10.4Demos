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
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.Comp.UI.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Phys.MongoDB.hpp>
#include <FireDAC.Phys.MongoDBDataSet.hpp>
#include <FireDAC.Phys.MongoDBDef.hpp>
#include <FireDAC.Phys.MongoDBWrapper.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
#include <System.JSON.BSON.hpp>
#include <System.JSON.Builders.hpp>
#include <System.JSON.Readers.hpp>
#include <System.JSON.Types.hpp>
#include <System.Rtti.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TDBGrid *DBGrid1;
	TDBGrid *DBGrid2;
	TDBGrid *DBGrid3;
	TFDConnection *FDConnection1;
	TDataSource *dsDatabases;
	TDataSource *dsCollections;
	TDataSource *dsData;
	TFDMongoDataSet *mdDatabases;
	TFDMongoDataSet *mdCollections;
	TFDMongoQuery *mqData;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
	TFDPhysMongoDriverLink *FDPhysMongoDriverLink1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall dsDatabasesDataChange(TObject *Sender, TField *Field);
	void __fastcall dsCollectionsDataChange(TObject *Sender, TField *Field);
	void __fastcall dsDataDataChange(TObject *Sender, TField *Field);
private:	// User declarations
	TMongoConnection * FMongoConn;
public:		// User declarations
	__fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
