//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef FMXClientBeaconCastFormH
#define FMXClientBeaconCastFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.ActnList.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.ImgList.hpp>
#include <FMX.ListView.hpp>
#include <FMX.ListView.Types.hpp>
#include <FMX.Memo.hpp>
#include <FMX.Objects.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
#include <IPPeerClient.hpp>
#include <IPPeerServer.hpp>
#include <System.Actions.hpp>
#include <System.Beacon.Components.hpp>
#include <System.Beacon.hpp>
#include <System.ImageList.hpp>
#include <System.Tether.AppProfile.hpp>
#include <System.Tether.Manager.hpp>
//---------------------------------------------------------------------------
class TBeaconItem
{
public:
	System::UnicodeString ProfileId;
	System::TGUID AGUID;
	int Major;
	int Minor;
	void __fastcall Parse(const System::UnicodeString AString);
};

class TForm8 : public TForm
{
__published:	// IDE-managed Components
	TActionList *ActionList1;
	TAction *Action1;
	TAction *Action2;
	TAction *Action3;
	TBeacon *Beacon1;
	TTetheringAppProfile *CommandApp;
	TTetheringManager *CommandManager;
	TImageList *ImageList1;
	TPanel *Panel1;
	TListView *ListView1;
	TSplitter *Splitter1;
	TMemo *Memo1;
	TPanel *Panel2;
	TImage *Image1;
	TToolBar *ToolBar1;
	TLabel *lbStatus;
	TToolBar *ToolBar2;
	TLabel *Label1;
	TButton *Button2;
	void __fastcall Beacon1BeaconProximity(TObject * const Sender, IBeacon * const ABeacon, TBeaconProximity Proximity);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall CommandAppDisconnect(TObject * const Sender, const TTetheringProfileInfo &AProfileInfo);
	void __fastcall CommandAppResources1ResourceReceived(TObject * const Sender, TRemoteResource * const AResource);
	void __fastcall CommandManagerEndAutoConnect(TObject *Sender);
	void __fastcall CommandManagerPairedFromLocal(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo);
	void __fastcall CommandManagerPairedToRemote(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo);
	void __fastcall CommandManagerRequestManagerPassword(TObject * const Sender, const UnicodeString ARemoteIdentifier, UnicodeString &Password);
	void __fastcall CommandManagerUnPairManager(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);

private:	// User declarations
	bool FIsConnected;
	TList * FProfilesBeacon;
	void __fastcall CheckRemoteProfiles(void);
	void __fastcall ProcessBeaconInfoResource(TRemoteResource * const AResource, const TTetheringProfileInfo &AProfile);
	void __fastcall LoadRemoteResourceImage(TRemoteResource * const AResource, const TTetheringProfileInfo &AProfile);
public:		// User declarations
	__fastcall TForm8(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm8 *Form8;
//---------------------------------------------------------------------------
#endif
