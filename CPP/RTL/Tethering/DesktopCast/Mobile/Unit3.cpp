//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "Unit3.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm3 *Form3;
//---------------------------------------------------------------------------
__fastcall TForm3::TForm3(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm3::CheckRemoteProfiles(void) {
	System::UnicodeString ConnectedProfiles;
	if (CommandManager->RemoteProfiles->Count > 0) {
		for (int i = 0; i < CommandManager->RemoteProfiles->Count; i++) {
			ConnectedProfiles +=
				" - " + CommandManager->RemoteProfiles->Items[i]
				.ProfileText;
		}
		Label1->Text = "Working with : " + ConnectedProfiles;
		FIsConnected = true;
	}
	else {
		Label1->Text = "You are not connected";
		FIsConnected = false;
	}
}
// ---------------------------------------------------------------------------
void __fastcall TForm3::tmCheckConnectionTimer(TObject *Sender)
{
	this->CheckRemoteProfiles();
}
//---------------------------------------------------------------------------

void __fastcall TForm3::Button2Click(TObject *Sender)
{
	CommandManager->AutoConnect();
  	tmCheckConnection->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TForm3::FormCreate(TObject *Sender)
{
	FIsConnected = false;
}
//---------------------------------------------------------------------------
void __fastcall TForm3::CommandManagerRequestManagerPassword(const TObject *Sender,
	const UnicodeString RemoteIdentifier, UnicodeString &Password)
{
	Password = "Desktop";
}
//---------------------------------------------------------------------------
void __fastcall TForm3::CommandAppResources0ResourceReceived(const TObject *Sender,
	const TRemoteResource *AResource)
{
	__int64 lSize = AResource->Value.AsStream->Size;
	lbStatus->Text = "Resource received at " + DateTimeToStr(Now()) + " size " +
		System::UnicodeString(lSize);
	AResource->Value.AsStream->Position = 0;
	Image1->Bitmap->LoadFromStream(AResource->Value.AsStream);
	Image1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TForm3::CommandManagerEndManagersDiscovery(const TObject *Sender,
          const TTetheringManagerInfoList *RemoteManagers)
{
	TakeShot->Enabled = true;
}
//---------------------------------------------------------------------------

