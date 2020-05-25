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

#include "VCLBeaconCastDesktopForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ScreenShot(TBitmap *DestBitmap)
{
	HDC DC;
	HWND dwhandle;

	dwhandle = GetDesktopWindow();
	DC = GetDC(dwhandle) ;
	try {
		DestBitmap->Width = 10;
		DestBitmap->Width = GetDeviceCaps(DC, HORZRES);
		DestBitmap->Height = GetDeviceCaps(DC, VERTRES);
		BitBlt(DestBitmap->Canvas->Handle, 0, 0, DestBitmap->Width, DestBitmap->Height, DC, 0, 0, SRCCOPY);
	}
	__finally {
		ReleaseDC(dwhandle, DC);
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Shot(void)
{
	TBitmap *LCapture = new TBitmap();

	ScreenShot(LCapture);
	Capture->Assign(LCapture);
	Image1->Picture->Bitmap->Assign(LCapture);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TetheringAppProfile1Disconnect(TObject * const Sender, const TTetheringProfileInfo &AProfileInfo)
{
	Memo1->Lines->Add("Profile disconnect:");
	Memo1->Lines->Add(AProfileInfo.ManagerIdentifier + " - " + AProfileInfo.ProfileIdentifier);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::BtnStartStopClick(TObject *Sender)
{
	DesktopTetherManager->Enabled = !DesktopTetherManager->Enabled;
	EdGUID->Enabled = !DesktopTetherManager->Enabled;
	SEdMajor->Enabled = !DesktopTetherManager->Enabled;
	SEdMinor->Enabled = !DesktopTetherManager->Enabled;
	if (BtnStartStop->Caption == "Start")
	{
		TetheringAppProfile1->Resources->Items[1]->Value = TResourceValue::_op_Implicit(EdGUID->Text + ";" + IntToStr(SEdMajor->Value) + ";" +
			IntToStr(SEdMinor->Value));
		BtnStartStop->Caption = "Stop";
	}
	else
		BtnStartStop->Caption = "Start";
}
//---------------------------------------------------------------------------
String __fastcall TForm1::GetComputerNetName(void)
{
	wchar_t LBuffer[256];
	DWORD LSize = 256;
	if (GetComputerName(LBuffer, &LSize))
		return LBuffer;
	else
		return "";
}

void __fastcall TForm1::FormCreate(TObject *Sender)
{
	Capture = new TJPEGImage();
	TetheringAppProfile1->Text = "Desktop cast " + GetComputerNetName();
	Caption = TetheringAppProfile1->Text;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::actFullShotExecute(TObject *Sender)
{
	Memo1->Lines->Add("Running full shot at " + DateTimeToStr(Now()));
	Shot();
	FStream = new TMemoryStream();
	FStream->Position = 0;
	Capture->SaveToStream(FStream);
	Memo1->Lines->Add("Stream size: " + IntToStr(FStream->Size));
	FStream->Position = 0;
	TetheringAppProfile1->Resources->Items[0]->Value.operator =(FStream);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::actSendGUIDExecute(TObject *Sender)
{
	if (FLastGUID != "")
		TetheringAppProfile1->Resources->Items[1]->Value = FLastGUID;
	else
		TetheringAppProfile1->Resources->Items[1]->Value = "GUID_NOT_SET";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DesktopTetherManagerNewManager(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo)
{
	Memo1->Lines->Add("New Manager:");
	Memo1->Lines->Add(AManagerInfo.ManagerIdentifier + " - " + AManagerInfo.ManagerName + " - " + AManagerInfo.ConnectionString);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DesktopTetherManagerPairedFromLocal(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo)

{
	Memo1->Lines->Add("Manager PairedFromLocal:");
	Memo1->Lines->Add(AManagerInfo.ManagerIdentifier + " - " + AManagerInfo.ManagerName + " - " + AManagerInfo.ConnectionString);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DesktopTetherManagerPairedToRemote(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo)

{
	Memo1->Lines->Add("Manager PairedToRemote:");
	Memo1->Lines->Add(AManagerInfo.ManagerIdentifier + " - " + AManagerInfo.ManagerName + " - " + AManagerInfo.ConnectionString);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DesktopTetherManagerUnPairManager(TObject * const Sender, const TTetheringManagerInfo &AManagerInfo)

{
	Memo1->Lines->Add("Manager UnPaired:");
	Memo1->Lines->Add(AManagerInfo.ManagerIdentifier + " - " + AManagerInfo.ManagerName + " - " + AManagerInfo.ConnectionString);
}
//---------------------------------------------------------------------------

