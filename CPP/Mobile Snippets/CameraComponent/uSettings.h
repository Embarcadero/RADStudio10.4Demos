//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef uSettingsH
#define uSettingsH
// ---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.ListBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.Types.hpp>
#include <FMX.Media.hpp>
// ---------------------------------------------------------------------------
__interface TItemSelectedCallback : public System::IInterface {
	virtual void __fastcall Invoke(const int selectedIndex) = 0;
};

typedef System::DelphiInterface<TItemSelectedCallback>_di_TItemSelectedCallback;

class TListPickerHelper {
private:
	TCustomListPicker* FPicker;
	_di_TItemSelectedCallback FCallback;

	void __fastcall ValueChangedHandler(TObject *Sender, int AValueIndex);
	void SetItems(DynamicArray<String>items);
	void SetItemIndex(int itemIndex);

protected:
	void Show();
	__property DynamicArray<String>Items = {write = SetItems};
	__property int ItemIndex = {write = SetItemIndex};
	__property _di_TItemSelectedCallback ItemSelectedCallback = {read = FCallback, write = FCallback};

public:
	TListPickerHelper();
	~TListPickerHelper();
	void SelectValueFromList
		(const DynamicArray<String>AItems,
		const int ASelectedIndex, _di_TItemSelectedCallback ASelectedCallback);
};

class TSettingsForm : public TForm {
__published: // IDE-managed Components
	TToolBar *tbToolbar;
	TLabel *lTitle;
	TSpeedButton *btnBack;
	TListBox *lbSettings;
	TListBoxItem *lbiKind;
	TListBoxGroupHeader *lbiQualityGroupHeader;
	TListBoxItem *lbiResolution;
	TListBoxItem *lbiPriority;
	TListBoxItem *lbiQuality;
	TListBoxGroupHeader *lbiTorchGroupHeader;
	TListBoxItem *lbiTorchMode;

	void __fastcall lbiKindClick(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall lbiPriorityClick(TObject *Sender);
	void __fastcall lbiQualityClick(TObject *Sender);
	void __fastcall lbiTorchModeClick(TObject *Sender);
	void __fastcall lbiResolutionClick(TObject *Sender);

private:
	TCameraComponent *FCamera;
	TListPickerHelper *FPicker;

	void SetCamera(TCameraComponent *ACamera);
	DynamicArray<String> CollectResolutionsTitles();
	void UpdateResolutionTitle();
	void UpdateQualityTitle();
	void UpdatePriorityTitle();
	void UpdateTorchMode();
	void UpdateKindTitle();

public: // User declarations
	__fastcall TSettingsForm(TComponent* Owner);
	__fastcall ~TSettingsForm();

	__property TCameraComponent* Camera = {read = FCamera, write = SetCamera};
};

// ---------------------------------------------------------------------------
extern PACKAGE TSettingsForm *SettingsForm;
// ---------------------------------------------------------------------------
#endif
