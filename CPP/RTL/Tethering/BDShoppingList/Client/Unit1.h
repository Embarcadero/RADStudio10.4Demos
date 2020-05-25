//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.GenData.hpp>
#include <Data.Bind.ObjectScope.hpp>
#include <Fmx.Bind.DBEngExt.hpp>
#include <Fmx.Bind.Editors.hpp>
#include <Fmx.Bind.GenData.hpp>
#include <FMX.ListView.hpp>
#include <FMX.ListView.Types.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
#include <IPPeerClient.hpp>
#include <IPPeerServer.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.Rtti.hpp>
#include <System.Tether.AppProfile.hpp>
#include <System.Tether.Manager.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.ListView.Adapters.Base.hpp>
#include <FMX.ListView.Appearances.hpp>
#include <FMX.ActnList.hpp>
#include <System.Actions.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TListView *ListView1;
	TLabel *Label1;
	TLabel *Label2;
	TButton *Button1;
	TTetheringManager *TetherBDTestManager;
	TTetheringAppProfile *TetherBDTestProfile;
	TPrototypeBindSource *PrototypeBindSource1;
	TBindingsList *BindingsList1;
	TLinkFillControlToField *LinkFillControlToFieldColorsName1;
	TActionList *ActionList1;
	TAction *actGetList;
	TTimer *tmCheckConnection;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall TetherBDTestManagerRequestManagerPassword(const TObject *Sender,
          const UnicodeString RemoteIdentifier, UnicodeString &Password);
	void __fastcall TetherBDTestManagerRemoteManagerShutdown(const TObject *Sender,
          const UnicodeString ManagerIdentifier);
	void __fastcall TetherBDTestManagerEndAutoConnect(TObject *Sender);
	void __fastcall TetherBDTestProfileResources0ResourceReceived(const TObject *Sender,
          const TRemoteResource *AResource);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall ListView1ButtonClick(TObject * const Sender, TListItem * const AItem,
          TListItemSimpleControl * const AObject);
	void __fastcall tmCheckConnectionTimer(TObject *Sender);

private:	// User declarations
	void __fastcall CheckRemoteProfiles(void);
    Boolean FIsConnected;
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
