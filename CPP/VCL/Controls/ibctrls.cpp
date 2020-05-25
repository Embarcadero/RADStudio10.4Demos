//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#included in IBREG.CPP which #includes IBREG.H which
// in turn #includes IBCTRLS.H.  Hence #including IBCTRLS.H here is redundant with
// no ramifications (there are sentries in the header file) but has been done
// just to clarify that the function and class implementations in this file are
// prototyped in IBCTRLS.H

#if !defined (REGISTER_ALL_CONTROLS)
  #include  "ibctrls.h"
#else
  #include "source\ibctrls.h"
#endif
#pragma resource "*.res"  //Contains the string resource used in this module
#pragma warn -sig
//---------------------------------------------------------------------------
// Dynamically Loaded InterBase API functions (gds32.dll)
TIscQueEvents IscQueEvents;
TIscFree IscFree;
TIscEventBlock IscEventBlock;
TIscEventCounts IscEventCounts;
TIscCancelEvents IscCancelEvents;
TIscInterprete IscInterprete;

// TIBComponent class implementation

Pointer __fastcall TIBComponent::GetNativeHandle(void)
{
  unsigned short length = 0;
  isc_db_handle result = NULL;
  if( FDatabase != NULL  && FDatabase->Connected )
      Check( DbiGetProp( (hDBIObj)FDatabase->Handle, dbNATIVEHNDL,
                        &result, sizeof( isc_db_handle), length ) );
  else
    result = NULL;
 return result;
 }


void __fastcall TIBComponent::HandleIBErrors(Ibproc32::pstatus_vector status)
{
  System::Char buffer[255];
  System::String errMsg = " ";
  System::String lastMsg;
  isc_status errCode;

  do
  {
	errCode = IscInterprete( buffer, &status);
	if( lastMsg != System::String( buffer) )
	{
	  lastMsg = System::String( buffer);
	  if( errMsg.Length() !=  0 )
		errMsg = errMsg+"\n";
	  errMsg = errMsg+lastMsg;
	}
  } while( errCode != 0 );
  throw EIBError( errMsg );
}




bool __fastcall TIBComponent::IsInterbaseDatabase(TDatabase *Database)
{
  bool Result;
  unsigned short Length=0;
  char Buffer[63];

  Result = false;
  if( Database->Handle != NULL )
  {
    Check(DbiGetProp(hDBIObj(Database->Handle), dbDATABASETYPE, Buffer,
      sizeof(Buffer), Length));
    Result = ( stricmp(Buffer, "INTRBASE" ) == 0 );
  }
  return Result;
}





void __fastcall TIBComponent::SetDatabase(TDatabase *value)
{
  if( value != FDatabase )
  {
    if( value != NULL && value->Connected )
        ValidateDatabase( value );
    FDatabase = value;
  }
}




void __fastcall TIBComponent::ValidateDatabase(TDatabase *Database)
{
  if( Database == NULL  || !Database->Connected  )
          throw EIBError( SInvalidDBConnection );
  else
  {
   if( !IsInterbaseDatabase( Database)  )
    throw EIBError( SInvalidDatabase, new TVarRec( Database->Name ), 1 );
  }
}



__stdcall HandleEvent( int param )
{
  // don't let exceptions propogate out of thread
  try
  {
    ((TIBEventAlerter*)param)->HandleEvent();
  }
  //except
  catch(...)
  {
    Application->HandleException( NULL );
  }
  return 0;
}



#pragma warn -rvl
__cdecl IBEventCallback(Pointer ptr, short length, PChar updated)
{
  DWORD ThreadID=0;
  // Handle events asynchronously in second thread
  EnterCriticalSection(&((TIBEventAlerter*)ptr)->CS);
  ((TIBEventAlerter*)ptr)->UpdateResultBuffer(length, updated);
  if (((TIBEventAlerter*)ptr)->FQueued)
    CloseHandle( CreateThread( (LPSECURITY_ATTRIBUTES)NULL, (DWORD)8192,
                               (LPTHREAD_START_ROUTINE)HandleEvent,
                               ptr, 0, &ThreadID) );
  LeaveCriticalSection(&((TIBEventAlerter*)ptr)->CS);
 }
#pragma warn .rvl





