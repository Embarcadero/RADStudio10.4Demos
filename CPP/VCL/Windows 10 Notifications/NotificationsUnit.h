//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef NotificationsUnitH
#define NotificationsUnitH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <System.Notification.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TMemo *mmLog;
	TButton *btnShow;
	TButton *btnCancel;
	TButton *btnCancelAll;
	TButton *btnShowAnother;
	TButton *btnCancelAnother;
	TNotificationCenter *NotificationCenter1;
	void __fastcall btnShowClick(TObject *Sender);
	void __fastcall btnShowAnotherClick(TObject *Sender);
	void __fastcall btnCancelClick(TObject *Sender);
	void __fastcall btnCancelAnotherClick(TObject *Sender);
	void __fastcall btnCancelAllClick(TObject *Sender);
	void __fastcall NotificationCenter1ReceiveLocalNotification(TObject *Sender, TNotification *ANotification);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
