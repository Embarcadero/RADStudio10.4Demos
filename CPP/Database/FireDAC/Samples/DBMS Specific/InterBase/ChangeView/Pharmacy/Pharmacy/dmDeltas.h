//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef dmDeltasH
#define dmDeltasH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
/*
  private
    FOnPostDeltas: TNotifyEvent;
    { Private declarations }
    procedure OpenAll(ID : string; ShowMerged : Boolean);
  public
    { Public declarations }
	constructor Create(AOwner : TComponent; ID : string; ShowMerged : Boolean;
		LocalDB, RemoteDB : TFDConnection); reintroduce;
	procedure PostDeltas;
	property OnPostDeltas : TNotifyEvent read FOnPostDeltas write FOnPostDeltas;
*/
//---------------------------------------------------------------------------
class TdtmdlDelta : public TDataModule
{
__published:	// IDE-managed Components
	TFDTransaction *FDTransactionDelta;
	TFDQuery *qrySubscriptionActive;
	TFDQuery *qryCategory;
	TFDQuery *qryMedicine;
	TFDQuery *qryMedicineCategories;
	TFDQuery *qryCategoryDelta;
	TFDQuery *qryMedicineDelta;
	TFDQuery *qryMedicineCategoriesDelta;
	TFDMemTable *mtCategoryMerged;
	TFDMemTable *mtMedicineMerged;
	TFDMemTable *mtMedicineCategoriesMerged;
private:	// User declarations
	TNotifyEvent FOnPostDeltas;
	void __fastcall OpenAll(String ID, bool ShowMerged);
	void __fastcall SetupQry(TFDConnection * LocalDB, TFDConnection * RemoteDB,
		TFDQuery * LocalQuery, TFDQuery *DeltaQuery, String SQL);
public:		// User declarations
	__fastcall TdtmdlDelta(TComponent* Owner, String ID, bool ShowMerged,
		TFDConnection * LocalDB, TFDConnection * RemoteDB);
	void __fastcall PostDeltas();
	__property TNotifyEvent OnPostDeltas = {read=FOnPostDeltas, write=FOnPostDeltas};
};
//---------------------------------------------------------------------------
extern PACKAGE TdtmdlDelta *dtmdlDelta;
//---------------------------------------------------------------------------
#endif
