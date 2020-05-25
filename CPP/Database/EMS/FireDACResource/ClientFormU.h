//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef ClientFormUH
#define ClientFormUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <IPPeerClient.hpp>
#include <REST.Backend.EMSFireDAC.hpp>
#include <REST.Backend.EMSProvider.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <REST.Backend.EMSServices.hpp>
//---------------------------------------------------------------------------
class TClientForm : public TForm
{
__published:	// IDE-managed Components
	TDBGrid *DBGrid1;
	TDBGrid *DBGrid2;
	TPanel *Panel1;
	TButton *Button1;
	TButton *Button2;
	TEMSFireDACClient *EMSFireDACClient1;
	TEMSProvider *EMSProvider1;
	TActionList *ActionList1;
	TAction *ActionGetTables;
	TAction *ActionPostUpdates;
	void __fastcall ActionGetTablesExecute(TObject *Sender);
	void __fastcall ActionGetTablesUpdate(TObject *Sender);
	void __fastcall ActionPostUpdatesExecute(TObject *Sender);
	void __fastcall ActionPostUpdatesUpdate(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TClientForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TClientForm *ClientForm;
//---------------------------------------------------------------------------
#endif
