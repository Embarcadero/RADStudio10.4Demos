//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------

#include <System.Actions.hpp>
#include <System.Classes.hpp>
#include <System.Notification.hpp>
#include <FMX.ActnList.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Memo.hpp>
#include <FMX.Memo.Types.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
//---------------------------------------------------------------------------
class TNotificationsForm : public TForm
{
__published:	// IDE-managed Components
	TButton *btnSendScheduledNotification;
	TToolBar *ToolBar1;
	TLabel *Label1;
	TButton *btnSendNotificationImmediately;
	TToolBar *ToolBar2;
	TSpeedButton *SpeedButton1;
	TSpeedButton *SpeedButton2;
	TNotificationCenter *NotificationC;
	TMemo *Memo1;
	TActionList *ActionList;
	TAction *ActionSendScheduledNotification;
	TAction *ActionSendNotificationImmediately;
	TAction *ActionCancelScheduled;
	TAction *ActionCancelAllNotifications;

	void __fastcall NotificationCPermissionRequestResult(TObject *Sender, const bool AIsGranted);
	void __fastcall NotificationCReceiveLocalNotification(TObject *Sender, TNotification *ANotification);
	void __fastcall ActionSendScheduledNotificationExecute(TObject *Sender);
	void __fastcall ActionSendNotificationImmediatelyExecute(TObject *Sender);
	void __fastcall ActionCancelScheduledExecute(TObject *Sender);
	void __fastcall ActionCancelAllNotificationsExecute(TObject *Sender);
	void __fastcall ActionListExecute(TBasicAction *Action, bool &Handled);
private:	// User declarations
	TBasicAction *PendingAction;
public:		// User declarations
	__fastcall TNotificationsForm(TComponent *Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TNotificationsForm *NotificationsForm;
//---------------------------------------------------------------------------
#endif
