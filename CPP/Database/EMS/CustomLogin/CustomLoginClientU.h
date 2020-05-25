//---------------------------------------------------------------------------

// This software is Copyright (c) 2016 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef CustomLoginClientUH
#define CustomLoginClientUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.ObjectScope.hpp>
#include <FMX.ActnList.hpp>
#include <Fmx.Bind.DBEngExt.hpp>
#include <Fmx.Bind.Editors.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Edit.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.Memo.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.StdCtrls.hpp>
#include <FMX.TabControl.hpp>
#include <FMX.Types.hpp>
#include <IPPeerClient.hpp>
#include <REST.Backend.BindSource.hpp>
#include <REST.Backend.EMSProvider.hpp>
#include <REST.Backend.EMSServices.hpp>
#include <REST.Backend.MetaTypes.hpp>
#include <REST.Backend.ServiceComponents.hpp>
#include <REST.Backend.ServiceTypes.hpp>
#include <System.Actions.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.JSON.hpp>
#include <System.Rtti.hpp>
#include <memory>
//---------------------------------------------------------------------------
class TEMSClientForm : public TForm
{
__published:	// IDE-managed Components
	TLayout *Layout1;
	TLabel *Label3;
	TEdit *EditLoginResource;
	TCheckBox *CheckBoxLoginResource;
	TLayout *Layout2;
	TTabControl *TabControl1;
	TTabItem *TabItemLogin;
	TButton *ButtonLogin;
	TButton *ButtonLogout;
	TEdit *EditLoginPassword;
	TLabel *LabelPassword;
	TEdit *EditLoginUserName;
	TLabel *LabelUserName;
	TTabItem *TabItemSignup;
	TButton *ButtonSignup;
	TEdit *EditSignupUserName;
	TLabel *Label1;
	TEdit *EditSignupPassword;
	TLabel *Label2;
	TTabItem *TabItemUser;
	TButton *ButtonDeleteUser;
	TButton *ButtonRetrieveFields;
	TButton *ButtonUpdateFields;
	TLabel *Label4;
	TEMSProvider *EMSProvider1;
	TBackendAuth *BackendAuth1;
	TBindingsList *BindingsList1;
	TLinkControlToField *LinkControlToFieldUserName;
	TLinkControlToField *LinkControlToFieldPassword;
	TLinkControlToField *LinkControlToField1;
	TLinkControlToField *LinkControlToField2;
	TActionList *ActionList1;
	TAction *ActionLogin;
	TAction *ActionLogout;
	TAction *ActionSignup;
	TAction *ActionCurrentUserName;
	TAction *ActionDeleteUser;
	TAction *ActionRetrieveUserFields;
	TAction *ActionUpdateUserFields;
	TAction *ActionUseCustomResource;
	TMemo *MemoJSONUser;
	TLayout *Layout3;
	void __fastcall ActionLoginExecute(TObject *Sender);
	void __fastcall ActionLoginUpdate(TObject *Sender);
	void __fastcall ActionLogoutExecute(TObject *Sender);
	void __fastcall ActionLogoutUpdate(TObject *Sender);
	void __fastcall ActionSignupExecute(TObject *Sender);
	void __fastcall ActionCurrentUserNameExecute(TObject *Sender);
	void __fastcall ActionCurrentUserNameUpdate(TObject *Sender);
	void __fastcall ActionDeleteUserExecute(TObject *Sender);
	void __fastcall ActionDeleteUserUpdate(TObject *Sender);
	void __fastcall ActionRetrieveUserFieldsExecute(TObject *Sender);
	void __fastcall ActionRetrieveUserFieldsUpdate(TObject *Sender);
	void __fastcall ActionUpdateUserFieldsExecute(TObject *Sender);
	void __fastcall ActionUpdateUserFieldsUpdate(TObject *Sender);
	void __fastcall ActionUseCustomResourceExecute(TObject *Sender);
	void __fastcall ActionUseCustomResourceUpdate(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TEMSClientForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEMSClientForm *EMSClientForm;
//---------------------------------------------------------------------------
#endif
