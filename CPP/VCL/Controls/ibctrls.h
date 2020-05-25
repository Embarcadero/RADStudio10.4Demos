//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef IbctrlsH
#define IbctrlsH
//----------------------------------------------------------------------------
#include <Bde.hpp>
#include <DBtables.hpp>
#include <Dialogs.hpp>
#include <Forms.hpp>
#include <Controls.hpp>
#include <Graphics.hpp>
#include <Classes.hpp>
#include <Messages.hpp>
#include <Windows.hpp>
#include <SysUtils.hpp>
#include <System.hpp>
#if !defined (REGISTER_ALL_CONTROLS)
  #include  "ibproc32.h"
#else
  #include "source\ibproc32.h"
#endif

namespace Ibctrls
{
//-- type declarations -------------------------------------------------------
class TIBComponent : public Classes::TComponent
{
private:
	TDatabase *FDatabase;
	void __fastcall SetDatabase(TDatabase *value);

protected:
	void __fastcall ValidateDatabase(TDatabase *Database);
	System::Pointer __fastcall GetNativeHandle(void);
	void __fastcall HandleIBErrors(Ibproc32::pstatus_vector status);
	bool __fastcall IsInterbaseDatabase(TDatabase *Database);

__published:
	__property TDatabase * Database = {read=FDatabase, write=SetDatabase, nodefault};
public:
	__fastcall virtual TIBComponent(Classes::TComponent *AOwner) : Classes::TComponent(
		AOwner) { }
	__fastcall virtual ~TIBComponent(void) { }
};

typedef void __fastcall (__closure *TEventAlert)(System::TObject *Sender,  System::String EventName,
		  long EventCount, bool &CancelAlerts);

typedef char TEventBuffer[15][64];

class TIBEventAlerter : public TIBComponent
{
private:
public:
	int LibHandle;
	Classes::TStrings *FEvents;
	TEventAlert FOnEventAlert;
	bool FQueued;
	bool FRegistered;
	char Buffer[15][64];
	bool Changing;
	Windows::TRTLCriticalSection CS;
	System::Char *EventBuffer;
	int EventBufferLen;
	long EventID;
	int EventThreadID;
	bool ProcessingEvents;
	bool RegisteredState;
	System::Char * ResultBuffer;
	void __fastcall DoQueueEvents(void);
	void __fastcall EventChange(System::TObject *sender);
	void __fastcall UpdateResultBuffer( int length, System::PChar updated);

protected:
public:
	void __fastcall HandleEvent(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent *AComponent, Classes::TOperation Operation
		);
	void __fastcall SetEvents(Classes::TStrings *value);
	void __fastcall SetDatabase(TDatabase *value);
	void __fastcall SetRegistered(bool value);

public:
	__fastcall virtual TIBEventAlerter(Classes::TComponent *AOwner);
	__fastcall virtual ~TIBEventAlerter(void);
	void __fastcall CancelEvents(void);
	void __fastcall QueueEvents(void);
	void __fastcall RegisterEvents(void);
	void __fastcall UnRegisterEvents(void);
	__property bool Queued = {read=FQueued, nodefault};

__published:
	__property Classes::TStrings * Events = {read=FEvents, write=SetEvents, nodefault};
	__property bool Registered = {read=FRegistered, write=SetRegistered, nodefault};
	__property TEventAlert OnEventAlert = {read=FOnEventAlert, write=FOnEventAlert};
};

class EIBError : public Sysutils::Exception
{
public:
	__fastcall EIBError(const System::String Msg) : Sysutils::Exception(Msg
		) { }
	__fastcall EIBError(const System::String Msg, const TVarRec *Args,
		const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	__fastcall EIBError(int Ident) : Sysutils::Exception(Ident
		) { }
	__fastcall EIBError(int Ident, const TVarRec *Args, const
		int Args_Size) : Sysutils::Exception(Ident, Args, Args_Size) { }
	__fastcall EIBError(const System::String Msg, int AHelpContext
		) : Sysutils::Exception(Msg, AHelpContext) { }
	__fastcall EIBError(const System::String Msg, const TVarRec *Args
		, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args,
		Args_Size, AHelpContext) { }
	__fastcall EIBError( int Ident, int AHelpContext
		) : Sysutils::Exception(Ident, AHelpContext) { }
	__fastcall EIBError( int Ident, const TVarRec *Args,
		const int Args_Size, int AHelpContext) : Sysutils::Exception(Ident, Args,
		Args_Size, AHelpContext) { }

	__fastcall virtual ~EIBError(void) { }
};

//-- var, const, procedure ---------------------------------------------------
#define  MaxEvents             15
#define  EventLength           64
#define  SIBMessageBase        57800
#define  SNoEventsRegistered   SIBMessageBase + 0
#define  SInvalidDBConnection  SIBMessageBase + 1
#define  SInvalidDatabase      SIBMessageBase + 2
#define  SInvalidCancellation  SIBMessageBase + 3
#define  SInvalidEvent         SIBMessageBase + 4
#define  SInvalidQueueing      SIBMessageBase + 5
#define  SInvalidRegistration  SIBMessageBase + 6
#define  SMaximumEvents        SIBMessageBase + 7
}       /* namespace Ibctrls */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Ibctrls;
#endif
//-- end unit ----------------------------------------------------------------
#endif  // IBCtrls
