unit ApplicationUnit;

interface

uses
  System.Android.Service, System.Classes, System.Messaging, System.Permissions, System.Sensors,
  FMX.Controls, FMX.Controls.Presentation, FMX.Forms, FMX.Platform, FMX.StdCtrls, FMX.Types,
  ServiceUnit;

type
  TLocationTrackingForm = class(TForm)
    ToolBarHeader: TToolBar;
    LabelHeader: TLabel;
    ButtonStopLocationTracking: TButton;
    ButtonStartLocationTracking: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonStartLocationTrackingClick(Sender: TObject);
    procedure ButtonStopLocationTrackingClick(Sender: TObject);
  private const
    LocationPermission = 'android.permission.ACCESS_FINE_LOCATION';
  private
    ServiceConnection: TLocalServiceConnection;
    Service: TLocationTrackingServiceModule;

    procedure ServiceConnected(const LocalService: TAndroidBaseService);
    procedure ServiceDisconnected;
    function HandleApplicationEvent(ApplicationEvent: TApplicationEvent; Context: TObject): Boolean;
    procedure StartLocationTracking;
    procedure StopLocationTracking;
    procedure ServiceLocationUpdated(const NewLocation: TLocationCoord2D);
  end;

var
  Form: TLocationTrackingForm;

implementation

{$R *.fmx}

uses
  System.SysUtils, System.UITypes,
  Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Widget,
  FMX.DialogService;

procedure TLocationTrackingForm.FormCreate(Sender: TObject);
begin
  ServiceConnection := TLocalServiceConnection.Create;
  ServiceConnection.OnConnected := ServiceConnected;
  ServiceConnection.OnDisconnected := ServiceDisconnected;

  var ApplicationEventService: IFMXApplicationEventService;

  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, ApplicationEventService) then
    ApplicationEventService.SetApplicationEventHandler(HandleApplicationEvent);
end;

procedure TLocationTrackingForm.FormDestroy(Sender: TObject);
begin
  ServiceConnection.Free;
end;

procedure TLocationTrackingForm.ButtonStartLocationTrackingClick(Sender: TObject);
begin
  // Tracking the user's location requires the 'ACCESS_FINE_LOCATION' dangerous permission to be granted at runtime.
  if TPermissionsService.DefaultService.IsPermissionGranted(LocationPermission) then
    StartLocationTracking
  else
    TPermissionsService.DefaultService.RequestPermissions([LocationPermission],
      procedure(const Permissions: TArray<string>; const GrantResults: TArray<TPermissionStatus>)
      begin
        if (Length(GrantResults) = 1) and (GrantResults[0] = TPermissionStatus.Granted) then
          StartLocationTracking;
      end,
      procedure(const Permissions: TArray<string>; const PostRationaleProc: TProc)
      begin
        TDialogService.ShowMessage('Location permission is needed for tracking the user''s location',
          procedure(const &Result: TModalResult)
          begin
            PostRationaleProc;
          end);
      end);
end;

procedure TLocationTrackingForm.ButtonStopLocationTrackingClick(Sender: TObject);
begin
  StopLocationTracking;
end;

procedure TLocationTrackingForm.ServiceConnected(const LocalService: TAndroidBaseService);
begin
  // Called when the connection between the native activity and the service has been established. It is used to obtain the
  // binder object that allows the direct interaction between the native activity and the service.
  Service := TLocationTrackingServiceModule(LocalService);
  Service.LocationUpdated := ServiceLocationUpdated;
end;

procedure TLocationTrackingForm.ServiceDisconnected;
begin
  // Called when the connection between the native activity and the service has been unexpectedly lost (e.g. when the user
  // manually stops the service using the 'Settings' application).
  Service := nil;
end;

function TLocationTrackingForm.HandleApplicationEvent(ApplicationEvent: TApplicationEvent; Context: TObject): Boolean;
begin
  // It is important to note that a FireMonkey application for Android generally consists of a single activity, which is the
  // native activity mentioned in this demo application. When the native activity starts to be visible (goes to the foreground
  // state), it binds to the service, and when the native activity stops to be visible (goes to the background state), it
  // unbinds from the service. This is needed to allow the service to be aware of the native activity's lifecycle changes.
  // The 'WillBecomeForeground' and 'EnteredBackground' enum cases are equivalent to the 'onStart' and 'onStop' activity callbacks.
  case ApplicationEvent of
    TApplicationEvent.WillBecomeForeground:
    begin
      // Binding the native activity to the service turns the service into a bound service and, therefore, allows the native
      // activity to directly interact with it using the binder object passed as parameter in the 'ServiceConnected' procedure.
      ServiceConnection.BindService(TLocationTrackingServiceModule.ServiceClassName);

      Result := True;
    end;
    TApplicationEvent.EnteredBackground:
    begin
      if Service <> nil then
      begin
        // Unbinding the native activity from the service ensures that the native activity is no longer a bound client and the
        // service can be destroyed by the system if there is no other bound client. The native activity is the only bound client
        // used in this demo application. If the service is also a started service, the system will destroy the service only after
        // a call to the 'stopSelf' procedure.
        ServiceConnection.UnbindService;

        Service := nil;
      end;

      Result := True;
    end;
  else
    Result := False;
  end
end;

procedure TLocationTrackingForm.StartLocationTracking;
begin
  if Service <> nil then
    Service.StartLocationTracking;
end;

procedure TLocationTrackingForm.StopLocationTracking;
begin
  if Service <> nil then
    Service.StopLocationTracking;
end;

procedure TLocationTrackingForm.ServiceLocationUpdated(const NewLocation: TLocationCoord2D);
begin
  var Text := string.Format('(%f, %f)', [NewLocation.Latitude, NewLocation.Longitude]);

  // When the native activity is visible, location updates are presented to the user in toast messages of short duration.
  TJToast.JavaClass.makeText(TAndroidHelper.Context, StrToJCharSequence(Text), TJToast.JavaClass.LENGTH_SHORT).show;
end;

end.
