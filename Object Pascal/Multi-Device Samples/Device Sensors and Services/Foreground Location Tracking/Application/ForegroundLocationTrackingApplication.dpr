program ForegroundLocationTrackingApplication;

uses
  System.StartUpCopy,
  FMX.Forms,
  ApplicationUnit in 'ApplicationUnit.pas' {LocationTrackingForm},
  ServiceUnit in '..\Service\ServiceUnit.pas' {LocationTrackingServiceModule: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLocationTrackingForm, Form);
  Application.Run;

end.
