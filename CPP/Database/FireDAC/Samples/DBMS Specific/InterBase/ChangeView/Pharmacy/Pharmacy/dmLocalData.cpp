//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#pragma hdrstop

#include "dmLocalData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TdtmdLocalDB *dtmdLocalDB;
//---------------------------------------------------------------------------
__fastcall TdtmdLocalDB::TdtmdLocalDB(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TdtmdLocalDB::FDConnectionAfterConnect(TObject *Sender)
{
	qryMedLookup->Open();
	qryCategory->Open();
	qryMedicines->Open();
	qryPharmacy->Open();
	qryCustomer->Open();
	qryOrders->Open();
}
//---------------------------------------------------------------------------
void __fastcall TdtmdLocalDB::FDConnectionBeforeDisconnect(TObject *Sender)
{
	if (qryCategory) {
		qryCategory->Close();
		qryMedicines->Close();
		qryPharmacy->Close();
		qryCustomer->Close();
		qryOrders->Close();
		qryMedLookup->Close();
	}
}
//---------------------------------------------------------------------------
int __fastcall TdtmdLocalDB::GetID()
{
	spGetID->ExecProc();
	return spGetID->Params->ParamByName("NewID")->Value;
}
//---------------------------------------------------------------------------
void __fastcall TdtmdLocalDB::RefreshMedicineData(TObject * Sender)
{
	qryCategory->Refresh();
	qryMedicines->Refresh();
	qryMedLookup->Refresh();
}
//---------------------------------------------------------------------------
void __fastcall TdtmdLocalDB::qryCustomerAfterInsert(TDataSet *DataSet)
{
    qryCustomerCUSTOMER_ID->AsInteger = GetID();
}
//---------------------------------------------------------------------------
