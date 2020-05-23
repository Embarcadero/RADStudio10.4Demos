//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <fmx.h>
#ifdef __ANDROID__
    #include <Androidapi.Helpers.hpp>
    #include <Androidapi.JNI.Os.hpp>
#endif
#include <FMX.DialogService.hpp>
#include <FMX.Platform.hpp>
#include <System.Messaging.hpp>
#pragma hdrstop

#include "uMain.h"
#include "uSettings.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TCameraComponentForm *CameraComponentForm;
//---------------------------------------------------------------------------
__fastcall TCameraComponentForm::TCameraComponentForm(TComponent* Owner)
	: TForm(Owner)
{
#ifdef __ANDROID__
	FPermissionCamera = JStringToString(TJManifest_permission::JavaClass->CAMERA);
#endif
	TMessageManager::DefaultManager->SubscribeToMessage(__classid(TApplicationEventMessage), ApplicationEventChangedHandler);
}
//---------------------------------------------------------------------------
__fastcall TCameraComponentForm::~TCameraComponentForm()
{
	TMessageManager::DefaultManager->Unsubscribe(__classid(TApplicationEventMessage), ApplicationEventChangedHandler);
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::ApplicationEventChangedHandler(System::TObject* const Sender, TMessageBase* const M)
{
	switch (dynamic_cast<TApplicationEventMessage*>(M)->Value.Event) {
	case TApplicationEvent::WillBecomeInactive:
		FSavedCameraActive = CameraComponent->Active;
		CameraComponent->Active = False;
		break;
	case TApplicationEvent::BecameActive:
		CameraComponent->Active = FSavedCameraActive;
		break;
	}
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::DisplayRationale(TObject* Sender, const TStringDynArray APermissions, const _di_TProc APostRationaleProc)
{
	// Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
	// After the user sees the explanation, invoke the post-rationale routine to request the permissions
	TDialogService::ShowMessage("The app needs to access the camera in order to work",
		[APostRationaleProc](TModalResult AKey)
		{
			APostRationaleProc->Invoke();
		});
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::ActivateCameraPermissionRequestResult(TObject* Sender, const System::TArray__1<String> APermissions, const System::TArray__1<TPermissionStatus> AGrantResults)
{
	// 1 permission involved: CAMERA
	if ((AGrantResults.Length == 1) && (AGrantResults[0] == TPermissionStatus::Granted)) {
		CameraComponent->Active = True;
	} else {
		ShowMessage("Cannot start the camera because the required permission has not been granted");
	}
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::DisplayCameraPreviewFrame()
{
	CameraComponent->SampleBufferToBitmap(imgCameraView->Bitmap, true);
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::CameraComponentSampleBufferReady(TObject *Sender, const TMediaTime ATime)
{
	TThread::Synchronize(TThread::CurrentThread, DisplayCameraPreviewFrame);
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::actStopExecute(TObject *Sender)
{
	CameraComponent->Active = false;
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::actStartExecute(TObject *Sender)
{
	CameraComponent->Active = true;
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::ActionListExecute(TBasicAction *Action, bool &Handled)
{
	if (!PermissionsService()->IsPermissionGranted(FPermissionCamera)) {
		Handled = true;
		PermissionsService()->RequestPermissions({FPermissionCamera}, ActivateCameraPermissionRequestResult, DisplayRationale);
	}
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::actShowSettingsExecute(TObject *Sender)
{
	bool SavedCameraActive = CameraComponent->Active;
	SettingsForm->Camera = CameraComponent;
	CameraComponent->Active = false;
	SettingsForm->ShowModal([this, SavedCameraActive] (TModalResult result) {
		CameraComponent->Active = SavedCameraActive;
	});
}
//---------------------------------------------------------------------------
void __fastcall TCameraComponentForm::ActionListUpdate(TBasicAction *Action, bool &Handled)
{
	if (CameraComponent->Active) {
		btnStartStopCamera->Action = actStop;
	} else {
		btnStartStopCamera->Action = actStart;
	}
}
//---------------------------------------------------------------------------

