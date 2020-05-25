//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef frmAdminToolUH
#define frmAdminToolUH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <IBX.IBDatabase.hpp>
#include <IBX.IBDatabaseInfo.hpp>
#include <IBX.IBServices.hpp>
#include <IBX.IBSQL.hpp>
#include <IBX.IBIntf.hpp>
#include <System.Actions.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Menus.hpp>
//---------------------------------------------------------------------------
static const int OPTION_NAME_COL = 0;
static const int OPTION_VALUE_COL = 1;
static const int FORMAT_ROW = 0;
static const int METADATA_ONLY_ROW = 1;
static const int GARBAGE_COLLECTION_ROW = 2;
static const int TRANSACTIONS_IN_LIMBO_ROW = 3;
static const int CHECKSUMS_ROW = 4;
static const int CONVERT_TO_TABLES_ROW = 5;
static const int VERBOSE_OUTPUT_ROW = 6;
static const int PAGE_SIZE_ROW = 0;
static const int OVERWRITE_ROW = 1;
static const int COMMIT_EACH_TABLE_ROW = 2;
static const int CREATE_SHADOW_FILES_ROW = 3;
static const int DEACTIVATE_INDICES_ROW = 4;
static const int VALIDITY_CONDITIONS_ROW = 5;
static const int USE_ALL_SPACE_ROW = 7;
static const int VALIDATE_RECORD_FRAGMENTS_ROW = 0;
static const int READ_ONLY_VALIDATION_ROW = 1;
static const int IGNORE_CHECKSUM_ERRORS_ROW = 2;
static const int STATISTICS_OPTION_ROW = 0;
static const int FORCED_WRITES_ROW = 0;
static const int SWEEP_INTERVAL_ROW = 1;
static const int READ_ONLY_ROW = 3;
static const int SQL_DIALECT_ROW = 2;
static const System::UnicodeString FORCED_WRITES_TRUE = "Enabled";
static const System::UnicodeString FORCED_WRITES_FALSE = "Disabled";
static const System::UnicodeString READ_ONLY_TRUE = "True";
static const System::UnicodeString READ_ONLY_FALSE = "False";
static const int SWEEP_INTERVAL_MIN = 0;
static const int SWEEP_INTERVAL_MAX = 200000;
static const System::UnicodeString SQL_DIALECT1 = "1";
static const System::UnicodeString SQL_DIALECT2 = "2";
static const System::UnicodeString SQL_DIALECT3 = "3";
//---------------------------------------------------------------------------
class TfrmAdminTool : public TForm
{
__published:	// IDE-managed Components
	TPageControl *PageControl1;
	TTabSheet *tabUsers;
	TListView *lstUsers;
	TButton *btnAdd;
	TButton *btnEdit;
	TButton *btnDelete;
	TTabSheet *tabBackup;
	TLabel *Label1;
	TLabel *Label2;
	TStringGrid *sgBackupOptions;
	TButton *btnOK;
	TStringGrid *sgBackupFiles;
	TComboBox *cbBackupOptions;
	TPanel *pnlBackupOption;
	TEdit *edtBackupName;
	TButton *btnDatabaseLookup;
	TTabSheet *tabRestore;
	TLabel *lblOptions;
	TLabel *Label3;
	TLabel *Label4;
	TButton *Button2;
	TStringGrid *sgRestoreOptions;
	TPanel *pnlRestoreOptionName;
	TComboBox *cbRestoreOptions;
	TStringGrid *sgRestoreFiles;
	TStringGrid *sgRestore;
	TTabSheet *tabValidate;
	TLabel *lblDatabaseName;
	TBevel *bvlLine1;
	TLabel *Label5;
	TPanel *Panel1;
	TStringGrid *sgValidateOptions;
	TComboBox *cbValidateOptions;
	TButton *Button3;
	TEdit *edtValidate;
	TPanel *pnlValidate;
	TTabSheet *tabCertificates;
	TListView *lstCertificates;
	TButton *Button1;
	TButton *btnRemove;
	TGroupBox *GroupBox1;
	TLabel *lblCertificate;
	TTabSheet *tabStatistics;
	TLabel *Label6;
	TLabel *Label7;
	TBevel *Bevel1;
	TStringGrid *sgStats;
	TPanel *pnlStats;
	TComboBox *cbStats;
	TButton *Button4;
	TEdit *edtStatistics;
	TTabSheet *tabProperties;
	TLabel *Label8;
	TLabel *Label9;
	TGroupBox *gbSummaryInfo;
	TLabel *lblDBOwner;
	TLabel *lblDBPages;
	TLabel *lblPageSize;
	TListView *lvSecondaryFiles;
	TStaticText *stxDBOwner;
	TStaticText *stxDBPages;
	TStaticText *stxPageSize;
	TStringGrid *sgProperties;
	TComboBox *cbProperties;
	TPanel *pnlProperties;
	TEdit *edtProperties;
	TButton *Button5;
	TButton *Button6;
	TTabSheet *tabLog;
	TRichEdit *edLog;
	TTabSheet *tabAliases;
	TLabel *Label10;
	TLabel *Label11;
	TListView *lstAliases;
	TEdit *edtAlias;
	TEdit *edtPath;
	TButton *btnAddAlias;
	TButton *btnDeleteAlias;
	TActionList *ActionList1;
	TAction *Login;
	TAction *Logout;
	TAction *AddUser;
	TAction *EditUser;
	TAction *DeleteUser;
	TAction *AddCertificate;
	TAction *RemoveCertificate;
	TAction *Backup;
	TAction *Restore;
	TAction *Validate;
	TAction *Statistics;
	TAction *Lookup;
	TAction *Apply;
	TAction *actAddAlias;
	TAction *actDeleteAlias;
	TMainMenu *MainMenu1;
	TMenuItem *Login1;
	TMenuItem *Logout1;
	TIBSecurityService *srvUsers;
	TIBServerProperties *srvProperties;
	TIBBackupService *srvBackup;
	TOpenDialog *dlgBackupRestore;
	TIBRestoreService *srvRestore;
	TIBValidationService *srvValidate;
	TIBStatisticalService *srvStats;
	TIBLogService *srvLog;
	TIBConfigService *srvConfig;
	TIBDatabase *dbProperties;
	TIBTransaction *trProperties;
	TIBSQL *sqlFiles;
	TIBSQL *sqlOwner;
	TIBDatabaseInfo *infoDB;
	void __fastcall btnAddClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall LogoutUpdate(System::TObject* Sender);
	void __fastcall LoginExecute(System::TObject* Sender);
	void __fastcall LoginUpdate(TObject *Sender);
	void __fastcall LogoutExecute(TObject *Sender);
	void __fastcall RestoreExecute(TObject *Sender);
	void __fastcall AddUserExecute(TObject *Sender);
	void __fastcall LoggedInUpdate(TObject *Sender);
	void __fastcall EditUserExecute(TObject *Sender);
	void __fastcall EditUserUpdate(TObject *Sender);
	void __fastcall DeleteUserExecute(TObject *Sender);
	void __fastcall DeleteUserUpdate(TObject *Sender);
	void __fastcall AddCertificateExecute(TObject *Sender);
	void __fastcall RemoveCertificateExecute(TObject *Sender);
	void __fastcall BackupExecute(TObject *Sender);
	void __fastcall ValidateExecute(TObject *Sender);
	void __fastcall ValidateUpdate(TObject *Sender);
	void __fastcall btnDatabaseLookupClick(TObject *Sender);
	void __fastcall sgBackupOptionsDrawCell(TObject *Sender, int ACol, int ARow, TRect &Rect,
          TGridDrawState State);
	void __fastcall sgBackupOptionsSelectCell(TObject *Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall cbBackupOptionsExit(TObject *Sender);
	void __fastcall sgFilesDrawCell(TObject *Sender, int ACol, int ARow, TRect &Rect,
          TGridDrawState State);
	void __fastcall sgFilesKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall sgRestoreFilesDblClick(TObject *Sender);
	void __fastcall sgRestoreOptionsSelectCell(TObject *Sender, int ACol, int ARow,
          bool &CanSelect);
	void __fastcall cbRestoreOptionsExit(TObject *Sender);
	void __fastcall sgValidateOptionsSelectCell(TObject *Sender, int ACol, int ARow,
          bool &CanSelect);
	void __fastcall cbValidateOptionsExit(TObject *Sender);
	void __fastcall lstCertificatesSelectItem(TObject *Sender, TListItem *Item, bool Selected);
	void __fastcall StatisticsExecute(TObject *Sender);
	void __fastcall StatisticsUpdate(TObject *Sender);
	void __fastcall sgPropertiesSelectCell(TObject *Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall LookupExecute(TObject *Sender);
	void __fastcall LookupUpdate(TObject *Sender);
	void __fastcall cbPropertiesExit(TObject *Sender);
	void __fastcall cbPropertiesChange(TObject *Sender);
	void __fastcall ApplyExecute(TObject *Sender);
	void __fastcall actAddAliasExecute(TObject *Sender);
	void __fastcall actAddAliasUpdate(TObject *Sender);
	void __fastcall actDeleteAliasExecute(TObject *Sender);
	void __fastcall actDeleteAliasUpdate(TObject *Sender);
	void __fastcall cbStatsExit(TObject *Sender);
	void __fastcall lstAliasesSelectItem(TObject *Sender, TListItem *Item, bool Selected);






private:	// User declarations
	IGDSLibrary *AdminGDSLibrary;
	TIBLicensingService *srvLicense;
	bool FLoggedIn;
	void __fastcall UpdateListView(void);
	void __fastcall UpdateServer(System::UnicodeString Server, System::UnicodeString Protocol, System::UnicodeString User, System::UnicodeString Password);
	void __fastcall UpdateOptions(Vcl::Grids::TStringGrid* const Grid, Vcl::Extctrls::TPanel* const Panel, Vcl::Stdctrls::TComboBox* const Combo, const int ACol, const int ARow);
	void __fastcall SetupRestoreTab(void);
	void __fastcall SetupBackupTab(void);
	void __fastcall SetupValidateTab(void);
	void __fastcall SetupStats(void);
	void __fastcall SetupProperties(void);
	void __fastcall ShowLicense(void);
	void __fastcall UpdateAliasList(void);
public:		// User declarations
	__fastcall TfrmAdminTool(TComponent* Owner);
	__property bool LoggedIn = {read=FLoggedIn, nodefault};
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmAdminTool *frmAdminTool;
//---------------------------------------------------------------------------
#endif
