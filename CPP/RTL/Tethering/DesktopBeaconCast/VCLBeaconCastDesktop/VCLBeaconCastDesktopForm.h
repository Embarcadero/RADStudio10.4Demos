//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef VCLBeaconCastDesktopFormH
#define VCLBeaconCastDesktopFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <IPPeerClient.hpp>
#include <IPPeerServer.hpp>
#include <System.Actions.hpp>
#include <System.Tether.AppProfile.hpp>
#include <System.Tether.Manager.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.ActnMan.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Mask.hpp>
#include <Vcl.PlatformDefaultStyleActnCtrls.hpp>
#include <Vcl.Samples.Spin.hpp>
#include <Vcl.Imaging.jpeg.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TActionManager *ActionManager1;
	TAction *actFullShot;
	TAction *actSendGUID;
	TTetheringManager *DesktopTetherManager;
	TPanel *Panel1;
	TGroupBox *GbxBeaconData;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TSpinEdit *SEdMajor;
	TMaskEdit *EdGUID;
	TSpinEdit *SEdMinor;
	TButton *BtnStartStop;
	TPanel *Panel2;
	TMemo *Memo1;
	TPanel *PnImage;
	TImage *Image1;
	TSplitter *Splitter1;
	TTetheringAppProfile *TetheringAppProfile1;
	void __fastcall TetheringAppProfile1Disconnect(TObject * const Sender, const TTetheringProfileInfo &AProfileInfo);
	void __fastcall BtnStartStopClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall actFullShotExecute(TObject *Sender);
	void __fastcall actSendGUIDExecute(TObject *Sender);
	void __fastcall DesktopTetherManagerNewManager(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo);
	void __fastcall DesktopTetherManagerPairedFromLocal(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo);
	void __fastcall DesktopTetherManagerPairedToRemote(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo);
	void __fastcall DesktopTetherManagerUnPairManager(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo);

private:	// User declarations
	TJPEGImage *Capture;
	TStream *FStream;
	String FLastGUID;
	void __fastcall ScreenShot(TBitmap *DestBitmap);
	void __fastcall Shot(void);
	String __fastcall GetComputerNetName(void);
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
