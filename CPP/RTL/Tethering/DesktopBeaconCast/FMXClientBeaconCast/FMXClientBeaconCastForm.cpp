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

#include "FMXClientBeaconCastForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm8 *Form8;

void __fastcall TBeaconItem::Parse(const System::String AString)
{
	AnsiString ansiStr(AString);
	char* str = new char[ansiStr.Length()+1];
	strcpy(str, ansiStr.c_str());

	char *p = strtok(str, ";");
	AGUID = StringToGUID(p);
	Major = StrToInt(strtok(NULL, ";"));
	Minor = StrToInt(strtok(NULL, ";"));
	delete[] str;

}
//---------------------------------------------------------------------------
__fastcall TForm8::TForm8(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm8::Beacon1BeaconProximity(TObject * const Sender, IBeacon * const ABeacon, TBeaconProximity Proximity)

{
	String LProfileID;
	TBeaconItem *LBeaconItem;
	TRemoteResource *LRemoteImage;

	for (int i = 0; i < FProfilesBeacon->Count; i++) {
		LBeaconItem = (TBeaconItem*)FProfilesBeacon->Items[i];
		if ((LBeaconItem->AGUID == ABeacon->GUID) && (LBeaconItem->Major == ABeacon->Major) &&
			(LBeaconItem->Minor == ABeacon->Minor))  {
				LProfileID = LBeaconItem->ProfileId;
				ListView1->Items->AppearanceItem[i]->ImageIndex = Proximity;
				break;
		}
	}

	if ((Proximity == Immediate) && (LProfileID != "")) {
		for (int i = 0; i < CommandApp->ConnectedProfiles->Count; i++) {
			CommandApp->RunRemoteAction(CommandApp->ConnectedProfiles->Items[i], "acFullShot");
			TRemoteResource * LRemoteImage = CommandApp->GetRemoteResourceValue(CommandApp->ConnectedProfiles->Items[i], "BmpCast");
			LoadRemoteResourceImage(LRemoteImage, CommandApp->ConnectedProfiles->Items[i]);
			break;
		}
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm8::LoadRemoteResourceImage(TRemoteResource * const AResource, const TTetheringProfileInfo &AProfile)
{
	try {
		lbStatus->Text = "Resource received from " + AProfile.ProfileText + " at " + DateTimeToStr(Now())
		  + " size " + IntToStr(AResource->Value.AsStream->Size);
		AResource->Value.AsStream->Position = 0;
		Image1->Bitmap->LoadFromStream(AResource->Value.AsStream);
		Image1->Repaint();		
	} catch (...) {
	}
}
void __fastcall TForm8::Button2Click(TObject *Sender)
{
	CommandManager->AutoConnect(2000);
}
//---------------------------------------------------------------------------

void __fastcall TForm8::CommandAppDisconnect(TObject * const Sender, const TTetheringProfileInfo &AProfileInfo)
{
	Memo1->Lines->Add("Profile disconnect:");
	Memo1->Lines->Add(AProfileInfo.ManagerIdentifier + " - " + AProfileInfo.ProfileIdentifier);

	for (int i = 0; i < FProfilesBeacon->Count; i++) {
		TBeaconItem *LBeaconItem = (TBeaconItem*)FProfilesBeacon->Items[i];
		if ( LBeaconItem->ProfileId == AProfileInfo.ProfileIdentifier) {
			ListView1->Items->Delete(i);
			FProfilesBeacon->Delete(i);
			break;
		}
	}
}
//---------------------------------------------------------------------------


void __fastcall TForm8::CommandAppResources1ResourceReceived(TObject * const Sender, TRemoteResource * const AResource)
{
	ProcessBeaconInfoResource(AResource, AResource->Profile->ConnectedProfiles->Items[0]);
}
//---------------------------------------------------------------------------
void __fastcall TForm8::ProcessBeaconInfoResource(TRemoteResource * const AResource, const TTetheringProfileInfo &AProfile)
{
	TBeaconItem *LBeaconInfo;
	System::UnicodeString LIdentifier;
	System::UnicodeString LProfileText;
	bool NeedAdd;
	TListViewItem *LListItem;

	if ((AResource == NULL) || (AResource->Value.AsString == ""))
		return;

	NeedAdd = true;
	LIdentifier = AProfile.ProfileIdentifier;
	LProfileText = AProfile.ProfileText;

	LBeaconInfo = new TBeaconItem();
	LBeaconInfo->Parse(AResource->Value.AsString);
	LBeaconInfo->ProfileId = LIdentifier;

	for (int i = 0; i < FProfilesBeacon->Count; i++) {
		TBeaconItem *LBeaconItem = (TBeaconItem*)FProfilesBeacon->Items[i];
		if (LBeaconItem->ProfileId == LIdentifier) {
			FProfilesBeacon->Items[i] = LBeaconInfo;
			NeedAdd = false;
		}
	}

	if (NeedAdd) {
		FProfilesBeacon->Add(LBeaconInfo);
		LListItem = ListView1->Items->Add();
		LListItem->Text = LProfileText;
		LListItem->Detail = IntToStr(LBeaconInfo->Major) + "." + IntToStr(LBeaconInfo->Minor) + " " +
			GUIDToString(LBeaconInfo->AGUID);
		LListItem->ImageIndex = 0;
	}
	Beacon1->Enabled = False;
	TBeaconRegionItem *LBeaconRegion = (TBeaconRegionItem *)Beacon1->MonitorizedRegions->Add();
	LBeaconRegion->GUID = LBeaconInfo->AGUID;
	LBeaconRegion->Major = MAJOR_REGION_ALL;
	LBeaconRegion->Minor = MINOR_REGION_ALL;
	Beacon1->Enabled = true;
	lbStatus->Text = "Beacon info received:" + AResource->Value.AsString;

}
//---------------------------------------------------------------------------

void __fastcall TForm8::CommandManagerEndAutoConnect(TObject *Sender)
{
	Memo1->Lines->Add("End autoconnect");
	CheckRemoteProfiles();
}
//---------------------------------------------------------------------------

void __fastcall TForm8::CommandManagerPairedFromLocal(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo)
{
	Memo1->Lines->Add("Manager PairedFromLocal  :");
	Memo1->Lines->Add(AManagerInfo.ManagerIdentifier + " - " + AManagerInfo.ManagerName + " - " + AManagerInfo.ConnectionString);
}
//---------------------------------------------------------------------------

void __fastcall TForm8::CommandManagerPairedToRemote(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo)
{
	Memo1->Lines->Add("Manager PairedToRemote  :");
	Memo1->Lines->Add(AManagerInfo.ManagerIdentifier + " - " + AManagerInfo.ManagerName + " - " + AManagerInfo.ConnectionString);
}
//---------------------------------------------------------------------------

void __fastcall TForm8::CommandManagerRequestManagerPassword(TObject * const Sender, const UnicodeString ARemoteIdentifier,
		  UnicodeString &Password)
{
	Password = "Desktop";
}
//---------------------------------------------------------------------------

void __fastcall TForm8::CommandManagerUnPairManager(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo)
{
	Memo1->Lines->Add("Manager UnPaired:");
	Memo1->Lines->Add(AManagerInfo.ManagerIdentifier + " - " + AManagerInfo.ManagerName + " - " + AManagerInfo.ConnectionString);
}
//---------------------------------------------------------------------------

void __fastcall TForm8::FormCreate(TObject *Sender)
{
	FIsConnected = false;
	FProfilesBeacon = new TList();
}
//---------------------------------------------------------------------------

void __fastcall TForm8::FormDestroy(TObject *Sender)
{
	delete FProfilesBeacon;
}
//---------------------------------------------------------------------------
void __fastcall TForm8::CheckRemoteProfiles(void)
{
	System::String ConnectedProfiles;

	if (CommandManager->RemoteProfiles->Count > 0) {
		for (int i = 0; i < CommandManager->RemoteProfiles->Count; i++) {
			if (CommandManager->RemoteProfiles->Items[i].ProfileGroup == CommandApp->Group) {
				try {
					ConnectedProfiles = ConnectedProfiles + " - " + CommandManager->RemoteProfiles->Items[i].ProfileText;
					TTetheringProfileInfo LProfileInfo;
					LProfileInfo = CommandManager->RemoteProfiles->Items[i];
					TRemoteResource * LBeaconInfoResource;
					LBeaconInfoResource = CommandApp->GetRemoteResourceValue(LProfileInfo, "BeaconGUID");
					ProcessBeaconInfoResource( LBeaconInfoResource, LProfileInfo);
				}
				catch (...) {
				}
			}
		}
		Label1->Text =  "Working with :" + ConnectedProfiles;
		FIsConnected = true;
	}
	else {
		Label1->Text = "You are not connected";
		FIsConnected = false;
	}
}


