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
unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Bluetooth, System.Bluetooth.Components, FMX.StdCtrls,
  FMX.Controls.Presentation,  System.Generics.Collections, FMX.Layouts,
  FMX.ListBox, System.Math;

const
  DISCOVERY_TIMEOUT = 20000;
  LOCATION_PERMISSION = 'android.permission.ACCESS_FINE_LOCATION';
  BEACON_TYPE_POSITION = 2;
  BEACON_GUID_POSITION = 4;
  BEACON_MAJOR_POSITION = 20;
  BEACON_MINOR_POSITION = 22;
  MARK_POSITION = 9;
  UUID_LENGTH = 16;
  BEACON_ST_TYPE: Word = $0215;

type
  TBeaconDevice = record
    Device: TBluetoothLEDevice;
    GUID: TGUID;
    Major: Word;
    Minor: Word;
    TxPower: Integer;
    Rssi: Integer;
    Distance: Double;
    Alt: Boolean;
  end;

  TBeaconDeviceList = TList<TBeaconDevice>;

  TForm4 = class(TForm)
  private
    FManager: TBluetoothLEManager;
    FBeaconDeviceList: TBeaconDeviceList;

    procedure DiscoverLEDevice(const Sender: TObject; const ADevice: TBluetoothLEDevice; Rssi: Integer; const ScanResponse: TScanResponse);
  published
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses
  System.Permissions,
  FMX.DialogService;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FManager := TBluetoothLEManager.Current;
  FManager.OnDiscoverLeDevice := DiscoverLEDevice;

  FBeaconDeviceList := TBeaconDeviceList.Create;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  FBeaconDeviceList.Clear;

  if PermissionsService.DefaultService.IsPermissionGranted(LOCATION_PERMISSION) then
    FManager.StartDiscovery(DISCOVERY_TIMEOUT)
  else
    PermissionsService.DefaultService.RequestPermissions([LOCATION_PERMISSION],
      procedure(const Permissions: TArray<string>; const GrantResults: TArray<TPermissionStatus>)
      begin
        if (Length(GrantResults) = 1) and (GrantResults[0] = TPermissionStatus.Granted) then
          FManager.StartDiscovery(DISCOVERY_TIMEOUT);
      end,
      procedure(const Permissions: TArray<string>; const PostRationaleProc: TProc)
      begin
        TDialogService.ShowMessage('Please grant the location permission in order to be discover nearby Bluetooth devices',
          procedure(const AResult: TModalResult)
          begin
            PostRationaleProc;
          end);
      end);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  FManager.CancelDiscovery;
end;

procedure TForm4.DiscoverLEDevice(const Sender: TObject; const ADevice: TBluetoothLEDevice; Rssi: Integer; const ScanResponse: TScanResponse);

  function DecodeScanResponse: TBeaconDevice;
  begin
    Result.GUID := TGUID.Create(ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData], BEACON_GUID_POSITION, TEndian.Big);

    WordRec(Result.Major).Hi := ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData][BEACON_MAJOR_POSITION];
    WordRec(Result.Major).Lo := ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData][BEACON_MAJOR_POSITION + 1];
    WordRec(Result.Minor).Hi := ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData][BEACON_MINOR_POSITION];
    WordRec(Result.Minor).Lo := ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData][BEACON_MINOR_POSITION + 1];

    if (ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData][BEACON_TYPE_POSITION] = WordRec(BEACON_ST_TYPE).Hi) then //iBeacon
    begin
      Result.TxPower := ShortInt(ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData]
                          [length(ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData]) - 1]);
      Result.Alt := False;
    end
    else
    begin
      Result.TxPower := ShortInt(ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData]
                          [length(ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData]) - 2]);
      Result.Alt := True;
    end;

    Result.Rssi := Rssi;
    Result.Distance := FManager.RssiToDistance(Rssi, Result.TxPower, 0.5);
    Result.Device := ADevice;
  end;

var
  LBeaconDevice: TBeaconDevice;
  NewBeacon: Integer;
  I: Integer;
  ScanData: string;
begin
  if ScanResponse.ContainsKey(TScanResponseKey.ManufacturerSpecificData) then
  begin
    I := Length(ScanResponse.Items[TScanResponseKey.ManufacturerSpecificData]);
    if I<21 then
      exit;
    LBeaconDevice := DecodeScanResponse;
    NewBeacon := 0;
    if FBeaconDeviceList.Count > 0 then
    begin
      for I := 0 to FBeaconDeviceList.count-1 do
        if ((FBeaconDeviceList[I].GUID = LBeaconDevice.GUID) and (FBeaconDeviceList[I].Major = LBeaconDevice.Major)
          and (FBeaconDeviceList[I].Minor = LBeaconDevice.Minor)) then
        begin
          FBeaconDeviceList[I] := LBeaconDevice;
          NewBeacon := I+1;
          Break;
        end;
    end;

    TThread.Synchronize(nil, procedure
    begin
      if NewBeacon = 0 then
      begin
        FBeaconDeviceList.Add(LBeaconDevice);
        ListBox1.Items.Add('-------------------------------------');
        ScanData := 'Beacon Found: ' + Adevice.DeviceName;
        if LBeaconDevice.Alt then
          ScanData := ScanData + '; AltB'
        else
          ScanData := ScanData + '; iB';
        ListBox1.Items.Add(ScanData);
        ScanData := '';
        if ScanResponse.ContainsKey(TScanResponseKey.CompleteLocalName) then
          ScanData := TEncoding.UTF8.GetString(ScanResponse.Items[TScanResponseKey.CompleteLocalName]);
        ListBox1.Items.Add('Device Complete name: ' + ScanData);
        ListBox1.Items.Add(' UUID: '+LBeaconDevice.GUID.ToString);
        ListBox1.Items.Add(' Major:'+LBeaconDevice.Major.ToString+',  Minor:'+LBeaconDevice.Minor.ToString+',  txPower: '+LBeaconDevice.TxPower.ToString());
        ListBox1.Items.Add(' Rssi: ' + LBeaconDevice.Rssi.ToString + Format(' Distance: %f m',[LBeaconDevice.Distance]));
      end
      else
      begin
        ScanData := 'Beacon Found: ' + Adevice.DeviceName;
        if LBeaconDevice.Alt then
          ScanData := ScanData + '; AltB'
        else
          ScanData := ScanData + '; iB';
        ListBox1.Items[(NewBeacon-1)*6+1] := ScanData;
        ListBox1.Items[(NewBeacon-1)*6+5] := (' Rssi: ' + LBeaconDevice.Rssi.ToString + Format(' Distance: %f m',[LBeaconDevice.Distance]));
      end;
    end);
  end;
end;

end.
