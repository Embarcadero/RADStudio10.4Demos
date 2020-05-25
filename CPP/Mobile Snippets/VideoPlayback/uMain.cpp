//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TfrmMain *frmMain;
//---------------------------------------------------------------------------
const TMediaTime TenSecond = 100000000;
const float StepForShifting = 10;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::b10SecBackwardClick(TObject* Sender)
{
	TMediaState LState = MediaPlayer1->State;
	if (MediaPlayer1->CurrentTime > TenSecond)
	{
		if (LState == TMediaState::Playing) MediaPlayer1->Stop();
		MediaPlayer1->CurrentTime = MediaPlayer1->CurrentTime - TenSecond;
		if (LState == TMediaState::Playing) MediaPlayer1->Play();
	}
	else
	{
		MediaPlayer1->CurrentTime = 0;
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::b10SecForwardClick(TObject* Sender)
{
	TMediaState LState = MediaPlayer1->State;
	if (MediaPlayer1->CurrentTime < (MediaPlayer1->Duration - TenSecond))
	{
		if (LState == TMediaState::Playing) MediaPlayer1->Stop();
		MediaPlayer1->CurrentTime = MediaPlayer1->CurrentTime + TenSecond;
		if (LState == TMediaState::Playing) MediaPlayer1->Play();
	}
	else
	{
		MediaPlayer1->CurrentTime = MediaPlayer1->Duration;
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::bChangeParentsVisibleClick(TObject* Sender)
{
	Rectangle1->Visible = !Rectangle1->Visible;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::bMovingParentDownClick(TObject* Sender)
{
	Rectangle1->Position->Y = Rectangle1->Position->Y + StepForShifting;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::bMovingParentUpClick(TObject* Sender)
{
	Rectangle1->Position->Y = Rectangle1->Position->Y - StepForShifting;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::bPlayClick(TObject* Sender)
{
	MediaPlayer1->Play();
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::bStopClick(TObject* Sender)
{
	MediaPlayer1->Stop();
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::bToTheEndClick(TObject* Sender)
{
	MediaPlayer1->CurrentTime = MediaPlayer1->Duration;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::bToTheStartClick(TObject* Sender)
{
	MediaPlayer1->CurrentTime = 0;
}
//---------------------------------------------------------------------------
void TfrmMain::FillFilesList()
{
	TSearchRec F;
	String Path = System::Ioutils::TPath::Combine(FLibraryPath, "*.mp4");
	#if defined(_PLAT_MSWINDOWS)
	int Attr = faReadOnly + faArchive;
	#else
	int Attr = 0;
	#endif
	FindFirst(Path, Attr, F);
	if (F.Name != "")
	{
		ListBox1->Items->Add(F.Name);
		while (FindNext(F) == 0)
		{
			ListBox1->Items->Add(F.Name);
		}
	}
	FindClose(F);
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::FormCreate(TObject* Sender)
{
	FLibraryPath = GetPathWithVideo();
	FillFilesList();
	tbVolume->Value = MediaPlayer1->Volume;
}
//---------------------------------------------------------------------------
String TfrmMain::GetPathWithVideo()
{
	String Result;
	switch (TOSVersion::Platform)
	{
		case TOSVersion::TPlatform::pfWindows:
			Result = "..\\..\\MP4\\";
			break;
		case TOSVersion::TPlatform::pfMacOS:
			Result = System::Ioutils::TPath::GetFullPath("../Resources/StartUp");
			break;
		case TOSVersion::TPlatform::pfiOS:
		case TOSVersion::TPlatform::pfAndroid:
			Result = System::Ioutils::TPath::GetDocumentsPath();
			break;
		case TOSVersion::TPlatform::pfWinRT:
		case TOSVersion::TPlatform::pfLinux:
			throw Exception("Unexpected platform");
	}
    return Result;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::ListBox1ItemClick(TCustomListBox * const Sender, TListBoxItem * const Item)
{
	MediaPlayer1->Stop();
	MediaPlayer1->FileName = System::Ioutils::TPath::Combine(FLibraryPath, Item->Text);
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::Panel1Click(TObject* Sender)
{
	FLibraryPath = GetPathWithVideo();
	FillFilesList();
	tbVolume->Value = MediaPlayer1->Volume;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::tbVolumeChange(TObject* Sender)
{
	MediaPlayer1->Volume = tbVolume->Value;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::Timer1Timer(TObject* Sender)
{
  if (TMediaTime(tbProcess->Max) != MediaPlayer1->Duration)
  {
	tbProcess->Max = MediaPlayer1->Duration;
  }
  if (TMediaTime(tbProcess->Value) != MediaPlayer1->CurrentTime)
  {
	tbProcess->Value = MediaPlayer1->CurrentTime;
  }
}
//---------------------------------------------------------------------------
