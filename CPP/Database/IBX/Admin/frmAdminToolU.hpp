//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef FrmadmintooluHPP
#define FrmadmintooluHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <System.Actions.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.ComCtrls.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ActnList.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Vcl.Grids.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Data.DB.hpp>	// Pascal unit
#include <IBServices.hpp>	// Pascal unit
#include <IBSQL.hpp>	// Pascal unit
#include <IBDatabase.hpp>	// Pascal unit
#include <IBDatabaseInfo.hpp>	// Pascal unit
#include <IBIntf.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Frmadmintoolu
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrmAdminTool;
class PASCALIMPLEMENTATION TfrmAdminTool : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Comctrls::TPageControl* PageControl1;
	Vcl::Comctrls::TTabSheet* tabUsers;
	Vcl::Actnlist::TActionList* ActionList1;
	Vcl::Menus::TMainMenu* MainMenu1;
	Vcl::Menus::TMenuItem* Login1;
	Vcl::Menus::TMenuItem* Logout1;
	Vcl::Actnlist::TAction* Login;
	Vcl::Actnlist::TAction* Logout;
	Vcl::Comctrls::TTabSheet* tabBackup;
	Vcl::Comctrls::TTabSheet* tabRestore;
	Vcl::Comctrls::TTabSheet* tabValidate;
	Vcl::Comctrls::TTabSheet* tabCertificates;
	Vcl::Comctrls::TTabSheet* tabStatistics;
	Vcl::Comctrls::TTabSheet* tabProperties;
	Vcl::Comctrls::TListView* lstUsers;
	Ibservices::TIBSecurityService* srvUsers;
	Vcl::Stdctrls::TButton* btnAdd;
	Vcl::Stdctrls::TButton* btnEdit;
	Vcl::Stdctrls::TButton* btnDelete;
	Vcl::Comctrls::TListView* lstCertificates;
	Ibservices::TIBServerProperties* srvProperties;
	Vcl::Stdctrls::TButton* Button1;
	Vcl::Stdctrls::TButton* btnRemove;
	Vcl::Actnlist::TAction* AddCertificate;
	Vcl::Actnlist::TAction* RemoveCertificate;
	Vcl::Stdctrls::TGroupBox* GroupBox1;
	Vcl::Stdctrls::TLabel* lblCertificate;
	Vcl::Grids::TStringGrid* sgBackupOptions;
	Vcl::Stdctrls::TButton* btnOK;
	Vcl::Grids::TStringGrid* sgBackupFiles;
	Vcl::Stdctrls::TComboBox* cbBackupOptions;
	Vcl::Extctrls::TPanel* pnlBackupOption;
	Vcl::Actnlist::TAction* Backup;
	Ibservices::TIBBackupService* srvBackup;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TEdit* edtBackupName;
	Vcl::Stdctrls::TButton* btnDatabaseLookup;
	Vcl::Dialogs::TOpenDialog* dlgBackupRestore;
	Vcl::Stdctrls::TLabel* lblOptions;
	Vcl::Stdctrls::TButton* Button2;
	Vcl::Grids::TStringGrid* sgRestoreOptions;
	Vcl::Extctrls::TPanel* pnlRestoreOptionName;
	Vcl::Stdctrls::TComboBox* cbRestoreOptions;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Grids::TStringGrid* sgRestoreFiles;
	Vcl::Grids::TStringGrid* sgRestore;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Stdctrls::TLabel* Label4;
	Vcl::Actnlist::TAction* Restore;
	Ibservices::TIBRestoreService* srvRestore;
	Ibservices::TIBValidationService* srvValidate;
	Vcl::Stdctrls::TLabel* lblDatabaseName;
	Vcl::Extctrls::TBevel* bvlLine1;
	Vcl::Stdctrls::TLabel* Label5;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Grids::TStringGrid* sgValidateOptions;
	Vcl::Stdctrls::TComboBox* cbValidateOptions;
	Vcl::Stdctrls::TButton* Button3;
	Vcl::Stdctrls::TEdit* edtValidate;
	Vcl::Extctrls::TPanel* pnlValidate;
	Vcl::Actnlist::TAction* Validate;
	Vcl::Stdctrls::TLabel* Label6;
	Vcl::Stdctrls::TLabel* Label7;
	Vcl::Extctrls::TBevel* Bevel1;
	Vcl::Grids::TStringGrid* sgStats;
	Vcl::Extctrls::TPanel* pnlStats;
	Vcl::Stdctrls::TComboBox* cbStats;
	Vcl::Stdctrls::TButton* Button4;
	Vcl::Stdctrls::TEdit* edtStatistics;
	Vcl::Actnlist::TAction* Statistics;
	Ibservices::TIBStatisticalService* srvStats;
	Ibservices::TIBLogService* srvLog;
	Vcl::Comctrls::TTabSheet* tabLog;
	Vcl::Comctrls::TRichEdit* edLog;
	Ibservices::TIBConfigService* srvConfig;
	Vcl::Stdctrls::TLabel* Label8;
	Vcl::Stdctrls::TGroupBox* gbSummaryInfo;
	Vcl::Stdctrls::TLabel* lblDBOwner;
	Vcl::Stdctrls::TLabel* lblDBPages;
	Vcl::Stdctrls::TLabel* lblPageSize;
	Vcl::Comctrls::TListView* lvSecondaryFiles;
	Vcl::Stdctrls::TStaticText* stxDBOwner;
	Vcl::Stdctrls::TStaticText* stxDBPages;
	Vcl::Stdctrls::TStaticText* stxPageSize;
	Vcl::Grids::TStringGrid* sgProperties;
	Vcl::Stdctrls::TComboBox* cbProperties;
	Vcl::Extctrls::TPanel* pnlProperties;
	Vcl::Stdctrls::TLabel* Label9;
	Vcl::Stdctrls::TEdit* edtProperties;
	Vcl::Stdctrls::TButton* Button5;
	Vcl::Stdctrls::TButton* Button6;
	Vcl::Actnlist::TAction* Lookup;
	Vcl::Actnlist::TAction* Apply;
	Ibdatabase::TIBDatabase* dbProperties;
	Ibdatabase::TIBTransaction* trProperties;
	Ibsql::TIBSQL* sqlFiles;
	Ibsql::TIBSQL* sqlOwner;
	Ibdatabaseinfo::TIBDatabaseInfo* infoDB;
	Vcl::Comctrls::TTabSheet* tabAliases;
	Vcl::Comctrls::TListView* lstAliases;
	Vcl::Stdctrls::TLabel* Label10;
	Vcl::Stdctrls::TLabel* Label11;
	Vcl::Stdctrls::TEdit* edtAlias;
	Vcl::Stdctrls::TEdit* edtPath;
	Vcl::Stdctrls::TButton* btnAddAlias;
	Vcl::Stdctrls::TButton* btnDeleteAlias;
	Vcl::Actnlist::TAction* actAddAlias;
	Vcl::Actnlist::TAction* actDeleteAlias;
	void __fastcall LogoutUpdate(System::TObject* Sender);
	void __fastcall LoginExecute(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall LogoutExecute(System::TObject* Sender);
	void __fastcall LoginUpdate(System::TObject* Sender);
	void __fastcall AddUserExecute(System::TObject* Sender);
	void __fastcall LoggedInUpdate(System::TObject* Sender);
	void __fastcall EditUserExecute(System::TObject* Sender);
	void __fastcall DeleteUserUpdate(System::TObject* Sender);
	void __fastcall DeleteUserExecute(System::TObject* Sender);
	void __fastcall EditUserUpdate(System::TObject* Sender);
	void __fastcall lstCertificatesSelectItem(System::TObject* Sender, Vcl::Comctrls::TListItem* Item, bool Selected);
	void __fastcall AddCertificateExecute(System::TObject* Sender);
	void __fastcall RemoveCertificateExecute(System::TObject* Sender);
	void __fastcall sgFilesDrawCell(System::TObject* Sender, int ACol, int ARow, const System::Types::TRect &Rect, Vcl::Grids::TGridDrawState State);
	void __fastcall sgFilesKeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	void __fastcall sgBackupOptionsDrawCell(System::TObject* Sender, int ACol, int ARow, const System::Types::TRect &Rect, Vcl::Grids::TGridDrawState State);
	void __fastcall sgBackupOptionsSelectCell(System::TObject* Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall BackupExecute(System::TObject* Sender);
	void __fastcall btnDatabaseLookupClick(System::TObject* Sender);
	void __fastcall sgRestoreFilesDblClick(System::TObject* Sender);
	void __fastcall sgRestoreOptionsSelectCell(System::TObject* Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall RestoreExecute(System::TObject* Sender);
	void __fastcall sgValidateOptionsSelectCell(System::TObject* Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall ValidateExecute(System::TObject* Sender);
	void __fastcall ValidateUpdate(System::TObject* Sender);
	void __fastcall StatisticsExecute(System::TObject* Sender);
	void __fastcall LookupUpdate(System::TObject* Sender);
	void __fastcall sgPropertiesSelectCell(System::TObject* Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall cbPropertiesChange(System::TObject* Sender);
	void __fastcall LookupExecute(System::TObject* Sender);
	void __fastcall ApplyExecute(System::TObject* Sender);
	void __fastcall cbPropertiesExit(System::TObject* Sender);
	void __fastcall cbStatsExit(System::TObject* Sender);
	void __fastcall cbValidateOptionsExit(System::TObject* Sender);
	void __fastcall cbRestoreOptionsExit(System::TObject* Sender);
	void __fastcall cbBackupOptionsExit(System::TObject* Sender);
	void __fastcall StatisticsUpdate(System::TObject* Sender);
	void __fastcall actAddAliasUpdate(System::TObject* Sender);
	void __fastcall actAddAliasExecute(System::TObject* Sender);
	void __fastcall lstAliasesSelectItem(System::TObject* Sender, Vcl::Comctrls::TListItem* Item, bool Selected);
	void __fastcall actDeleteAliasUpdate(System::TObject* Sender);
	void __fastcall actDeleteAliasExecute(System::TObject* Sender);
	
private:
	Ibintf::_di_IGDSLibrary AdminGDSLibrary;
	Ibservices::TIBLicensingService* srvLicense;
	bool FLoggedIn;
	void __fastcall UpdateListView(void);
	void __fastcall UpdateServer(System::UnicodeString Server, System::UnicodeString Protocol, System::UnicodeString User, System::UnicodeString password);
	void __fastcall ShowLicense(void);
	void __fastcall UpdateOptions(Vcl::Grids::TStringGrid* const Grid, Vcl::Extctrls::TPanel* const Panel, Vcl::Stdctrls::TComboBox* const Combo, const int ACol, const int ARow);
	void __fastcall SetupRestoreTab(void);
	void __fastcall SetupBackupTab(void);
	void __fastcall SetupValidateTab(void);
	void __fastcall SetupStats(void);
	void __fastcall SetupProperties(void);
	void __fastcall UpdateAliasList(void);
	
public:
	__fastcall virtual TfrmAdminTool(System::Classes::TComponent* AOwner);
	__property bool LoggedIn = {read=FLoggedIn, nodefault};
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmAdminTool(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmAdminTool(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrmAdminTool(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE TfrmAdminTool* frmAdminTool;
}	/* namespace Frmadmintoolu */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_FRMADMINTOOLU)
using namespace Frmadmintoolu;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// FrmadmintooluHPP
