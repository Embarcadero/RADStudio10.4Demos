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
#include <fmx.h>
#include <System.Permissions.hpp>
#include <System.SysUtils.hpp>
#include <FMX.DialogService.hpp>
#pragma hdrstop

#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm2::FormCreate(TObject *Sender)
{
	FManager = TBluetoothLEManager::Current;
	FManager->OnDiscoverLEDevice = DiscoverLEDevice;
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button1Click(TObject *Sender)
{
	FBeaconDeviceList.clear();

	if (PermissionsService()->DefaultService->IsPermissionGranted(LOCATION_PERMISSION)) {
		FManager->StartDiscovery(DISCOVERY_TIMEOUT);
	}
	else
	{
		PermissionsService()->DefaultService->RequestPermissions({ LOCATION_PERMISSION },
			[this](const DynamicArray<String> APermissions, const DynamicArray<TPermissionStatus> AGrantResults)
			{
				if (AGrantResults.Length == 1 && AGrantResults[0] == TPermissionStatus::Granted)
				{
					FManager->StartDiscovery(DISCOVERY_TIMEOUT);
				}
			},
			[](const DynamicArray<String> APermissions, const _di_TProc APostRationaleProc)
			{
				TDialogService::ShowMessage(L"Please grant the location permission in order to be discover nearby Bluetooth devices",
					[APostRationaleProc](const TModalResult AResult)
					{
						APostRationaleProc->Invoke();
					});
			});
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button2Click(TObject *Sender)
{
	FManager->CancelDiscovery();
}
//---------------------------------------------------------------------------
bool __fastcall MyThreadProcedure::DecodeScanResponse(TScanResponse* const ScanResponse, TBeaconDevice &BeaconDevice)
{
	TBytes value = ScanResponse->Items[TScanResponseKey::ManufacturerSpecificData];

	if (value.Length < 23)
	{
		return false;
	}

	BeaconDevice.GUID = TGUIDHelper::Create(value, BEACON_GUID_POSITION, TEndian::Big);
	BeaconDevice.Major = Word(((value[BEACON_MAJOR_POSITION] << 8) & 0xff00) | ((value[BEACON_MAJOR_POSITION + 1]) & 0x00ff));
	BeaconDevice.Minor = Word(((value[BEACON_MINOR_POSITION] << 8) & 0xff00) | ((value[BEACON_MINOR_POSITION + 1]) & 0x00ff));

	if (value[BEACON_TYPE_POSITION] == char(BEACON_ST_TYPE >> 8))
	{
		BeaconDevice.TxPower = Int8(value[value.Length - 1]);
		BeaconDevice.Alt = False;
	}
	else
	{
		BeaconDevice.TxPower = Int8(value[value.Length - 2]);
		BeaconDevice.Alt = True;
	}

	return true;
}
//---------------------------------------------------------------------------
MyThreadProcedure::MyThreadProcedure(TBluetoothLEDevice* const _ADevice, int _Rssi, TScanResponse* const _ScanResponse) :
	ADevice(_ADevice),
	Rssi(_Rssi),
	ScanResponse(_ScanResponse)
{
}
//---------------------------------------------------------------------------
void __fastcall MyThreadProcedure::Invoke(void)
{
	TBeaconDevice LBeaconDevice;
	if(!DecodeScanResponse(ScanResponse, LBeaconDevice))
		return;
	LBeaconDevice.Rssi = Rssi;
	LBeaconDevice.Distance = Form2->FManager->RssiToDistance(Rssi, LBeaconDevice.TxPower, 0.5);
	LBeaconDevice.ADevice = ADevice;
	int NewBeacon = 0;
	bool BeaconFound = False;
	if (Form2->FBeaconDeviceList.size() > 0)
	{
		for (std::list<TBeaconDevice>::iterator BD=Form2->FBeaconDeviceList.begin(); BD != Form2->FBeaconDeviceList.end(); ++BD)
		{
			NewBeacon++;
			if (IsEqualGUID(BD->GUID, LBeaconDevice.GUID) && (BD->Major == LBeaconDevice.Major) && (BD->Minor == LBeaconDevice.Minor))
			{
				*BD = LBeaconDevice;
				BeaconFound = True;
				break;
			}
		 }
	}
	TVarRec v[] = { LBeaconDevice.Distance };
	if (!BeaconFound)
	{
		Form2->FBeaconDeviceList.push_back(LBeaconDevice);
		Form2->ListBox1->Items->Add("-----------------------------");

		String BeaconName("Beacon Found: "+ ADevice->DeviceName);
		if (LBeaconDevice.Alt)
			BeaconName = BeaconName + "; AltB";
		else
			BeaconName = BeaconName + "; iB";
		Form2->ListBox1->Items->Add(BeaconName);

		BeaconName = "Device Complete name: ";
		if (ScanResponse->ContainsKey(TScanResponseKey::CompleteLocalName))
		{
			TByteDynArray value;
			ScanResponse->TryGetValue(TScanResponseKey::CompleteLocalName, value);
			BeaconName = BeaconName + (TEncoding::UTF8->GetString(value));
		}
		else
			BeaconName = BeaconName + "No Name";

		Form2->ListBox1->Items->Add(BeaconName);
		Form2->ListBox1->Items->Add(" UUID: " + GUIDToString(LBeaconDevice.GUID));
		Form2->ListBox1->Items->Add(" Major:" + IntToStr(LBeaconDevice.Major) +
									",  Minor:" + IntToStr(LBeaconDevice.Minor) +
									",  txPower: " + IntToStr(LBeaconDevice.TxPower));
		Form2->ListBox1->Items->Add(" Rssi: " +  IntToStr(LBeaconDevice.Rssi) + Format(" Distance: %f m", v, 0));
	}
	else
	{
		String BeaconName("Beacon Found: "+ ADevice->DeviceName);
		if (LBeaconDevice.Alt)
			BeaconName = BeaconName + "; AltB";
		else
			BeaconName = BeaconName + "; iB";
		Form2->ListBox1->Items->Strings[(NewBeacon-1)*6+1] = (BeaconName);
		Form2->ListBox1->Items->Strings[(NewBeacon-1)*6+5] = (" Rssi: " +  IntToStr(LBeaconDevice.Rssi) + Format(" Distance: %f m", v, 0));
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm2::DiscoverLEDevice(System::TObject* const Sender, TBluetoothLEDevice* const ADevice, int Rssi, TScanResponse* const ScanResponse)
{
	if (ScanResponse->ContainsKey(TScanResponseKey::ManufacturerSpecificData))
	{
		_di_TThreadProcedure mtp = new MyThreadProcedure(ADevice, Rssi, ScanResponse);
		System::Classes::TThread::Synchronize(NULL, mtp);
	}
}
//---------------------------------------------------------------------------
