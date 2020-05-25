//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef formMergeMainControllerH
#define formMergeMainControllerH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.DApt.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.Comp.Client.hpp>
#include "formMergeMain.h"
#include "dmDatabase.h"
#include <vector>
//---------------------------------------------------------------------------
class TMergeMainController : public TDataModule
{
__published:	// IDE-managed Components
	TActionList *ActionList;
	TAction *actMerge;
	TAction *actGetIBFileName;
	void __fastcall actMergeExecute(TObject *Sender);
	void __fastcall actGetIBFileNameExecute(TObject *Sender);
private:	// User declarations
	TfrmMergeMain * FView;
	void __fastcall SetUpProgress(TFDQuery * Qry, TProgressBar *ProgressBar);
	void __fastcall RemoveDeletedRecords(TFDQuery *IBData, TFDQuery *MasterData,
		std::vector<String> ValueFields, TProgressBar *ProgressBar);
	void __fastcall ProcessUpdatesToIB(TFDQuery * IBData, TFDQuery *MasterData,
	std::vector<String> ValueFields, TProgressBar * ProgressBar);
public:		// User declarations
	__fastcall TMergeMainController(TComponent* Owner, TfrmMergeMain * AFView);
};
//---------------------------------------------------------------------------
extern PACKAGE TMergeMainController *MergeMainController;
//---------------------------------------------------------------------------
#endif
