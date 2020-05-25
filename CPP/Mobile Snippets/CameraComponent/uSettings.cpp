//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "uSettings.h"
#include <System.Classes.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TSettingsForm *SettingsForm;
//---------------------------------------------------------------------------
__fastcall TSettingsForm::TSettingsForm(TComponent* Owner)
	: TForm(Owner)
{
	FPicker = new TListPickerHelper();
}
//---------------------------------------------------------------------------
__fastcall TSettingsForm::~TSettingsForm()
{
	delete FPicker;
}
//---------------------------------------------------------------------------
void TSettingsForm::SetCamera(TCameraComponent *ACamera)
{
	this->FCamera = ACamera;
	UpdateResolutionTitle();
	UpdateQualityTitle();
	UpdatePriorityTitle();
	UpdateTorchMode();
	UpdateKindTitle();
}
//---------------------------------------------------------------------------
void TSettingsForm::UpdateResolutionTitle()
{
	TVideoCaptureSetting Setting = this->Camera->CaptureSetting;
	lbiResolution->ItemData->Detail = Format("%d x %d x %f", Setting.Width, Setting.Height, Setting.FrameRate);
}
//---------------------------------------------------------------------------
void TSettingsForm::UpdateQualityTitle()
{
	String title;
	switch (Camera->Quality) {
	case TVideoCaptureQuality::PhotoQuality:
		title = "Photo";
		return;
	case TVideoCaptureQuality::HighQuality:
		title = "High";
		return;
	case TVideoCaptureQuality::MediumQuality:
		title = "Medium";
		return;
	case TVideoCaptureQuality::LowQuality:
		title = "Low";
		return;
	case TVideoCaptureQuality::CaptureSettings:
		title = "Custom";
		return;
	}

	lbiQuality->ItemData->Detail = title;
}
//---------------------------------------------------------------------------
void TSettingsForm::UpdatePriorityTitle()
{
	String title;
	switch (Camera->CaptureSettingPriority) {
	case TVideoCaptureSettingPriority::Resolution:
		title = "Resolution";
		return;
	case TVideoCaptureSettingPriority::FrameRate:
		title = "Frame rate";
		return;
	}

	lbiPriority->ItemData->Detail = title;
}
//---------------------------------------------------------------------------
void TSettingsForm::UpdateTorchMode()
{
	String title;
	switch (Camera->TorchMode) {
	case TTorchMode::ModeOff:
		title = "Off";
		return;
	case TTorchMode::ModeOn:
		title = "On";
		return;
	case TTorchMode::ModeAuto:
		title = "Auto";
		return;
	}

	lbiTorchMode->ItemData->Detail = title;
}
//---------------------------------------------------------------------------
void TSettingsForm::UpdateKindTitle()
{
	String title;
	switch (Camera->Kind) {
	case TCameraKind::Default:
		title = "Default";
		return;
	case TCameraKind::FrontCamera:
		title = "Front";
		return;
	case TCameraKind::BackCamera:
		title = "Back";
		return;
	}

	lbiKind->ItemData->Detail = title;
}
//---------------------------------------------------------------------------
DynamicArray<String> TSettingsForm::CollectResolutionsTitles()
{
	TStringList* sl = new TStringList();
	String title;
	for (int i = 0; i < Camera->AvailableCaptureSettings.Length; i++)
	{
		TVideoCaptureSetting Setting = Camera->AvailableCaptureSettings[i];
		title = Format("%d x %d x %f", Setting.Width, Setting.Height, Setting.FrameRate);
		sl->Add(title);
	};

	return sl->ToStringArray();
}
//---------------------------------------------------------------------------
void __fastcall TSettingsForm::lbiKindClick(TObject *Sender)
{
	FPicker->SelectValueFromList({"Default", "Front", "Back"}, Integer(Camera->Kind),
		[this] (const int index)
		{
			this->Camera->Kind = TCameraKind(index);
			UpdateKindTitle();
			UpdateResolutionTitle();
		}
	);
}
//---------------------------------------------------------------------------
void __fastcall TSettingsForm::FormDestroy(TObject *Sender)
{
    delete FPicker;
}
//---------------------------------------------------------------------------
void __fastcall TSettingsForm::lbiPriorityClick(TObject *Sender)
{
	FPicker->SelectValueFromList({"Resolution", "Frame rate"}, Integer(Camera->CaptureSettingPriority),
		[this] (const int index)
		{
			this->Camera->CaptureSettingPriority = TVideoCaptureSettingPriority(index);
			UpdatePriorityTitle();
			UpdateResolutionTitle();
		}
	);
}
//---------------------------------------------------------------------------

void __fastcall TSettingsForm::lbiQualityClick(TObject *Sender)
{
	FPicker->SelectValueFromList({"Photo", "High", "Medium", "Low", "Custom"}, Integer(Camera->Quality),
		[this] (const int index)
		{
			this->Camera->Quality = TVideoCaptureQuality(index);
			UpdateQualityTitle();
			UpdateResolutionTitle();
		}
	);
}
//---------------------------------------------------------------------------

void __fastcall TSettingsForm::lbiTorchModeClick(TObject *Sender)
{
	FPicker->SelectValueFromList({"Off", "On", "Auto"}, Integer(Camera->TorchMode),
	   [this] (const int index)
		{
			this->Camera->TorchMode = TTorchMode(index);
			UpdateTorchMode();
		}
	);
}
//---------------------------------------------------------------------------
void __fastcall TSettingsForm::lbiResolutionClick(TObject *Sender)
{
	FPicker->SelectValueFromList(CollectResolutionsTitles(), -1,
	   [this] (const int index)
		{
			this->Camera->CaptureSetting = this->Camera->AvailableCaptureSettings[index];
			this->Camera->Quality = TVideoCaptureQuality::CaptureSettings;
			UpdateResolutionTitle();
			UpdateQualityTitle();
		}
	);
}
//---------------------------------------------------------------------------
void TListPickerHelper::SelectValueFromList(const DynamicArray<String> AItems, const int ASelectedIndex, _di_TItemSelectedCallback ASelectedCallback)
{
	Items = AItems;
	ItemSelectedCallback = ASelectedCallback;
	ItemIndex = ASelectedIndex;
	Show();
}
//---------------------------------------------------------------------------
void __fastcall TListPickerHelper::ValueChangedHandler(TObject *Sender, int AValueIndex)
{
	if (FCallback != NULL) {
		FCallback->Invoke(AValueIndex);
	}
}
//---------------------------------------------------------------------------
void TListPickerHelper::Show()
{
	FPicker->Show();
}
//---------------------------------------------------------------------------
void TListPickerHelper::SetItems(DynamicArray<String> items)
{
	FPicker->Values->Clear();
	for(int i = 0; i < items.Length; i++) {
		FPicker->Values->Add(items[i]);
	}
}
//---------------------------------------------------------------------------
void TListPickerHelper::SetItemIndex(int itemIndex)
{
	this->FPicker->ItemIndex = itemIndex;
}
//---------------------------------------------------------------------------
TListPickerHelper::TListPickerHelper()
{
	IFMXPickerService *Factory;
	// Add platform service to see camera state. This is nedded to enable or disable the camera when the application
	// goes to background.
	if (TPlatformServices::Current->SupportsPlatformService(__uuidof(IFMXPickerService), &Factory)) {
		FPicker = Factory->CreateListPicker();
		FPicker->OnValueChanged = this->ValueChangedHandler;
	}
}
//---------------------------------------------------------------------------
TListPickerHelper::~TListPickerHelper()
{
	delete this->FPicker;
}
