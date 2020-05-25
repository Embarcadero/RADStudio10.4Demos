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

#include "NotificationsUnit.h"
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
void __fastcall TForm1::btnShowClick(TObject *Sender)
{
	TNotification *MyNotification;
	MyNotification = new TNotification;
	try
	{
		MyNotification->Name = "Windows10Notification";
		MyNotification->Title = "Windows 10 Notification #1";
		MyNotification->AlertBody = "RAD Studio 10 Seattle";

		NotificationCenter1->PresentNotification(MyNotification);
	}
	__finally
	{
		delete MyNotification;
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnShowAnotherClick(TObject *Sender)
{
	TNotification *MyNotification;
	MyNotification = new TNotification;
	try
	{
		MyNotification->Name = "Windows10Notification2";
		MyNotification->Title = "Windows 10 Notification #2";
		MyNotification->AlertBody = "RAD Studio 10 Seattle";

		NotificationCenter1->PresentNotification(MyNotification);
	}
	__finally
	{
		delete MyNotification;
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnCancelClick(TObject *Sender)
{
    NotificationCenter1->CancelNotification("Windows10Notification");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnCancelAnotherClick(TObject *Sender)
{
    NotificationCenter1->CancelNotification("Windows10Notification2");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnCancelAllClick(TObject *Sender)
{
	NotificationCenter1->CancelAll();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::NotificationCenter1ReceiveLocalNotification(TObject *Sender, TNotification *ANotification)
{
	mmLog->Lines->Add("Notification received: " + ANotification->Name);
}
//---------------------------------------------------------------------------

