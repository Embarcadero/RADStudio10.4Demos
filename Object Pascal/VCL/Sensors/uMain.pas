//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Sensors,
  System.Sensors.Components, Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lsLocation: TLocationSensor;
    msAccelerometr: TMotionSensor;
    osCompass: TOrientationSensor;
    osInclinometer: TOrientationSensor;
    tOrientation: TTimer;
    lCompass: TLabel;
    lInclinometr: TLabel;
    Button1: TButton;
    GroupBox4: TGroupBox;
    Panel1: TPanel;
    bSwitch: TButton;
    lCoordinates: TLabel;
    lAddress: TLabel;
    lGeoCoordinates: TLabel;
    tMotion: TTimer;
    lAccel: TLabel;
    procedure osCompassSensorChoosing(Sender: TObject;
      const Sensors: TSensorArray; var ChoseSensorIndex: Integer);
    procedure osInclinometerSensorChoosing(Sender: TObject;
      const Sensors: TSensorArray; var ChoseSensorIndex: Integer);
    procedure tOrientationTimer(Sender: TObject);
    procedure bSwitchClick(Sender: TObject);
    procedure lsLocationLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure msAccelerometrSensorChoosing(Sender: TObject;
      const Sensors: TSensorArray; var ChoseSensorIndex: Integer);
    procedure tMotionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FGeocoder : TGeocoder;
    procedure OnGeocodeReverseEvent(const Address: TCivicAddress);
    procedure OnGeocodeEvent(const Coords: TArray<TLocationCoord2D>);
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.bSwitchClick(Sender: TObject);
begin
  if bSwitch.Caption = 'Turn On' then
  begin
    bSwitch.Caption := 'Turn off';
    lsLocation.Active := True;
    msAccelerometr.Active := True;
    osCompass.Active := True;
    osInclinometer.Active := True;
  end
  else
  begin
    bSwitch.Caption := 'Turn On';
    lsLocation.Active := False;
    msAccelerometr.Active := False;
    osCompass.Active := False;
    osInclinometer.Active := False;
  end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  FGeocoder := TGeocoder.Current.Create;
  FGeocoder.OnGeocodeReverse := OnGeocodeReverseEvent;
  FGeocoder.OnGeocode := OnGeocodeEvent;
end;

procedure TForm5.lsLocationLocationChanged(Sender: TObject; const OldLocation,
  NewLocation: TLocationCoord2D);
begin
  lCoordinates.Caption := Format('Latitude : %2.7f; Longitude : %2.7f', [NewLocation.Latitude, NewLocation.Longitude]);
  if FGeocoder <> nil then
  begin
    lAddress.Caption := 'Start geocoding';
    if FGeocoder.Supported then
      FGeocoder.GeocodeReverse(NewLocation)
    else
      lAddress.Caption := 'Geocoding not supporting';
  end
  else
    lAddress.Caption := 'Geocoder not found';
end;

procedure TForm5.msAccelerometrSensorChoosing(Sender: TObject;
  const Sensors: TSensorArray; var ChoseSensorIndex: Integer);
var
  I : integer;
begin
  for I := 0 to Length(Sensors) - 1 do
    if (Sensors[I] as TCustomMotionSensor).SensorType = TMotionSensorType.Accelerometer3D then
    begin
      ChoseSensorIndex := I;
      Break;
    end;
end;

procedure TForm5.OnGeocodeEvent(const Coords: TArray<TLocationCoord2D>);
begin
  if Length(Coords) > 0 then
    lGeoCoordinates.Caption := Format('After geocoding address. Lat : %2.7f, Long : %2.7f',[Coords[0].Latitude, Coords[0].Longitude]);
end;

procedure TForm5.OnGeocodeReverseEvent(const Address: TCivicAddress);
begin
  if Address <> nil then
  begin
    lAddress.Caption := 'After geocoding coords:' + Address.ToString;
    if FGeocoder <> nil then
      FGeocoder.Geocode(Address);
  end
  else
    lAddress.Caption := 'not found';
end;

procedure TForm5.osCompassSensorChoosing(Sender: TObject;
  const Sensors: TSensorArray; var ChoseSensorIndex: Integer);
var
  I : integer;
begin
  for I := 0 to Length(Sensors) - 1 do
    if (Sensors[I] as TCustomOrientationSensor).SensorType = TOrientationSensorType.Compass3D then
    begin
      ChoseSensorIndex := I;
      Break;
    end;
end;

procedure TForm5.osInclinometerSensorChoosing(Sender: TObject;
  const Sensors: TSensorArray; var ChoseSensorIndex: Integer);
var
  I : integer;
begin
  for I := 0 to Length(Sensors) - 1 do
    if (Sensors[I] as TCustomOrientationSensor).SensorType = TOrientationSensorType.Inclinometer3D then
    begin
      ChoseSensorIndex := I;
      Break;
    end;
end;

procedure TForm5.tMotionTimer(Sender: TObject);
begin
  if msAccelerometr.Sensor <> nil then
    lAccel.Caption := Format('AccelX : %-1.5f'#13#10'AccelY : %-1.5f'#13#10'AccelZ : %-1.5f',
      [msAccelerometr.Sensor.AccelerationX, msAccelerometr.Sensor.AccelerationY, msAccelerometr.Sensor.AccelerationZ] )
  else
    lAccel.Caption := '';
end;

procedure TForm5.tOrientationTimer(Sender: TObject);
begin
  if osCompass.Sensor <> nil then
    lCompass.Caption := Format('Heading : %3.1f',[osCompass.Sensor.CompMagHeading])
  else
    lCompass.Caption := '';
  if osInclinometer.Sensor <> nil then
    lInclinometr.Caption := Format('TiltX : %-3.5f '#13#10'TiltY : %-3.5f '#13#10'TiltZ : %-3.5f ',
      [osInclinometer.Sensor.TiltX, osInclinometer.Sensor.TiltY, osInclinometer.Sensor.TiltZ])
  else
    lInclinometr.Caption := '';
end;

end.
