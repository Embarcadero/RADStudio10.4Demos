unit ServiceUnit;

interface

uses
  System.Android.Service, System.Classes, System.Notification, System.Sensors, System.Sensors.Components,
  Androidapi.JNI.App, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Os;

type
  TLocationUpdated = procedure(const NewLocation: TLocationCoord2D) of object;

  TLocationTrackingServiceModule = class(TAndroidService)
    LocationSensor: TLocationSensor;
    NotificationCenter: TNotificationCenter;

    procedure AndroidServiceCreate(Sender: TObject);
    function AndroidServiceStartCommand(const Sender: TObject; const Intent: JIntent; Flags, StartId: Integer): Integer;
    function AndroidServiceBind(const Sender: TObject; const AnIntent: JIntent): JIBinder;
    procedure AndroidServiceRebind(const Sender: TObject; const AnIntent: JIntent);
    function AndroidServiceUnBind(const Sender: TObject; const AnIntent: JIntent): Boolean;
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
  private const
    NotificationId = -1;
    NotificationChannelId = 'channel_id_foreground_location_tracking';
  private
    FIsUpdatingLocation: Boolean;
    FIsRunningInForeground: Boolean;
    FNotificationManager: JNotificationManager;
    FLocation: TLocationCoord2D;
    FLocationUpdated: TLocationUpdated;

    function GetIntent(const ClassName: string): JIntent;
    function GetNotification: JNotification;
  public const
    ActivityClassName = 'com.embarcadero.firemonkey.FMXNativeActivity';
    ServiceClassName = 'com.embarcadero.services.ForegroundLocationTrackingService';
    IntentExtraStopLocationTracking = 'com.embarcadero.intent.extra.STOP_LOCATION_TRACKING';
  public
    property LocationUpdated: TLocationUpdated read FLocationUpdated write FLocationUpdated;

    procedure StartLocationTracking;
    procedure StopLocationTracking;
  end;

var
  ServiceModule: TLocationTrackingServiceModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.SysUtils,
  Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Support;

procedure TLocationTrackingServiceModule.AndroidServiceCreate(Sender: TObject);
begin
  // Creates the notification channel that is used by the ongoing notification that presents location updates to the user.
  var NotificationChannel := NotificationCenter.CreateChannel;
  NotificationChannel.Id := NotificationChannelId;
  NotificationChannel.Title := 'Foreground location tracking';
  NotificationChannel.Importance := TImportance.Default;

  NotificationCenter.CreateOrUpdateChannel(NotificationChannel);

  // The Run-Time Library does not allow all customizations needed for the ongoing notification used in this demo application.
  // For the mentioned reason, this demo application uses the native APIs for handling notifications.
  FNotificationManager := TJNotificationManager.Wrap(TAndroidHelper.Context.getSystemService(TJContext.JavaClass.NOTIFICATION_SERVICE));
end;

function TLocationTrackingServiceModule.AndroidServiceStartCommand(const Sender: TObject; const Intent: JIntent; Flags, StartId: Integer): Integer;
begin
  // Checks if the intent object contains an extra indicating that the user tapped on the 'Stop location tracking' notification action.
  if Intent.getBooleanExtra(StringToJString(IntentExtraStopLocationTracking), False) then
    StopLocationTracking;

  Result := TJService.JavaClass.START_NOT_STICKY;
end;

function TLocationTrackingServiceModule.AndroidServiceBind(const Sender: TObject; const AnIntent: JIntent): JIBinder;
begin
  // Called when the native activity starts to be visible (goes back to the foreground state) and binds to this service.
  // The native activity started to be visible and, therefore, this service is no longer needed to run in the foreground
  // to avoid being affected by the 'background location limits' introduced as part of Android 8.0.
  JavaService.stopForeground(True);

  FIsRunningInForeground := False;

  Result := GetBinder;
end;

procedure TLocationTrackingServiceModule.AndroidServiceRebind(const Sender: TObject; const AnIntent: JIntent);
begin
  // Called when the native activity starts to be visible (goes back to the foreground state) and binds once again to this service.
  JavaService.stopForeground(True);

  FIsRunningInForeground := False;
end;

function TLocationTrackingServiceModule.AndroidServiceUnBind(const Sender: TObject; const AnIntent: JIntent): Boolean;
begin
  // Called when the native activity stops to be visible (goes to the background state) and unbinds from this service.
  // The native activity stopped to be visible and, therefore, this service needs to run in the foreground, otherwise,
  // it is affected by the background location limits introduced as part of Android 8.0. Running a service in the foreground
  // requires an ongoing notification to be present to the user in order to indicate that the application is actively running.
  JavaService.startForeground(NotificationId, GetNotification);

  FIsRunningInForeground := True;
  Result := True;
