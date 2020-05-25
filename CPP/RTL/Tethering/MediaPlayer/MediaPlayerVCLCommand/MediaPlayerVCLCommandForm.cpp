//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MediaPlayerVCLCommandForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm9 *Form9;
//---------------------------------------------------------------------------
__fastcall TForm9::TForm9(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm9::Button1Click(TObject *Sender)
{
	if (CheckMediaPlayers()) {
		VCLCommandApp->RunRemoteAction(
			VCLCommandManager->RemoteProfiles->Items[LbPlayers->ItemIndex], "acPlayPause");
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Button2Click(TObject *Sender)
{
	LbPlayers->Clear();
	VCLCommandManager->DiscoverManagers();
}
//---------------------------------------------------------------------------
bool __fastcall TForm9::CheckMediaPlayers(void)
{
	if (LbPlayers->ItemIndex >= 0) {
		return true;
	} else {
		ShowMessage("Select a MediaPlayer from the list to connect, please");
		return false;
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::FormCreate(TObject *Sender)
{
	FInvariantFormatSettings.DecimalSeparator = L'.';
	FInvariantFormatSettings.ThousandSeparator = L',';
}
//---------------------------------------------------------------------------

void __fastcall TForm9::VolumeTrackChange(TObject *Sender)
{
	if (CheckMediaPlayers()) {
		VCLCommandApp->SendString(
			VCLCommandManager->RemoteProfiles->Items[LbPlayers->ItemIndex],
				"VolumeTrack", FloatToStr((double)VolumeTrack->Position / (double)100.00,
						FInvariantFormatSettings));
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::VCLCommandManagerEndManagersDiscovery(const TObject *Sender,
		  const TTetheringManagerInfoList *RemoteManagers)
{
	for (int i = 0; i < RemoteManagers->Count; i++) {
		if (const_cast<TTetheringManagerInfoList*>(RemoteManagers)->Items[i].ManagerText == "FMXManager") {
			VCLCommandManager->PairManager(
				const_cast<TTetheringManagerInfoList*>(RemoteManagers)->Items[i]);
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::VCLCommandManagerEndProfilesDiscovery(const TObject *Sender,
          const TTetheringProfileInfoList *RemoteProfiles)
{
	LbPlayers->Clear();
	for (int i = 0; i < VCLCommandManager->RemoteProfiles->Count; i++) {
		if (VCLCommandManager->RemoteProfiles->Items[i].ProfileText == "FMXMediaPlayer") {
			LbPlayers->Items->Add(VCLCommandManager->RemoteProfiles->Items[i].ProfileText);
		}
	}
	if (LbPlayers->Count > 0) {
		LbPlayers->ItemIndex = 0;
		VCLCommandApp->Connect(VCLCommandManager->RemoteProfiles->Items[0]);
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::VCLCommandManagerRequestManagerPassword(const TObject *Sender,
          const UnicodeString RemoteIdentifier, UnicodeString &Password)

{
	Password = "1234";
}
//---------------------------------------------------------------------------

