//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Datasnap.DBClient.hpp>
#include <IPPeerClient.hpp>
#include <IPPeerServer.hpp>
#include <System.Tether.AppProfile.hpp>
#include <System.Tether.Manager.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Mask.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
//---------------------------------------------------------------------------
class TForm2 : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TDBGrid *DBGrid1;
	TDBEdit *DBEdit1;
	TDBEdit *DBEdit2;
	TDBEdit *DBEdit3;
	TDBEdit *DBEdit4;
	TDBNavigator *DBNavigator1;
	TClientDataSet *CDSProducts;
	TAutoIncField *CDSProductsCode;
	TStringField *CDSProductsProductName;
	TIntegerField *CDSProductsStock;
	TIntegerField *CDSProductsMinimalStock;
	TTetheringManager *TetherBDTest;
	TTetheringAppProfile *TetherBDTestProfile;
	TDataSource *DsProducts;
	TActionList *ActionList1;
	TAction *actGetList;
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall CDSProductsAfterPost(TDataSet *DataSet);
	void __fastcall TetherBDTestProfileResources0ResourceReceived(const TObject *Sender,
		  const TRemoteResource *AResource);
	void __fastcall actGetListExecute(TObject *Sender);
private:	// User declarations
	void __fastcall CreateShoppingList(void);
public:		// User declarations
	__fastcall TForm2(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm2 *Form2;
//---------------------------------------------------------------------------
#endif
