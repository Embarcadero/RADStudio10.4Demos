//---------------------------------------------------------------------------
// Copyright (c) 2016 Embarcadero Technologies, Inc. All rights reserved.  
//
// This software is the copyrighted property of Embarcadero Technologies, Inc. 
// ("Embarcadero") and its licensors. You may only use this software if you 
// are an authorized licensee of Delphi, C++Builder or RAD Studio 
// (the "Embarcadero Products").  This software is subject to Embarcadero's 
// standard software license and support agreement that accompanied your 
// purchase of the Embarcadero Products and is considered a Redistributable,
// as such term is defined thereunder. Your use of this software constitutes
// your acknowledgement of your agreement to the foregoing software license
// and support agreement.
//---------------------------------------------------------------------------

#include <fmx.h>
#include <memory>
#pragma hdrstop

#include "uMain.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"

TNotificationsForm *NotificationsForm;

// ---------------------------------------------------------------------------
__fastcall TNotificationsForm::TNotificationsForm(TComponent *Owner) : TForm(Owner) {
}
// ---------------------------------------------------------------------------
void __fastcall TNotificationsForm::NotificationCPermissionRequestResult(TObject *Sender, const bool AIsGranted)
{
	if (AIsGranted && PendingAction)
	{
		PendingAction->Execute();
	}

	PendingAction = nullptr;
}
// ---------------------------------------------------------------------------
void __fastcall TNotificationsForm::NotificationCReceiveLocalNotification(TObject *Sender, TNotification *ANotification)
{
	Memo1->Lines->Add(ANotification->AlertBody);
}
// ---------------------------------------------------------------------------
void __fastcall TNotificationsForm::ActionListExecute(TBasicAction *Action, bool &Handled)
{
	if (NotificationC->AuthorizationStatus() != TAuthorizationStatus::Authorized)
	{
		Handled = true;
		PendingAction = Action;

		NotificationC->RequestPermission();
	}
}
// ---------------------------------------------------------------------------
void __fastcall TNotificationsForm::ActionSendScheduledNotificationExecute(TObject *Sender)
{
	std::unique_ptr<TNotification> Notification(NotificationC->CreateNotification());
	Notification->Name = "MyNotification";
	Notification->AlertBody = "C++Builder for Mobile is here!";
	/* Fired in 10 second */
	Notification->FireDate = Now() + EncodeTime(0, 0, 10, 0);

	/* Send notification in Notification Center */
	NotificationC->ScheduleNotification(Notification.get());
}
// ---------------------------------------------------------------------------
void __fastcall TNotificationsForm::ActionSendNotificationImmediatelyExecute(TObject *Sender)
{
	std::unique_ptr<TNotification> Notification(NotificationC->CreateNotification());
	Notification->AlertBody = "C++Builder for Mobile is here!";
	Notification->FireDate = Now();

	// Send notification in Notification Center
	NotificationC->PresentNotification(Notification.get());
}
// ---------------------------------------------------------------------------
void __fastcall TNotificationsForm::ActionCancelScheduledExecute(TObject *Sender)
{
	// Providing the fact that you already have a MyNotification previously issued
	NotificationC->CancelNotification("MyNotification");
}
// ---------------------------------------------------------------------------
void __fastcall TNotificationsForm::ActionCancelAllNotificationsExecute(TObject *Sender)
{
	NotificationC->CancelAll();
}
// ---------------------------------------------------------------------------
