//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMain *frmMain;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
#ifndef _WIN64
void __fastcall TfrmMain::OnGeocodeEvent(const _dt_System_Sensors_1 Coords)
#else /* _WIN64 */
void __fastcall TfrmMain::OnGeocodeEvent(const System::TArray__1<TLocationCoord2D> Coords)
#endif
{
	if (Coords.Length > 0) {
		lGeoCoordinates->Caption =
			lGeoCoordinates->Caption.sprintf(L"After geocoding address. Lat : %2.7f, Long : %2.7f",
			Coords[0].Latitude, Coords[0].Longitude);
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::OnGeocodeReverseEvent(TCivicAddress* const Address)
{
	if (Address != NULL) {
		lAddress->Caption = "After geocoding coords:" + Address->ToString();
		if (FGeocoder != NULL) {
            FGeocoder->Geocode(Address);
		}
	} else {
        lAddress->Caption = "not found";
    }
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::FormCreate(TObject *Sender)
{
	FGeocoder = (TGeocoder*)new TGeocoderClass(TGeocoder::Current);
	FGeocoder->OnGeocode = &OnGeocodeEvent;
	FGeocoder->OnGeocodeReverse = &OnGeocodeReverseEvent;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::tOrientationTimer(TObject *Sender)
{
	if (osCompass->Sensor != NULL) {
		lCompass->Caption = lCompass->Caption.sprintf(L"Heading : %3.1f",
			osCompass->Sensor->CompMagHeading);
	} else {
		lCompass->Caption = "";
	}
	if (osInclinometer->Sensor != NULL) {
		lInclinometr->Caption = lInclinometr->Caption.sprintf(
			L"TiltX : %-3.5f \nTiltY : %-3.5f \nTiltZ : %-3.5f ",
			osInclinometer->Sensor->TiltX, osInclinometer->Sensor->TiltY,
			osInclinometer->Sensor->TiltZ);
	} else {
		lInclinometr->Caption = "";
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::tMotionTimer(TObject *Sender)
{
	if (msAccelerometr->Sensor != NULL) {
		lAccel->Caption = lAccel->Caption.sprintf(
			L"AccelX : %-1.5f\nAccelY : %-1.5f\nAccelZ : %-1.5f",
			msAccelerometr->Sensor->AccelerationX, msAccelerometr->Sensor->AccelerationY,
			msAccelerometr->Sensor->AccelerationZ);
	} else {
		lAccel->Caption = "";
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::osInclinometerSensorChoosing(TObject *Sender, const TSensorArray Sensors,
          int &ChoseSensorIndex)
{
	for (int i = 0; i < Sensors.Length; i++) {
		if (static_cast<TCustomOrientationSensor*>(Sensors[i])->SensorType ==
			TOrientationSensorType::Inclinometer3D) {
			ChoseSensorIndex = i;
			break;
		}
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::osCompassSensorChoosing(TObject *Sender, const TSensorArray Sensors,
          int &ChoseSensorIndex)
{
	for(int i = 0; i < Sensors.Length; i++)
	{
		if (static_cast<TCustomOrientationSensor*>(Sensors[i])->SensorType ==
			TOrientationSensorType::Compass3D) {
			ChoseSensorIndex = i;
			break;
		}
    }
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::msAccelerometrSensorChoosing(TObject *Sender, const TSensorArray Sensors,
          int &ChoseSensorIndex)
{
	for(int i = 0; i < Sensors.Length; i++) {
		if (static_cast<TCustomMotionSensor*>(Sensors[i])->SensorType ==
			TMotionSensorType::Accelerometer3D) {
			ChoseSensorIndex = i;
			break;
		}
    }
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::bSwitchClick(TObject *Sender)
{
	if (bSwitch->Caption == "Turn On") {
		bSwitch->Caption = "Turn off";
		lsLocation->Active = true;
		msAccelerometr->Active = true;
		osCompass->Active = true;
		osInclinometer->Active = true;
	} else {
		bSwitch->Caption = "Turn On";
		lsLocation->Active = false;
		msAccelerometr->Active = false;
		osCompass->Active = false;
		osInclinometer->Active = false;
	}
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::lsLocationLocationChanged(TObject *Sender, const TLocationCoord2D &OldLocation,
          const TLocationCoord2D &NewLocation)
{
	lCoordinates->Caption = lCoordinates->Caption.sprintf(
		L"Latitude : %2.7f; Longitude : %2.7f",
		NewLocation.Latitude, NewLocation.Longitude);
	if (FGeocoder != NULL) {
		lAddress->Caption = "Start geocoding";
		if (FGeocoder->Supported()) {
			FGeocoder->GeocodeReverse(NewLocation);
		} else {
			lAddress->Caption = "Geocoding not supporting";
		}
	} else {
        lAddress->Caption = "Geocoder not found";
    }

}
//---------------------------------------------------------------------------
