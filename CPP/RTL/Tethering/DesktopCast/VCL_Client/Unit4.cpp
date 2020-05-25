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

#include "Unit4.h"
#include <memory>
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

// ---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::CheckRemoteProfiles(void) {
	System::UnicodeString ConnectedProfiles;
	if (DesktopTheterManager->RemoteProfiles->Count > 0) {
		for (int i = 0; i < DesktopTheterManager->RemoteProfiles->Count; i++) {
			ConnectedProfiles +=
				" - " + DesktopTheterManager->RemoteProfiles->Items[i]
				.ProfileText;
		}
		Label1->Caption = "Working with : " + ConnectedProfiles;
		FIsConnected = true;
	}
	else {
		Label1->Caption = "You are not connected";
		FIsConnected = false;
	}
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::DesktopTheterManagerEndAutoConnect(TObject *Sender) {
	this->CheckRemoteProfiles();
}
// ---------------------------------------------------------------------------

void __fastcall TForm1::DesktopTheterManagerRequestManagerPassword
	(const TObject *Sender, const UnicodeString RemoteIdentifier,
	UnicodeString &Password) {
	Password = "Desktop";
}

// ---------------------------------------------------------------------------
void __fastcall TForm1::tmCheckConnectionTimer(TObject *Sender) {
	this->CheckRemoteProfiles();
}
// ---------------------------------------------------------------------------
void __fastcall TForm1::Button4Click(TObject *Sender) {
	DesktopTheterManager->AutoConnect();
	tmCheckConnection->Enabled = true;
}
// ---------------------------------------------------------------------------
void __fastcall TForm1::TetheringAppProfile1Resources0ResourceReceived(const TObject *Sender,
          const TRemoteResource *AResource)
{
	__int64 lSize = AResource->Value.AsStream->Size;
	this->Caption = "Resource received at " + DateTimeToStr(Now()) + " size " +
		System::UnicodeString(lSize);
	AResource->Value.AsStream->Position = 0;

	std::unique_ptr<TJPEGImage>lJpegImg(new TJPEGImage());
	lJpegImg->LoadFromStream(AResource->Value.AsStream);
	Image1->Picture->Bitmap->Assign(lJpegImg.get());
	Image1->Invalidate();
}
//---------------------------------------------------------------------------