end;

function TLocationTrackingServiceModule.GetIntent(const ClassName: string): JIntent;
begin
  Result := TJIntent.JavaClass.init;
  Result.setClassName(TAndroidHelper.Context.getPackageName, TAndroidHelper.StringToJString(ClassName));
end;

function TLocationTrackingServiceModule.GetNotification: JNotification;

  function GetNotificationIconId: Integer;
  begin
    // Gets the notification icon's resource id. Otherwise, fall backs to the application icon's resource id.
    Result := TAndroidHelper.Context.getResources.getIdentifier(StringToJString('drawable/ic_notification'), nil, TAndroidHelper.Context.getPackageName);

    if Result = 0 then
      Result := TAndroidHelper.Context.getApplicationInfo.icon;
  end;

  function GetActivityPendingIntent: JPendingIntent;
  begin
    // Gets the intent used to start the native activity after the user taps on the ongoing notification that presents
    // location updates to the user.
    var Intent := GetIntent(ActivityClassName);

    Result := TJPendingIntent.JavaClass.getActivity(TAndroidHelper.Context, 0, Intent, 0);
  end;

  function GetServicePendingIntent: JPendingIntent;
  begin
    // Gets the intent used to stop this service after the user taps on the 'Stop location tracking' notification action
    // from the ongoing notification that presents location updates to the user.
    var Intent := GetIntent(ServiceClassName);
    Intent.putExtra(StringToJString(IntentExtraStopLocationTracking), True);

    Result := TJPendingIntent.JavaClass.getService(TAndroidHelper.Context, 0, Intent, TJPendingIntent.JavaClass.FLAG_UPDATE_CURRENT);
  end;

begin
  var NotificationTitle: string;
  var NotificationContent: string;

  // Checks if the location sensor is actually providing location updates.
  if FIsUpdatingLocation then
  begin
    NotificationTitle := 'Current location has been updated: ' + TimeToStr(Now);
    NotificationContent := string.Format('(%f, %f)', [FLocation.Latitude, FLocation.Longitude]);
  end
  else
  begin
    NotificationTitle := 'Current location is undefined';
    NotificationContent := string.Empty;
  end;

  Result := TJNotificationCompat_Builder.JavaClass.init(TAndroidHelper.Context, StringToJString(NotificationChannelId))
    .addAction(TAndroidHelper.Context.getApplicationInfo.icon, StrToJCharSequence('Stop location tracking'), GetServicePendingIntent)
    .setPriority(TJNotification.JavaClass.PRIORITY_HIGH)
    .setOngoing(True)
    .setSmallIcon(GetNotificationIconId)
    .setContentIntent(GetActivityPendingIntent)
    .setContentTitle(StrToJCharSequence(NotificationTitle))
    .setContentText(StrToJCharSequence(NotificationContent))
    .setTicker(StrToJCharSequence(NotificationContent))
    .setWhen(TJDate.Create.getTime)
    .build;
end;

procedure TLocationTrackingServiceModule.LocationSensorLocationChanged(Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
begin
  FIsUpdatingLocation := True;
  FLocation := NewLocation;

  // If this service is running in the foreground, this service updates its ongoing notification to present the updated location.
  // If this service is running in the background, this service sends the updated location to the native activity.
  if FIsRunningInForeground then
  begin
    FNotificationManager.notify(NotificationId, GetNotification);
  end
  else
  begin
    if Assigned(FLocationUpdated) then
      FLocationUpdated(NewLocation);
  end;
end;

procedure TLocationTrackingServiceModule.StartLocationTracking;
begin
  // Starting this service turns it into a started service and, therefore, it can run in the foreground for undefined
  // time and provide real-time location updates. After calling the 'startService' procedure, this service becomes
  // a bound and started service. That beind said, this service is destroyed only after the native activity unbinds
  // from it and this service calls the 'stopSelf' procedure.
  TAndroidHelper.Context.startService(GetIntent(ServiceClassName));

  LocationSensor.Active := True;
end;

procedure TLocationTrackingServiceModule.StopLocationTracking;
begin
  LocationSensor.Active := False;

  // Stopping this service turns it into only a bound service and, therefore, it is destroyed after the native activity
  // unbinds from it.
  JavaService.stopSelf;
end;

end.
