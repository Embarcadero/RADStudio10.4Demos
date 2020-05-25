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
#include <System.Diagnostics.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *lblTimeElapsed;
	TLabel *Label5;
	TButton *Button1;
	TDBGrid *DBGrid1;
	TDBGrid *DBGrid2;
	TDBGrid *DBGrid3;
	TEdit *edtJSONQuery;
	TButton *Button2;
	TFDConnection *FDConnection1;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
	TFDPhysMongoDriverLink *FDPhysMongoDriverLink1;
	TDataSource *dsRestaurants;
	TDataSource *dsCoords;
	TDataSource *dsGrades;
	TFDMongoQuery *FDMongoQuery1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
