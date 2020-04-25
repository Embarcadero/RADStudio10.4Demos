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
#pragma hdrstop

#include "uMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
#pragma resource ("*.LgXhdpiPh.fmx", _PLAT_ANDROID)

TCameraRollForm *CameraRollForm;
//---------------------------------------------------------------------------
__fastcall TCameraRollForm::TCameraRollForm(TComponent *Owner) : TForm(Owner)
{
#ifdef __ANDROID__
	FPermissionReadExternalStorage = JStringToString(TJManifest_permission::JavaClass->READ_EXTERNAL_STORAGE);
	FPermissionWriteExternalStorage = JStringToString(TJManifest_permission::JavaClass->WRITE_EXTERNAL_STORAGE);
#endif
}
//---------------------------------------------------------------------------
void __fastcall TCameraRollForm::TakePhotoFromLibraryAction1DidFinishTaking(TBitmap *Image)
{
	// Assign the image retrieved from the Photo Library to the TImage component.
	imgPhotoLibraryImage->Bitmap->Assign(Image);
}
//---------------------------------------------------------------------------
void __fastcall TCameraRollForm::DisplayRationale(TObject *Sender, const DynamicArray<String> APermissions, const _di_TProc APostRationaleProc)
{
	String RationaleMsg;

	for (int i = 0; i < APermissions.Length; i++) {
		if (APermissions[i] == FPermissionReadExternalStorage)
			RationaleMsg = RationaleMsg + "The app needs to load photo files from your device to show it to you";
	}

	// Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
	// After the user sees the explanation, invoke the post-rationale routine to request the permissions
	TDialogService::ShowMessage(RationaleMsg,
		[APostRationaleProc](TModalResult AKey)
        {
			APostRationaleProc->Invoke();
        });
}
//---------------------------------------------------------------------------
void __fastcall TCameraRollForm::LoadPicturePermissionRequestResult(TObject *Sender, const DynamicArray<String> APermissions, const DynamicArray<TPermissionStatus> AGrantResults)
{
	// 2 permissions involved: READ_EXTERNAL_STORAGE and WRITE_EXTERNAL_STORAGE
	if ((AGrantResults.Length == 2) &&
		(AGrantResults[0] == TPermissionStatus::Granted) &&
		(AGrantResults[1] == TPermissionStatus::Granted))
		TakePhotoFromLibraryAction1->Execute();
	else
		TDialogService::ShowMessage("Cannot load the photo because the required permission is not granted");
}
//---------------------------------------------------------------------------
void __fastcall TCameraRollForm::btnPhotoLibraryClick(TObject *Sender)
{
    DynamicArray<String> permissions;
	permissions.Length = 2;
	permissions[0] = FPermissionReadExternalStorage;
	permissions[1] = FPermissionWriteExternalStorage;

	PermissionsService()->RequestPermissions(permissions, LoadPicturePermissionRequestResult, DisplayRationale);
}
//---------------------------------------------------------------------------

