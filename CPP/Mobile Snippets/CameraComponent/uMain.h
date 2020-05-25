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
#include <FMX.Controls.Presentation.hpp>
#include <FMX.ListBox.hpp>
#include <FMX.Media.hpp>
#include <FMX.Objects.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.TabControl.hpp>
#include <FMX.Types.hpp>
#include <FMX.ActnList.hpp>
#include <System.Messaging.hpp>
#include <System.Actions.hpp>

// ---------------------------------------------------------------------------
class TCameraComponentForm : public TForm {
__published: // IDE-managed Components
	TImage *imgCameraView;
	TButton *btnStartStopCamera;
	TCameraComponent *CameraComponent;
	TToolBar *tbToolbar;
	TLabel *lToolbarTitle;
	TButton *btnSettings;
	TActionList *ActionList;
	TAction *actStart;
	TAction *actStop;
	TAction *actShowSettings;

	void __fastcall CameraComponentSampleBufferReady(TObject *Sender,
		const TMediaTime ATime);
	void __fastcall actStopExecute(TObject *Sender);
	void __fastcall actStartExecute(TObject *Sender);
	void __fastcall ActionListExecute(TBasicAction *Action, bool &Handled);
	void __fastcall actShowSettingsExecute(TObject *Sender);
	void __fastcall ActionListUpdate(TBasicAction *Action, bool &Handled);

private: // User declarations
	String FPermissionCamera;
	bool FSavedCameraActive;

	void __fastcall DisplayRationale(TObject* Sender,
		const TStringDynArray APermissions, const _di_TProc APostRationaleProc);
	void __fastcall ActivateCameraPermissionRequestResult(TObject* Sender,
		const System::TArray__1<String>APermissions,
		const System::TArray__1<TPermissionStatus>AGrantResults);
	void __fastcall DisplayCameraPreviewFrame();
	void __fastcall ApplicationEventChangedHandler
		(System::TObject* const Sender, TMessageBase* const M);

public: // User declarations
	__fastcall TCameraComponentForm(TComponent* Owner);
	__fastcall ~TCameraComponentForm();
};

//---------------------------------------------------------------------------
extern PACKAGE TCameraComponentForm *CameraComponentForm;
//---------------------------------------------------------------------------
#endif
