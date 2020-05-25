//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef dmLocalDataH
#define dmLocalDataH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.Comp.UI.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.IB.hpp>
#include <FireDAC.Phys.IBBase.hpp>
#include <FireDAC.Phys.IBDef.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
//---------------------------------------------------------------------------
class TdtmdLocalDB : public TDataModule
{
__published:	// IDE-managed Components
	TFDConnection *FDConnection;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
	TFDQuery *qryCategory;
	TIntegerField *qryCategoryCATEGORY_ID;
	TWideStringField *qryCategoryCATEGORY_NAME;
	TMemoField *qryCategoryDESCRIPTION;
	TFDQuery *qryMedicines;
	TIntegerField *qryMedicinesMEDICINE_ID;
	TWideStringField *qryMedicinesMEDICINE_NAME;
	TWideStringField *qryMedicinesURL;
	TMemoField *qryMedicinesPATIENT_ADVICE;
	TMemoField *qryMedicinesSPECIAL_WARNINGS;
	TFDPhysIBDriverLink *FDPhysIBDriverLink1;
	TDataSource *dsPharmacy;
	TFDQuery *qryPharmacy;
	TIntegerField *qryPharmacyPHARMACY_ID;
	TMemoField *qryPharmacyPHARMACY_ADDRESS;
	TWideStringField *qryPharmacyPHARMACY_NAME;
	TDataSource *dsCategory;
	TFDQuery *qryCustomer;
	TIntegerField *qryCustomerCUSTOMER_ID;
	TIntegerField *qryCustomerPHARMACY_ID;
	TWideStringField *qryCustomerCUSTOMER_NAME;
	TMemoField *qryCustomerCUSTOMER_ADDRESS;
	TFDQuery *qryOrders;
	TIntegerField *qryOrdersCUSTOMER_ID;
	TIntegerField *qryOrdersPHARMACY_ID;
	TIntegerField *qryOrdersMEDICINE_ID;
	TSQLTimeStampField *qryOrdersDATE_TIME;
	TIntegerField *qryOrdersQUANTITY;
	TStringField *qryOrdersMEDICINE_NAME;
	TDataSource *dsCustomer;
	TFDQuery *qryMedLookup;
	TFDStoredProc *spGetID;
	TIntegerField *spGetIDNEWID;
	TDataSource *dsOrders;
	TFDConnection *FDConnectionRemote;
	void __fastcall FDConnectionAfterConnect(TObject *Sender);
	void __fastcall FDConnectionBeforeDisconnect(TObject *Sender);
	void __fastcall qryCustomerAfterInsert(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
	__fastcall TdtmdLocalDB(TComponent* Owner);
	int __fastcall GetID();
	void __fastcall RefreshMedicineData(TObject * Sender);
};
//---------------------------------------------------------------------------
extern PACKAGE TdtmdLocalDB *dtmdLocalDB;
//---------------------------------------------------------------------------
#endif
