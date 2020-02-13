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
program NotificationService;

uses
  System.Android.ServiceApplication,
  NotificationServiceUnit in 'NotificationServiceUnit.pas' {NotificationServiceDM: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TNotificationServiceDM, NotificationServiceDM);
  Application.Run;
end.