__fastcall TIBEventAlerter::TIBEventAlerter( TComponent* AOwner ):TIBComponent( AOwner )
{
  InitializeCriticalSection(&CS);
  FEvents = new TStringList; //.Create;
  ((TStringList*)FEvents)->OnChange = EventChange;
  ((TStringList*)FEvents)->Duplicates = dupIgnore;

  // Attempt to load GDS32.DLL.  If this fails then raise an exception.
  // This will cause the component not to be created
  LibHandle = (int) LoadLibrary("gds32.dll");
  if( LibHandle < 32 ) //then
      throw( EDLLLoadError("You must have Interbase installed to use this component") );
//      throw( EDLLLoadError("Unable to load gds32.dll") );
  IscQueEvents = (TIscQueEvents)GetProcAddress((HINSTANCE)LibHandle, "isc_que_events");
  if( IscQueEvents == NULL ) // then            // !!must initialize to NULL?
      throw( EDLLLoadError("Failed to lookup isc_que_events") );
  IscInterprete = (TIscInterprete)GetProcAddress((HINSTANCE)LibHandle, "isc_interprete");
  if( IscInterprete == NULL ) // nil then
      throw EDLLLoadError("Failed to lookup isc_interprete");

  IscFree = (TIscFree)GetProcAddress((HINSTANCE)LibHandle, "isc_free");
  if( IscFree ==  NULL ) //nil then
    throw EDLLLoadError("Failed to lookup isc_free");

  IscEventBlock = (TIscEventBlock) GetProcAddress((HINSTANCE)LibHandle, "isc_event_block");
  if( IscEventBlock == NULL ) // nil then
     throw EDLLLoadError("Failed to lookup isc_event_block");

  IscEventCounts = (TIscEventCounts )GetProcAddress((HINSTANCE)LibHandle, "isc_event_counts");
  if( IscEventCounts == NULL ) // nil then
     throw EDLLLoadError("Failed to lookup isc_event_counts");

  IscCancelEvents = (TIscCancelEvents) GetProcAddress((HINSTANCE)LibHandle, "isc_cancel_events");
  if( IscCancelEvents == NULL ) // nil then
      throw EDLLLoadError("Failed to lookup isc_cancel_events");
  }


__fastcall TIBEventAlerter::~TIBEventAlerter(void)
{
  UnRegisterEvents();
  SetDatabase(NULL);
  ((TStringList*)FEvents)->OnChange = NULL;
  delete FEvents;
  DeleteCriticalSection( &CS);
  if( LibHandle >= 32 )
    FreeLibrary((HINSTANCE)LibHandle);
}


void __fastcall TIBEventAlerter::CancelEvents(void)
{
  status_vector status;
  isc_status errCode;
  isc_db_handle dbHandle;

  if( ProcessingEvents )
      throw EIBError(SInvalidCancellation);
  if( FQueued )
  {
    try
    {
      // wait for event handler to finish before cancelling events
      EnterCriticalSection(&CS);
      ValidateDatabase( Database);
      FQueued = false;
      Changing = true;
      dbHandle = GetNativeHandle();
      errCode = IscCancelEvents( &status, &dbHandle, &EventID);
      if( errCode != 0 )
         HandleIBErrors( &status );
      LeaveCriticalSection(&CS);
    }
    catch( ... ){
      LeaveCriticalSection(&CS);
      throw;
    } //   !!end finally
  } // end Fqued
}

void __fastcall TIBEventAlerter::DoQueueEvents(void)
{
  status_vector status;
  isc_status errCode;
  Pointer callback;
  isc_db_handle dbHandle;

  ValidateDatabase( Database);
  callback = IBEventCallback;
  dbHandle = GetNativeHandle();
  errCode = IscQueEvents( &status, &dbHandle, &EventID, EventBufferLen,
                          EventBuffer, isc_callback(callback), this);
  if( errCode != 0 )
    HandleIBErrors( &status);
  FQueued = true;
 }


#pragma argsused
void __fastcall TIBEventAlerter::EventChange(System::TObject *sender)
{
 // check for blank event
 if( ((TStringList*)Events)->IndexOf(" ") !=  -1 )
     throw EIBError( SInvalidEvent);
  // check for too many events
 if( Events->Count > MaxEvents ) //then
 {
    ((TStringList*)Events)->OnChange = NULL;
    Events->Delete( MaxEvents);
    ((TStringList*)Events)->OnChange = EventChange;
    throw EIBError(SMaximumEvents);
 }
 if( Registered )
     RegisterEvents();
}



void __fastcall TIBEventAlerter::HandleEvent(void)
{
  bool CancelAlerts;
  int i;
  status_vector status;
  try
  {
    // prevent modification of vital data structures while handling events
    EnterCriticalSection(&CS);
    ProcessingEvents = true;
    IscEventCounts( &status, EventBufferLen, EventBuffer, ResultBuffer);
    CancelAlerts = false;
    if( FOnEventAlert != NULL && !Changing )
    {
       for( i = 0; i < Events->Count; i++ ) // do
       {
         try
         {
           if(status[i] != 0 && !CancelAlerts ) //then
             FOnEventAlert( this,
                            Events->Strings[Events->Count-i-1],
                            status[i],
                            CancelAlerts);
         }
         catch(...) //except
         {
           Application->HandleException( NULL);
         }
       }
    }
    Changing = false;
    if( !CancelAlerts && FQueued ) //then
        DoQueueEvents();
    ProcessingEvents = false;
    LeaveCriticalSection(&CS);
  } //  end try
  catch(...)
  {
    ProcessingEvents = false;
    LeaveCriticalSection(&CS);
    throw;
  }  //  end finally?
}



