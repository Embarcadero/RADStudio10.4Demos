program ForegroundLocationTrackingService;

uses
  System.Android.ServiceApplication,
  ServiceUnit in 'ServiceUnit.pas' {LocationTrackingServiceModule: TAndroidService};

{$R *.res}

begin
  var ServiceModule: TLocationTrackingServiceModule;

  Application.Initialize;
  Application.CreateForm(TLocationTrackingServiceModule, ServiceModule);
  Application.Run;

end.
