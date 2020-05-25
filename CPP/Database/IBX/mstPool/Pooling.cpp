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

#include "Pooling.h"
#include <System.Win.Registry.hpp>	// Pascal unit
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

const System::UnicodeString MTSRegistryKey = "\SOFTWARE\BORLAND\DATABASE ENGINE\SETTINGS\SYSTEM\INIT";


TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::MTSPoolingClick(TObject *Sender)
{
	TRegistry *reg;

  // Set the registry value to whatever the flag is
  reg = new TRegistry();
  reg->RootKey = HKEY_LOCAL_MACHINE;
  if ( reg->OpenKey( MTSRegistryKey, false) )
  {
	if (MTSPooling->Checked)
	  reg->WriteString("MTS POOLING", "TRUE");
	else
	  reg->WriteString("MTS POOLING", "FALSE");
	reg->CloseKey();
  }
  free(reg);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormActivate(TObject *Sender)
{
  TRegistry *reg;
  UnicodeString keyValue;

  // Determine the current registry value
  reg = new TRegistry();
  reg->RootKey = HKEY_LOCAL_MACHINE;
  if ( reg->OpenKey( MTSRegistryKey, false) )
	{
	keyValue = reg->ReadString("MTS POOLING");

	if ( keyValue == "TRUE" )
	  MTSPooling->Checked = true;
	else
	  MTSPooling->Checked = false;
	reg->CloseKey();
	}
  free(reg);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TestBtnClick(TObject *Sender)
{
  Word Hour, Min, Sec, MSec;

  // Start the timer
  dtStart = Now();
  StartTimeEdt->Text = TimeToStr( dtStart );

  // Run the test
  DoTest();

  // End the timer, and calculate the elapsed time
  dtEnd = Now();
  EndTimeEdt->Text = TimeToStr( dtEnd );

  dtElp = dtEnd - dtStart;
  DecodeTime( dtElp, Hour, Min, Sec, MSec );

  ElpTimeEdt->Text = IntToStr( Hour * 60 + Min )  + ":" + IntToStr( Sec ) + "." + IntToStr( MSec );
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DoTest(void)
{

  int iCnt;

  // Close bde to ensure MTS Pooling param will be used

  for (iCnt = 1; iCnt <= StrToInt( Count->Text ); iCnt++)
	{
	Database1->Connected = true;
	Query1->Active = true;
	Query1->Active = false;
	Database1->Connected = true;
	}
}