void __fastcall TIBEventAlerter::Loaded(void)
{
  TIBComponent::Loaded();
  try
  {
   if( RegisteredState ) //then
     RegisterEvents();
   }
  catch(...)//  except
  {
    if( ComponentState.Contains( csDesigning ) )
      Application->HandleException( this );
    else
      throw;
  }
}


void __fastcall TIBEventAlerter::Notification(Classes::TComponent *AComponent, Classes::TOperation Operation )
{
  TIBComponent::Notification( AComponent, Operation);
  if( Operation == opRemove && AComponent == Database)// then
  {
    UnRegisterEvents();
    Database = NULL;
  }
}



void __fastcall TIBEventAlerter::QueueEvents(void)
{
  if( !FRegistered ) //then
    throw EIBError( SNoEventsRegistered);
  if( ProcessingEvents ) //then
    throw EIBError( SInvalidQueueing);
  if( !FQueued ) //then
  {
    try
      // wait until current event handler is finished before queuing events
    {
      EnterCriticalSection( &CS);
      DoQueueEvents();
      Changing = true;
      LeaveCriticalSection( &CS);
    }
    catch(...)
    {
      LeaveCriticalSection( &CS);
      throw;
    }
  }
}



void __fastcall TIBEventAlerter::RegisterEvents(void)
{
  ValidateDatabase( Database);
  if( ComponentState.Contains( csDesigning )  )
    FRegistered = true;
  else
  {
    UnRegisterEvents();
    if( Events->Count == 0 )
       return;
    for(int i = 0; i < Events->Count; i++ )
      strcpy( Buffer[i], Events->Strings[i].c_str());


/*

 Although it would be easy to call IscEventBlock() only once from assembly
 with the variable number of parameters, we opted to do this entire function
 in C, so that it would not require assembler (TASM32).

*/

    switch (Events->Count)
    {
      case 1:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[0]);
        break;

      case 2:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 3:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 4:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 5:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 6:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 7:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 8:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[7],
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 9:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[8],
                                       Buffer[7],
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 10:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[9],
                                       Buffer[8],
                                       Buffer[7],
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 11:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[10],
                                       Buffer[9],
                                       Buffer[8],
                                       Buffer[7],
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 12:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[11],
                                       Buffer[10],
                                       Buffer[9],
                                       Buffer[8],
                                       Buffer[7],
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 13:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[12],
                                       Buffer[11],
                                       Buffer[10],
                                       Buffer[9],
                                       Buffer[8],
                                       Buffer[7],
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 14:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[13],
                                       Buffer[12],
                                       Buffer[11],
                                       Buffer[10],
                                       Buffer[9],
                                       Buffer[8],
                                       Buffer[7],
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

      case 15:
        EventBufferLen = IscEventBlock(&EventBuffer,
                                       &ResultBuffer,
                                       Events->Count,
                                       Buffer[14],
                                       Buffer[13],
                                       Buffer[12],
                                       Buffer[11],
                                       Buffer[10],
                                       Buffer[9],
                                       Buffer[8],
                                       Buffer[7],
                                       Buffer[6],
                                       Buffer[5],
                                       Buffer[4],
                                       Buffer[3],
                                       Buffer[2],
                                       Buffer[1],
                                       Buffer[0]);
        break;

    }


    FRegistered = true;
    QueueEvents();
  }
}
#pragma warn .sig




void __fastcall TIBEventAlerter::SetEvents(Classes::TStrings *value)
{
  FEvents->Assign(value);
}


void __fastcall TIBEventAlerter::SetDatabase(TDatabase *value)
{
  if( value != Database )
  {
    UnRegisterEvents();
    if( value != NULL  && value->Connected ) //!!assigned?
       ValidateDatabase( value);
    Database = value;
  }
}



void __fastcall TIBEventAlerter::SetRegistered( bool value )
{
  if( ComponentState.Contains ( csReading  ) )
    RegisteredState = value;
  else
    if( FRegistered != value )
      if( value )
        RegisterEvents();
      else
        UnRegisterEvents();
}



void __fastcall TIBEventAlerter::UnRegisterEvents(void)
{
  if( ProcessingEvents )
     throw EIBError( SInvalidRegistration);
  if( ComponentState.Contains( csDesigning  ) )
    FRegistered = false;
  else
   if( ComponentState.Contains( csLoading  ) != true )
   {
    CancelEvents();
    if( FRegistered )
    {
      IscFree( EventBuffer);
      EventBuffer = NULL;
      IscFree( ResultBuffer);
      ResultBuffer = NULL;
    }
    FRegistered = false;
   }
}


void __fastcall TIBEventAlerter::UpdateResultBuffer(int length, System::PChar updated)
{
  int i;
  for( i = 0; i < length; i++ )
    ResultBuffer[i] = updated[i];
}



