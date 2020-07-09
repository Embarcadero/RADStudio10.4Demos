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
unit uMain;

interface

uses
  System.Actions, System.Classes, System.Notification,
  FMX.ActnList, FMX.Controls, FMX.Controls.Presentation, FMX.Forms, FMX.Memo, 
  FMX.Memo.Types, FMX.ScrollBox, FMX.StdCtrls, FMX.Types;

type
  TNotificationsForm = class(TForm)
    btnSendScheduledNotification: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    btnSendNotificationImmediately: TButton;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    NotificationC: TNotificationCenter;
    Memo1: TMemo;
    ActionList: TActionList;
    ActionSendScheduledNotification: TAction;
    ActionSendNotificationImmediately: TAction;
    ActionCancelScheduled: TAction;
    ActionCancelAllNotifications: TAction;

    procedure NotificationCPermissionRequestResult(Sender: TObject; const AIsGranted: Boolean);
    procedure NotificationCReceiveLocalNotification(Sender: TObject; ANotification: TNotification);
    procedure ActionListExecute(Action: TBasicAction; var Handled: Boolean);
    procedure ActionSendScheduledNotificationExecute(Sender: TObject);
    procedure ActionSendNotificationImmediatelyExecute(Sender: TObject);
    procedure ActionCancelScheduledExecute(Sender: TObject);
    procedure ActionCancelAllNotificationsExecute(Sender: TObject);
  private
    FPendingAction: TBasicAction;
  end;

var
  NotificationsForm: TNotificationsForm;

implementation

{$R *.fmx}

uses
  System.SysUtils;
  
procedure TNotificationsForm.NotificationCPermissionRequestResult(Sender: TObject; const AIsGranted: Boolean);
begin
  if AIsGranted and (FPendingAction <> nil) then
  begin
    FPendingAction.Execute;
  end;

  FPendingAction := nil;
end;

procedure TNotificationsForm.NotificationCReceiveLocalNotification(Sender: TObject; ANotification: TNotification);
begin
  Memo1.Lines.Add(ANotification.AlertBody);
end;

procedure TNotificationsForm.ActionListExecute(Action: TBasicAction; var Handled: Boolean);
begin
  if NotificationC.AuthorizationStatus <> TAuthorizationStatus.Authorized then
  begin
    Handled := True;
    FPendingAction := Action;

    NotificationC.RequestPermission;
  end;
end;

procedure TNotificationsForm.ActionSendScheduledNotificationExecute(Sender: TObject);
begin
  var Notification := NotificationC.CreateNotification;
  try
    Notification.Name := 'MyNotification';
    Notification.AlertBody := 'Delphi for Mobile is here!';
    { Fired in 10 second }
    Notification.FireDate := Now + EncodeTime(0, 0, 10, 0);

    { Send notification in Notification Center }
    NotificationC.ScheduleNotification(Notification);
  finally
    Notification.Free;
  end;
end;

procedure TNotificationsForm.ActionSendNotificationImmediatelyExecute(Sender: TObject);
begin
  var Notification := NotificationC.CreateNotification;
  try
    Notification.AlertBody := 'Delphi for Mobile is here!';
    Notification.FireDate := Now;

    { Send notification in Notification Center }
    NotificationC.PresentNotification(Notification);
  finally
    Notification.Free;
  end;
end;

procedure TNotificationsForm.ActionCancelScheduledExecute(Sender: TObject);
begin
  { Providing the fact that you already have a MyNotification previously issued }
  NotificationC.CancelNotification('MyNotification');
end;

procedure TNotificationsForm.ActionCancelAllNotificationsExecute(Sender: TObject);
begin
  NotificationC.CancelAll;
end;

end.
