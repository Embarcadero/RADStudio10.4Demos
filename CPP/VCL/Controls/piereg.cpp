//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <memory>          //For use of auto_ptr
#pragma hdrstop

#include  "piereg.h"
#include "samp.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

namespace Piereg
{
  void __fastcall PACKAGE Register()
  {
	TComponentClass classes[1] = {__classid(TPie)};
	ActivateClassGroup(__classid(Controls::TControl));

	GroupDescendentsWith(__classid(TPie), __classid(Controls::TControl));
	RegisterComponents(LoadStr(Tab_101), classes, 0);
	RegisterComponentEditor(__classid(TPie), __classid(TPieEditor));
	RegisterPropertyEditor(__typeinfo(TAngles),
						   NULL,
						   "",
						   __classid(TAnglesProperty));
  }
} //namespace

// TAngleEditorDlg

__fastcall TAngleEditorDlg::TAngleEditorDlg(TComponent* AOwner) : TForm(AOwner) { }
__fastcall TAngleEditorDlg::TAngleEditorDlg(TComponent* AOwner, int Dummy) : TForm(AOwner, Dummy) { }
__fastcall TAngleEditorDlg::TAngleEditorDlg(HWND ParentWindow) : TForm(ParentWindow) { }
__fastcall TAngleEditorDlg::~TAngleEditorDlg(void) { }

void __fastcall TAngleEditorDlg::STrackBarChange(TObject* /*Sender*/)
{
  SetStartAngle(STrackBar->Position);
}

void __fastcall TAngleEditorDlg::ETrackBarChange(TObject* /*Sender*/)
{
  SetEndAngle(ETrackBar->Position);
}

void __fastcall TAngleEditorDlg::SetStartAngle(Integer Value)
{
  STrackBar->Position = Value;
  SAngleLabel->Caption = LoadStr(StartAngle_RC) + String(Value);
  FAngles->StartAngle = Value;
}

void __fastcall TAngleEditorDlg::SetEndAngle(Integer Value)
{
  ETrackBar->Position = Value;
  EAngleLabel->Caption = LoadStr(EndAngle_RC) + String(Value);
  FAngles->EndAngle = Value;
}

void __fastcall TAngleEditorDlg::SetAngles(TAngles* Value)
{
  FAngles = Value;
  FOrigStart = Value->StartAngle;
  FOrigEnd = Value->EndAngle;
  SetStartAngle(Value->StartAngle);
  SetEndAngle(Value->EndAngle);
}

void __fastcall TAngleEditorDlg::CancelClick(TObject* /*Sender*/)
{
  SetStartAngle(FOrigStart);
  SetEndAngle(FOrigEnd);
}

//---------------------------------------------------------------------------
// TAnglesProperty

__fastcall TAnglesProperty::TAnglesProperty(const _di_IDesigner ADesigner, int APropCount) : TClassProperty(ADesigner, APropCount) { }
__fastcall TAnglesProperty::~TAnglesProperty(void) { }

void __fastcall TAnglesProperty::Edit()
{
  //We use the auto_ptr so that the object is destroyed automatically
  //on exit of the function.
  //  std::auto_ptr<TAngles> Angles(new TAngles());
  std::auto_ptr<TAngleEditorDlg> AngleEditor(new TAngleEditorDlg(Application));

  AngleEditor->EditorAngles = (TAngles*)GetOrdValue();
  AngleEditor->ShowModal();
}

TPropertyAttributes __fastcall TAnglesProperty::GetAttributes()
{
  return (TPropertyAttributes() << paDialog << paSubProperties);
}

//---------------------------------------------------------------------------
//TPieEditor
__fastcall TPieEditor::TPieEditor(TComponent* AComponent, _di_IDesigner ADesigner)
                      : TDefaultEditor(AComponent, ADesigner) { }
__fastcall TPieEditor::~TPieEditor(void) { }

void __fastcall TPieEditor::EditProperty(const _di_IProperty Prop, bool& Continue)
 {
  String PropName(Prop->GetName());
  if (PropName.CompareIC("ANGLES") == 0){
    Prop->Edit();
    Continue = false;
  }
}

int __fastcall TPieEditor::GetVerbCount()
{
  return 1;
}

String __fastcall TPieEditor::GetVerb(Integer Index)
{
  if (Index == 0)
	 return LoadStr(EditAngle_RC);
  else
    return String("");
}

void __fastcall TPieEditor::ExecuteVerb(Integer Index)
{
  if (Index == 0) Edit();
}
//---------------------------------------------------------------------------
