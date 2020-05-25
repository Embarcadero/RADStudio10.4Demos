//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef formPharmacyControllerH
#define formPharmacyControllerH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
#include "dmDeltas.h"
#include "formPharmacy.h"
#include "dmLocalData.h"
//---------------------------------------------------------------------------
class TdmPharmacyController : public TDataModule
{
__published:	// IDE-managed Components
	TActionList *ActionList;
	TAction *actAddOrder;
	TAction *actFetchDeltas;
	TAction *actPostDeltas;
	void __fastcall DataModuleDestroy(TObject *Sender);
	void __fastcall actAddOrderExecute(TObject *Sender);
	void __fastcall actFetchDeltasExecute(TObject *Sender);
	void __fastcall actPostDeltasExecute(TObject *Sender);
private:	// User declarations
	TfrmPharmacy *FView;
	TdtmdLocalDB * FDataModel;
	TdtmdlDelta * dtmdlDelta;
	void __fastcall NavigateToMeds(TObject * Sender);
public:		// User declarations
	__fastcall TdmPharmacyController(TfrmPharmacy *AView, TdtmdLocalDB * ADataModel);
};
//---------------------------------------------------------------------------
extern PACKAGE TdmPharmacyController *dmPharmacyController;
//---------------------------------------------------------------------------
#endif
