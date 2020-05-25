//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uMainH
#define uMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.Permissions.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.ActnList.hpp>
#include <FMX.MediaLibrary.Actions.hpp>
#include <FMX.Objects.hpp>
#include <FMX.StdActns.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
#include <System.Actions.hpp>
#include <FMX.Controls.Presentation.hpp>
//---------------------------------------------------------------------------
class TAccessCameraAppForm : public TForm
{
__published:	// IDE-managed Components
	TImage *imgCameraImage;
	TToolBar *ToolBar1;
	TLabel *Label1;
	TButton *btnTakePhoto;
	TActionList *alGetFromCamera;
	TTakePhotoFromCameraAction *TakePhotoFromCameraAction1;
	void __fastcall TakePhotoFromCameraAction1DidFinishTaking(TBitmap *Image);
    void __fastcall btnTakePhotoClick(TObject *Sender);
private:	// User declarations
    String FPermissionCamera;
    String FPermissionReadExternalStorage;
    String FPermissionWriteExternalStorage;
    void __fastcall DisplayRationale(TObject *Sender, const DynamicArray<String> APermissions, const _di_TProc APostRationaleProc);
    void __fastcall TakePicturePermissionRequestResult(TObject *Sender, const DynamicArray<String> APermissions, const DynamicArray<TPermissionStatus> AGrantResults);
public:		// User declarations
	__fastcall TAccessCameraAppForm(TComponent *Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAccessCameraAppForm *AccessCameraAppForm;
//---------------------------------------------------------------------------
#endif
