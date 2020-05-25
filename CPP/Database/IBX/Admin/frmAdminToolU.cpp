//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#include <vcl.h>
#include <System.UITypes.hpp>
#pragma hdrstop

#include "frmAdminToolU.h"
#include "frmUserInformationU.h"
#include "frmLoginU.h"
#include "frmVerboseU.h"
#include "frmAddCertificateU.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmAdminTool *frmAdminTool;

// ---------------------------------------------------------------------------
__fastcall TfrmAdminTool::TfrmAdminTool(TComponent* Owner) : TForm(Owner) {
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::btnAddClick(TObject *Sender) {
	frmUserInformation = new TfrmUserInformation(this);
	frmUserInformation->SecurityService = srvUsers;
	frmUserInformation->DisplayUser("");
	if (frmUserInformation->ShowModal() == IDOK) {
		UpdateListView();
	}
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::UpdateListView(void) {
	int i;
	TListItem *ListItem = new TListItem(NULL);
	srvUsers->Active = true;
	srvUsers->DisplayUsers();
	lstUsers->Items->BeginUpdate();
	lstUsers->Items->Clear();
	for (i = 0; i < (srvUsers->UserInfoCount); i++) {
		ListItem = lstUsers->Items->Add();
		ListItem->Caption = srvUsers->UserInfo[i]->UserName;
		ListItem->SubItems->Add(srvUsers->UserInfo[i]->FirstName + " " +
			srvUsers->UserInfo[i]->MiddleName + " " +
			srvUsers->UserInfo[i]->LastName);
		ListItem->SubItems->Add(IntToStr(srvUsers->UserInfo[i]->UserID));
		ListItem->SubItems->Add(IntToStr(srvUsers->UserInfo[i]->GroupID));
	}
	lstUsers->Items->EndUpdate();
	srvUsers->Active = false;
}

void __fastcall TfrmAdminTool::FormCreate(TObject *Sender) {
	System::UnicodeString sClientType;
	sClientType = "IBServer";
	AdminGDSLibrary = Ibintf::GetGDSLibrary(sClientType);
	try {
		AdminGDSLibrary->CheckIBLoaded();
	}
	catch (Exception& E) {
		ShowMessage("InterBase version less than 6 found, aborting");
		Application->Terminate();
	}
	SetupBackupTab();
	SetupRestoreTab();
	SetupValidateTab();
	SetupStats();
	SetupProperties();
	PageControl1->ActivePage = tabUsers;
	FLoggedIn = false;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::SetupRestoreTab(void) {
	sgRestoreFiles->Cells[0][0] = "Filename(s)";
	sgRestore->Cells[0][0] = "Filename(s)";
	sgRestore->Cells[1][0] = "Pages";
	sgRestoreOptions->RowCount = 8;
	sgRestoreOptions->Cells[OPTION_NAME_COL][PAGE_SIZE_ROW] =
		"Page Size (Bytes)";
	sgRestoreOptions->Cells[OPTION_VALUE_COL][PAGE_SIZE_ROW] = "4096";
	sgRestoreOptions->Cells[OPTION_NAME_COL][OVERWRITE_ROW] = "Overwrite";
	sgRestoreOptions->Cells[OPTION_VALUE_COL][OVERWRITE_ROW] = "False";
	sgRestoreOptions->Cells[OPTION_NAME_COL][COMMIT_EACH_TABLE_ROW] =
		"Commit After Each Table";
	sgRestoreOptions->Cells[OPTION_VALUE_COL][COMMIT_EACH_TABLE_ROW] = "False";
	sgRestoreOptions->Cells[OPTION_NAME_COL][CREATE_SHADOW_FILES_ROW] =
		"Create Shadow Files";
	sgRestoreOptions->Cells[OPTION_VALUE_COL][CREATE_SHADOW_FILES_ROW] = "True";
	sgRestoreOptions->Cells[OPTION_NAME_COL][DEACTIVATE_INDICES_ROW] =
		"Deactivate Indices";
	sgRestoreOptions->Cells[OPTION_VALUE_COL][DEACTIVATE_INDICES_ROW] = "False";
	sgRestoreOptions->Cells[OPTION_NAME_COL][VALIDITY_CONDITIONS_ROW] =
		"Validity Conditions";
	sgRestoreOptions->Cells[OPTION_VALUE_COL][VALIDITY_CONDITIONS_ROW] =
		"Restore";
	sgRestoreOptions->Cells[OPTION_NAME_COL][USE_ALL_SPACE_ROW] =
		"Use All Space";
	sgRestoreOptions->Cells[OPTION_VALUE_COL][USE_ALL_SPACE_ROW] = "False";
	sgRestoreOptions->Cells[OPTION_NAME_COL][VERBOSE_OUTPUT_ROW] =
		"Verbose Output";
	sgRestoreOptions->Cells[OPTION_VALUE_COL][VERBOSE_OUTPUT_ROW] = "To Screen";
	pnlRestoreOptionName->Caption = "Page Size (Bytes)";
	cbRestoreOptions->Items->Add("1024");
	cbRestoreOptions->Items->Add("2048");
	cbRestoreOptions->Items->Add("4096");
	cbRestoreOptions->Items->Add("8192");
	cbRestoreOptions->ItemIndex = 2;
}

void __fastcall TfrmAdminTool::SetupBackupTab(void) {

	sgBackupOptions->DefaultRowHeight = cbBackupOptions->Height;
	sgBackupFiles->Cells[0][0] = "Filename(s)";
	sgBackupFiles->Cells[1][0] = "Size(Bytes)";
	sgBackupOptions->Cells[OPTION_NAME_COL][FORMAT_ROW] = "Format";
	sgBackupOptions->Cells[OPTION_VALUE_COL][FORMAT_ROW] = "Transportable";
	sgBackupOptions->Cells[OPTION_NAME_COL][METADATA_ONLY_ROW] =
		"Metadata Only";
	sgBackupOptions->Cells[OPTION_VALUE_COL][METADATA_ONLY_ROW] = "False";
	sgBackupOptions->Cells[OPTION_NAME_COL][GARBAGE_COLLECTION_ROW] =
		"Garbage Collection";
	sgBackupOptions->Cells[OPTION_VALUE_COL][GARBAGE_COLLECTION_ROW] = "True";
	sgBackupOptions->Cells[OPTION_NAME_COL][TRANSACTIONS_IN_LIMBO_ROW] =
		"Transactions in Limbo";
	sgBackupOptions->Cells[OPTION_VALUE_COL][TRANSACTIONS_IN_LIMBO_ROW] =
		"Process";
	sgBackupOptions->Cells[OPTION_NAME_COL][CHECKSUMS_ROW] = "Checksums";
	sgBackupOptions->Cells[OPTION_VALUE_COL][CHECKSUMS_ROW] = "Process";
	sgBackupOptions->Cells[OPTION_NAME_COL][CONVERT_TO_TABLES_ROW] =
		"Convert to Tables";
	sgBackupOptions->Cells[OPTION_VALUE_COL][CONVERT_TO_TABLES_ROW] = "False";
	sgBackupOptions->Cells[OPTION_NAME_COL][VERBOSE_OUTPUT_ROW] =
		"Verbose Output";
	sgBackupOptions->Cells[OPTION_VALUE_COL][VERBOSE_OUTPUT_ROW] = "To Screen";
	pnlBackupOption->Caption = "Format";
	cbBackupOptions->Items->Add("Transportable");
	cbBackupOptions->Items->Add("Non-Transportable");
	cbBackupOptions->ItemIndex = 0;

};

void __fastcall TfrmAdminTool::SetupValidateTab(void) {
	sgValidateOptions->Cells[OPTION_NAME_COL][VALIDATE_RECORD_FRAGMENTS_ROW] =
		"Validate Record Fragments";
	sgValidateOptions->Cells[OPTION_VALUE_COL][VALIDATE_RECORD_FRAGMENTS_ROW] =
		"False";
	sgValidateOptions->Cells[OPTION_NAME_COL][READ_ONLY_VALIDATION_ROW] =
		"Read Only Validation";
	sgValidateOptions->Cells[OPTION_VALUE_COL][READ_ONLY_VALIDATION_ROW] =
		"False";
	sgValidateOptions->Cells[OPTION_NAME_COL][IGNORE_CHECKSUM_ERRORS_ROW] =
		"Ignore Checksum Errors";
	sgValidateOptions->Cells[OPTION_VALUE_COL][IGNORE_CHECKSUM_ERRORS_ROW] =
		"False";
	pnlValidate->Caption = "Validate Record Fragments";
	cbValidateOptions->Items->Add("True");
	cbValidateOptions->Items->Add("False");
	cbValidateOptions->ItemIndex = 1;
};

void __fastcall TfrmAdminTool::SetupStats(void) {
	sgStats->DefaultRowHeight = cbStats->Height;
	sgStats->RowCount = 1;
	sgStats->Cells[OPTION_NAME_COL][STATISTICS_OPTION_ROW] = "Show data for:";
	sgStats->Cells[OPTION_VALUE_COL][STATISTICS_OPTION_ROW] = "All Options";
	pnlStats->Caption = "Show data for:";
	cbStats->Items->Add("All Options");
	cbStats->Items->Add("Data Pages");
	cbStats->Items->Add("Database Log");
	cbStats->Items->Add("Header Page");
	cbStats->Items->Add("Index Pages");
	cbStats->Items->Add("System Relations");
	cbStats->ItemIndex = 0;
};

void __fastcall TfrmAdminTool::SetupProperties(void) {
	sgProperties->Cells[OPTION_NAME_COL][FORCED_WRITES_ROW] = "Forced Writes";
	pnlProperties->Caption =
		sgProperties->Cells[OPTION_NAME_COL][FORCED_WRITES_ROW];
	sgProperties->Cells[OPTION_NAME_COL][SWEEP_INTERVAL_ROW] = "Sweep Interval";
	sgProperties->Cells[OPTION_NAME_COL][SQL_DIALECT_ROW] = "Database Dialect";
	sgProperties->Cells[OPTION_NAME_COL][READ_ONLY_ROW] = "Read Only";
	cbProperties->Items->Add(FORCED_WRITES_TRUE);
	cbProperties->Items->Add(FORCED_WRITES_FALSE);
	cbProperties->Tag = FORCED_WRITES_ROW;
};

void __fastcall TfrmAdminTool::UpdateServer(System::UnicodeString Server,
	System::UnicodeString Protocol, System::UnicodeString User,
	System::UnicodeString Password) {
	TProtocol ProtocolEnum;
	ProtocolEnum = TProtocol(GetEnumValue(__delphirtti(TProtocol), Protocol));
	srvUsers->ServerName = Server;
	srvUsers->Protocol = ProtocolEnum;
	srvUsers->Params->Clear();
	srvUsers->Params->Values["user_name"] = User;
	srvUsers->Params->Values["password"] = Password;
	UpdateListView();

	if (srvProperties->Active) {
		srvProperties->Active = False;
	}
	srvProperties->ServerName = Server;
	srvProperties->Protocol = ProtocolEnum;
	srvProperties->Params->Clear();
	srvProperties->Params->Values["user_name"] = User;
	srvProperties->Params->Values["password"] = Password;
	srvProperties->Active = true;
	srvProperties->Fetch();

	if (srvProperties->VersionInfo->IsMinimumVersion("6.0")
		&& !srvProperties->VersionInfo->IsMinimumVersion("8.0")) {
		ShowLicense();
	}
	else {
		lblCertificate->Caption =
			"Cannot get licensing info for current server.  This service not available after InterBase 7.5.";
		Button1->Enabled = false;
		btnRemove->Enabled = false;
	}

	if (srvProperties->VersionInfo->IsMinimumVersion("6.0")
		&& !srvProperties->VersionInfo->IsMinimumVersion("8.0")) {
		if (srvLicense->Active) {
			srvLicense->Active = false;
		}
		srvLicense->ServerName = Server;
		srvLicense->Protocol = ProtocolEnum;
		srvLicense->Params->Clear();
		srvLicense->Params->Values["user_name"] = User;
		srvLicense->Params->Values["password"] = Password;
		srvLicense->Active = true;
	}

	UpdateAliasList();
	srvBackup->ServerName = Server;
	srvBackup->Protocol = ProtocolEnum;
	srvBackup->Params->Clear();
	srvBackup->Params->Values["user_name"] = User;
	srvBackup->Params->Values["password"] = Password;

	srvRestore->ServerName = Server;
	srvRestore->Protocol = ProtocolEnum;
	srvRestore->Params->Clear();
	srvRestore->Params->Values["user_name"] = User;
	srvRestore->Params->Values["password"] = Password;

	srvValidate->ServerName = Server;
	srvValidate->Protocol = ProtocolEnum;
	srvValidate->Params->Clear();
	srvValidate->Params->Values["user_name"] = User;
	srvValidate->Params->Values["password"] = Password;

	srvStats->ServerName = Server;
	srvStats->Protocol = ProtocolEnum;
	srvStats->Params->Clear();
	srvStats->Params->Values["user_name"] = User;
	srvStats->Params->Values["password"] = Password;

	srvConfig->ServerName = Server;
	srvConfig->Protocol = ProtocolEnum;
	srvConfig->Params->Clear();
	srvConfig->Params->Values["user_name"] = User;
	srvConfig->Params->Values["password"] = Password;

	srvLog->ServerName = Server;
	srvLog->Protocol = ProtocolEnum;
	srvLog->Params->Clear();
	srvLog->Params->Values["user_name"] = User;
	srvLog->Params->Values["password"] = Password;
	srvLog->Attach();

	srvLog->ServiceStart();
	edLog->Lines->Clear();
	while (!srvLog->Eof) {
		edLog->Lines->Add(srvLog->GetNextLine());
	}
	srvLog->Detach();
}

void __fastcall TfrmAdminTool::ShowLicense(void) {
	int counter;
	TListItem *ListItem;

	try {
		lstCertificates->Items->Clear();
		lblCertificate->Caption = "";
		if (!srvProperties->Active) {
			srvProperties->Active = true;
		}
		// if there are no licenses, FetchLiceses fails and causes active to be false
		srvProperties->FetchLicenseInfo();
		for (counter = 0; counter <= srvProperties->LicenseInfo->Key.get_high();
		counter++) {
			ListItem = lstCertificates->Items->Add();
			ListItem->Caption = srvProperties->LicenseInfo->Id[counter];
			ListItem->SubItems->Add(srvProperties->LicenseInfo->Key[counter]);
		}
		lstCertificates->Items->Item[0]->Selected = true;
		lstCertificates->ItemFocused = lstCertificates->Items->Item[0];
		Button1->Enabled = true;
		btnRemove->Enabled = true;
	}
	catch (Exception& E) {
		lblCertificate->Caption =
			"Cannot get licensing info for current server. This service not available after InterBase 7.5.";
		Button1->Enabled = false;
		btnRemove->Enabled = false;
	}

}

void __fastcall TfrmAdminTool::UpdateAliasList(void) {
	int i;
	TListItem *ListItem;
	System::UnicodeString S;
	lstAliases->Items->BeginUpdate();
	lstAliases->Clear();
	for (i = srvProperties->AliasInfos.Low;
	i <= srvProperties->AliasInfos.High; i++) {
		ListItem = lstAliases->Items->Add();
		ListItem->Caption = srvProperties->AliasInfos[i]->Alias;
		ListItem->SubItems->Add(srvProperties->AliasInfos[i]->DBPath);
	}
	lstAliases->Items->EndUpdate();
}

void __fastcall TfrmAdminTool::UpdateOptions
	(Vcl::Grids::TStringGrid* const Grid, Vcl::Extctrls::TPanel* const Panel,
	Vcl::Stdctrls::TComboBox* const Combo, const int ACol, const int ARow) {
	TRect lR, lName;

	Panel->Caption = Grid->Cells[OPTION_NAME_COL][ARow];

	if (ACol == OPTION_NAME_COL) {
		Combo->ItemIndex = Combo->Items->IndexOf(Grid->Cells[ACol + 1][ARow]);
	}
	else {
		if (ACol == OPTION_VALUE_COL) {
			Combo->ItemIndex = Combo->Items->IndexOf(Grid->Cells[ACol][ARow]);
		}
	}
	Combo->Tag = ARow;
	if (ACol == OPTION_NAME_COL) {
		lName = Grid->CellRect(ACol, ARow);
		lR = Grid->CellRect(ACol + 1, ARow);
	}
	else {
		lName = Grid->CellRect(ACol - 1, ARow);
		lR = Grid->CellRect(ACol, ARow);
	}

	// lName = sgOptions.CellRect(ACol, ARow);
	lName.Left = lName.Left + Grid->Left;
	lName.Right = lName.Right + Grid->Left;
	lName.Top = lName.Top + Grid->Top;
	lName.Bottom = lName.Bottom + Grid->Top;
	Panel->Left = lName.Left + 1;
	Panel->Top = lName.Top + 1;
	Panel->Width = (lName.Right + 1) - lName.Left;
	Panel->Height = (lName.Bottom + 1) - lName.Top;

	// lR = sgOptions.CellRect(ACol, ARow);
	lR.Left = lR.Left + Grid->Left;
	lR.Right = lR.Right + Grid->Left;
	lR.Top = lR.Top + Grid->Top;
	lR.Bottom = lR.Bottom + Grid->Top;
	Combo->Left = lR.Left + 1;
	Combo->Top = lR.Top + 1;
	Combo->Width = (lR.Right + 1) - lR.Left;
	Combo->Height = (lR.Bottom + 1) - lR.Top;
	Combo->SetFocus();

}

void __fastcall TfrmAdminTool::LogoutUpdate(System::TObject* Sender) {
	(dynamic_cast<TAction*>(Sender))->Enabled = FLoggedIn;
}

void __fastcall TfrmAdminTool::LoginExecute(System::TObject* Sender) {
	int i;
	System::UnicodeString User, Password;
	System::UnicodeString UserConstant, PasswordConstant;
	TfrmLogin *frmLogin;
	frmLogin = new TfrmLogin(this);
	/* Try reading the default user name and password from the environment
	 variables if they are set */
	UserConstant = "ISC_USER";
	i = GetEnvironmentVariable(UserConstant.c_str(), User.c_str(), 0);
	if (i > 0) {
		// SetLength(User, i);
		GetEnvironmentVariable(UserConstant.c_str(), User.c_str(), i);
	}
	PasswordConstant = "ISC_PASSWORD";
	i = GetEnvironmentVariable(PasswordConstant.c_str(), Password.c_str(), 0);
	if (i > 0) {
		// SetLength(Password, i);
		GetEnvironmentVariable(PasswordConstant.c_str(), Password.c_str(), i);
	}

	frmLogin->edtUserName->Text = User;
	frmLogin->edtPassword->Text = Password;

	if (frmLogin->ShowModal() == mrOk) {
		FLoggedIn = true;
		UpdateServer(frmLogin->edtServer->Text, frmLogin->cbxProtocol->Text,
			frmLogin->edtUserName->Text, frmLogin->edtPassword->Text);
	}

}

void __fastcall TfrmAdminTool::LoginUpdate(TObject *Sender) {
	(dynamic_cast<TAction*>(Sender))->Enabled = !FLoggedIn;
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::LogoutExecute(TObject *Sender) {
	FLoggedIn = false;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::RestoreExecute(TObject *Sender) {
	int j;
	TRestoreOptions lOptions;
	TfrmVerbose *frmVerbose;
	Screen->Cursor = crHourGlass;
	lOptions = TRestoreOptions();
	srvRestore->Attach();
	if (srvRestore->Active == true) {
		if (sgRestoreOptions->Cells[OPTION_VALUE_COL][OVERWRITE_ROW] == "True")
		{
			lOptions << Replace;
		}
		else {
			lOptions << CreateNewDB;
		}
		if (sgRestoreOptions->Cells[OPTION_VALUE_COL][COMMIT_EACH_TABLE_ROW]
			== "True") {
			lOptions << OneRelationAtATime;
		}
		if (sgRestoreOptions->Cells[OPTION_VALUE_COL][CREATE_SHADOW_FILES_ROW]
			== "False") {
			lOptions << NoShadow;
		}

		if (sgRestoreOptions->Cells[OPTION_VALUE_COL][DEACTIVATE_INDICES_ROW]
			== "True") {
			lOptions << DeactivateIndexes;
		}
		if (sgRestoreOptions->Cells[OPTION_VALUE_COL][VALIDITY_CONDITIONS_ROW]
			== "False") {
			lOptions << NoValidityCheck;
		}
		srvRestore->Options = lOptions;
		srvRestore->PageSize =
			StrToInt(sgRestoreOptions->Cells[OPTION_VALUE_COL][PAGE_SIZE_ROW]);

		if ((sgRestoreOptions->Cells[OPTION_VALUE_COL][VERBOSE_OUTPUT_ROW]
			== "To Screen") ||
			(sgRestoreOptions->Cells[OPTION_VALUE_COL][VERBOSE_OUTPUT_ROW]
			== "To File")) {
			srvRestore->Verbose = true;
		}

		for (j = 1; j < sgRestoreFiles->RowCount; j++)
			if (sgRestoreFiles->Cells[0][j] != "") {
				srvRestore->BackupFile->Add(sgRestoreFiles->Cells[0][j]);
			}

		for (j = 1; j < sgRestore->RowCount; j++) {
			if ((sgRestore->Cells[0][j] != "") &&
				(sgRestore->Cells[1][j] != "")) {
				srvRestore->DatabaseName->Add(sgRestore->Cells[0][j] + "=" +
					sgRestore->Cells[1][j]);
			}
			else {
				srvRestore->DatabaseName->Add(sgRestore->Cells[0][j]);
			}
		}

		try {
			srvRestore->ServiceStart();
			if (srvRestore->Verbose) {
				frmVerbose = new TfrmVerbose(this);
				frmVerbose->Show();
				while (!srvRestore->Eof) {
					Application->ProcessMessages();
					frmVerbose->edOutput->Lines->Add(srvRestore->GetNextLine());
				}
			}
			else {
				while (srvRestore->IsServiceRunning) {
					Application->ProcessMessages();
				}
			}
		}
		catch (Exception& E) {
			ShowMessage(E.Message);
		}
	}

	if (srvRestore->Active) {
		srvRestore->Detach();
	}
	Screen->Cursor = crDefault;

}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::AddUserExecute(TObject *Sender) {
	TfrmUserInformation *frmUserInformation = new TfrmUserInformation(this);
	frmUserInformation->SecurityService = srvUsers;
	frmUserInformation->DisplayUser("");
	if (frmUserInformation->ShowModal() == IDOK) {
		UpdateListView();
	}
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::LoggedInUpdate(TObject *Sender) {
	(dynamic_cast<TAction *>(Sender))->Enabled = FLoggedIn;
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::EditUserExecute(TObject *Sender) {
	TfrmUserInformation *frmUserInformation = new TfrmUserInformation(this);
	frmUserInformation->SecurityService = srvUsers;
	frmUserInformation->DisplayUser(lstUsers->Selected->Caption);
	if (frmUserInformation->ShowModal() == IDOK) {
		UpdateListView();
	}
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::EditUserUpdate(TObject *Sender) {
	(dynamic_cast<TAction*>(Sender))->Enabled =
		(lstUsers->Selected != NULL) && LoggedIn;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::DeleteUserExecute(TObject *Sender) {
	if (MessageDlg("Are you certain you wish to delete this user?",
		mtConfirmation, TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes) {
		srvUsers->Active = true;
		srvUsers->UserName = lstUsers->Selected->Caption;
		srvUsers->DeleteUser();
		srvUsers->Active = false;
		UpdateListView();
	}
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::DeleteUserUpdate(TObject *Sender) {
	if (!LoggedIn) {
		(dynamic_cast<TAction*>(Sender))->Enabled = false;
	}
	else {
		if (lstUsers->Selected == NULL) {
			(dynamic_cast<TAction*>(Sender))->Enabled = false;
		}
		else {
			(dynamic_cast<TAction*>(Sender))->Enabled =
				!(lstUsers->Selected->Caption == "SYSDBA");
		}
	}
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::AddCertificateExecute(TObject *Sender) {
	TfrmAddCertificate *frmAddCertificate = new TfrmAddCertificate(this);
	frmAddCertificate->LicensingService = srvLicense;
	if (frmAddCertificate->ShowModal() == mrOk) {
		if (!srvProperties->Active) {
			srvProperties->Active = true;
		}
		ShowLicense();
	}

}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::RemoveCertificateExecute(TObject *Sender) {
	srvLicense->Key =
		lstCertificates->Items->Item[lstCertificates->Selected->Index]->SubItems
		[0].Text;
	srvLicense->RemoveLicense();
	ShowLicense();
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::BackupExecute(TObject *Sender) {
	int j;
	TBackupOptions lOptions;
	TfrmVerbose *frmVerbose;

	Screen->Cursor = crHourGlass;
	srvBackup->Attach();

	lOptions = TBackupOptions();

	if (srvBackup->Active == true) {
		if (sgBackupOptions->Cells[OPTION_VALUE_COL][FORMAT_ROW]
			== "Non-Transportable")
			lOptions << NonTransportable;
		if (sgBackupOptions->Cells[OPTION_VALUE_COL][METADATA_ONLY_ROW]
			== "True")
			lOptions << MetadataOnly;
		if (sgBackupOptions->Cells[OPTION_VALUE_COL][GARBAGE_COLLECTION_ROW]
			== "False")
			lOptions << NoGarbageCollection;
		if (sgBackupOptions->Cells[OPTION_VALUE_COL][TRANSACTIONS_IN_LIMBO_ROW]
			== "Ignore")
			lOptions << IgnoreLimbo;
		if (sgBackupOptions->Cells[OPTION_VALUE_COL][CHECKSUMS_ROW] == "True")
			lOptions << IgnoreChecksums;
		if (sgBackupOptions->Cells[OPTION_VALUE_COL][CONVERT_TO_TABLES_ROW]
			== "True")
			lOptions << ConvertExtTables;
		srvBackup->Options = lOptions;

		if ((sgBackupOptions->Cells[OPTION_VALUE_COL][VERBOSE_OUTPUT_ROW]
			== "To Screen") ||
			(sgBackupOptions->Cells[OPTION_VALUE_COL][VERBOSE_OUTPUT_ROW]
			== "To File"))
			srvBackup->Verbose = true;

		for (j = 1; j < sgBackupFiles->RowCount; j++) {
			if ((sgBackupFiles->Cells[0][j] != "") &&
				(sgBackupFiles->Cells[1][j] != "")) {
				srvBackup->BackupFile->Add(sgBackupFiles->Cells[0][j] + "=" +
					sgBackupFiles->Cells[1][j]);
			}
			else if (sgBackupFiles->Cells[0][j] != "")
				srvBackup->BackupFile->Add(sgBackupFiles->Cells[0][j]);
		}

		srvBackup->DatabaseName = edtBackupName->Text;
		srvBackup->ServiceStart();
		if (srvBackup->Verbose) {
			frmVerbose = new TfrmVerbose(this);
			frmVerbose->Show();
			while (!srvBackup->Eof) {
				Application->ProcessMessages();
				frmVerbose->edOutput->Lines->Add(srvBackup->GetNextLine());
			}
		}
		else
			while (srvBackup->IsServiceRunning)
				Application->ProcessMessages();
	}

	if (srvBackup->Active) {
		srvBackup->Detach();
		Screen->Cursor = crDefault;
	}

}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::ValidateExecute(TObject *Sender) {
	TValidateOptions lValidateOptions;
	TfrmVerbose *frmVerbose;

	lValidateOptions = TValidateOptions();

	Screen->Cursor = crHourGlass;

	srvValidate->Attach();

	// if successfully attached to server
	if (srvValidate->Active == true) {

		switch (srvValidate->Protocol) {
		case TCP:
			srvValidate->DatabaseName = srvValidate->ServerName + ":" +
				edtValidate->Text;
		case NamedPipe:
			srvValidate->DatabaseName = "\\\\" + srvValidate->ServerName +
				"\\" + edtValidate->Text;
		case SPX:
			srvValidate->DatabaseName = srvValidate->ServerName + "@" +
				edtValidate->Text;
		case Local:
			srvValidate->DatabaseName = edtValidate->Text;
		};
		// determine which options have been selected
		lValidateOptions << ValidateDB;
		if (sgValidateOptions->Cells[1][VALIDATE_RECORD_FRAGMENTS_ROW]
			== "True")
			lValidateOptions << ValidateFull;

		if (sgValidateOptions->Cells[1][READ_ONLY_VALIDATION_ROW] == "True")
			lValidateOptions << CheckDB;

		if (sgValidateOptions->Cells[1][IGNORE_CHECKSUM_ERRORS_ROW] == "True")
			lValidateOptions << IgnoreChecksum;
		srvValidate->Options = lValidateOptions;
		srvValidate->ServiceStart();
		Application->ProcessMessages();

		frmVerbose = new TfrmVerbose(this);
		frmVerbose->Show();
		frmVerbose->edOutput->Lines->Add("Database - " + edtValidate->Text);
		while (!srvValidate->Eof) {
			Application->ProcessMessages();
			frmVerbose->edOutput->Lines->Add(Trim(srvValidate->GetNextLine()));
		};
		if (frmVerbose->edOutput->Lines->Count == 2)
			frmVerbose->edOutput->Lines->Add
				("No database validation errors were found->");
	};
	Screen->Cursor = crDefault;
	if (srvValidate->Active)
		srvValidate->Detach();
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::ValidateUpdate(TObject *Sender) {
	(dynamic_cast<TAction*>(Sender))->Enabled =
		(edtValidate->Text != "") && FLoggedIn;
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::btnDatabaseLookupClick(TObject *Sender) {
	dlgBackupRestore->Options =
		TOpenOptions() << ofHideReadOnly << ofNoNetworkButton << ofEnableSizing;
	dlgBackupRestore->DefaultExt = "*.gdb";
	dlgBackupRestore->Filter =
		"(*.gdb) InterBase Database|*.gdb|(*.*) All Files|*.*";
	if (dlgBackupRestore->Execute())
		edtBackupName->Text = dlgBackupRestore->FileName;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::sgBackupOptionsDrawCell(TObject *Sender,
	int ACol, int ARow, TRect &Rect, TGridDrawState State) {
	const int INDENT = 2;
	int lLeft;
	System::UnicodeString lText;
	TCanvas *CanvasGrid;

	CanvasGrid = (dynamic_cast<TStringGrid*>(Sender))->Canvas;

	if (ACol == OPTION_VALUE_COL) {
		CanvasGrid->Font->Color = clBlue;
		if (CanvasGrid->Brush->Color == clHighlight) {
			CanvasGrid->Font->Color = clWhite;
			lText = (dynamic_cast<TStringGrid*>(Sender))->Cells[ACol][ARow];
			lLeft = Rect.Left + INDENT;
			CanvasGrid->TextRect(Rect, lLeft, Rect.Top + INDENT, lText);
		}
	}
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::sgBackupOptionsSelectCell(TObject *Sender,
	int ACol, int ARow, bool &CanSelect) {
	cbBackupOptions->Items->Clear();
	switch (ARow) {
	case FORMAT_ROW:
		cbBackupOptions->Items->Add("Transportable");
		cbBackupOptions->Items->Add("Non-Transportable");
		break;
	case METADATA_ONLY_ROW:
	case GARBAGE_COLLECTION_ROW:
	case CONVERT_TO_TABLES_ROW:
		cbBackupOptions->Items->Add("True");
		cbBackupOptions->Items->Add("False");
		break;
	case TRANSACTIONS_IN_LIMBO_ROW:
	case CHECKSUMS_ROW:
		cbBackupOptions->Items->Add("Process");
		cbBackupOptions->Items->Add("Ignore");
		break;
	case VERBOSE_OUTPUT_ROW:
		cbBackupOptions->Items->Add("None");
		cbBackupOptions->Items->Add("To Screen");
	}
	UpdateOptions(sgBackupOptions, pnlBackupOption, cbBackupOptions,
		ACol, ARow);
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::cbBackupOptionsExit(TObject *Sender) {
	sgBackupOptions->Cells[OPTION_VALUE_COL][cbBackupOptions->Tag] =
		cbBackupOptions->Text;
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::sgFilesDrawCell(TObject *Sender, int ACol,
	int ARow, TRect &Rect, TGridDrawState State) {
	const int INDENT = 2;
	int lLeft;
	System::UnicodeString lText;
	TStringGrid *SGrid = (dynamic_cast<TStringGrid*>(Sender));
	if (ACol == 2 && ARow != 0) {
		SGrid->Canvas->Font->Color = clBlack;
		if (SGrid->Canvas->Brush->Color == clHighlight) {
			SGrid->Canvas->Font->Color = clWhite;
		}
		lText = SGrid->Cells[ACol][ARow];
		lLeft = Rect.Left + INDENT;
		SGrid->Canvas->TextRect(Rect, lLeft, Rect.Top + INDENT, lText);
	}

}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::sgFilesKeyDown(TObject *Sender, WORD &Key,
	TShiftState Shift) {
	Word lKey;
	TStringGrid *SGrid = (dynamic_cast<TStringGrid*>(Sender));
	if (Key == VK_TAB && Shift.Contains(ssCtrl)) {
		if (SGrid->Col < (sgBackupFiles->ColCount - 1)) {
			SGrid->Col = sgBackupFiles->Col + 1;
		}
		else {
			if (SGrid->Row == SGrid->RowCount - 1)
				SGrid->RowCount = SGrid->RowCount + 1;
			SGrid->Col = 0;
			SGrid->Row = SGrid->Row + 1;
		}

	}
	if (Key == VK_RETURN && SGrid->Cells[SGrid->Col][SGrid->Row] != "") {
		lKey = VK_TAB;
		TShiftState s = s << ssCtrl;
		sgFilesKeyDown(this, lKey, s);
	}
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::sgRestoreFilesDblClick(TObject *Sender) {
	int i;
	if (srvBackup->Protocol != Local) {
		ShowMessage("Can Only broswe local machine");
		exit(0);
	}
	dlgBackupRestore->Options =
		TOpenOptions() << ofHideReadOnly << ofNoNetworkButton <<
		ofEnableSizing << ofAllowMultiSelect << ofFileMustExist;
	dlgBackupRestore->Filter = "Backup files (*.gbk)|*.gbk|All files (*.*)|*.*";
	dlgBackupRestore->FilterIndex = 1;
	if (dlgBackupRestore->Execute()) {
		if (sgRestoreFiles->RowCount < dlgBackupRestore->Files->Count)
			sgRestoreFiles->RowCount = dlgBackupRestore->Files->Count;
		for (i = 0; i < dlgBackupRestore->Files->Count; i++) {
			sgRestoreFiles->Cells[0][i + 1] =
				dlgBackupRestore->Files->Strings[i];
		}
	}
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::sgRestoreOptionsSelectCell(TObject *Sender,
	int ACol, int ARow, bool &CanSelect) {

	cbRestoreOptions->Items->Clear();
	switch (ARow) {
	case PAGE_SIZE_ROW:
		cbRestoreOptions->Items->Add("1024");
		cbRestoreOptions->Items->Add("2048");
		cbRestoreOptions->Items->Add("4096");
		cbRestoreOptions->Items->Add("8192");
		break;
	case OVERWRITE_ROW:
	case COMMIT_EACH_TABLE_ROW:
	case CREATE_SHADOW_FILES_ROW:
	case DEACTIVATE_INDICES_ROW:
	case USE_ALL_SPACE_ROW:
		cbRestoreOptions->Items->Add("True");
		cbRestoreOptions->Items->Add("False");
		break;
	case VALIDITY_CONDITIONS_ROW:
		cbRestoreOptions->Items->Add("Restore");
		cbRestoreOptions->Items->Add("Ignore");
		break;
	case VERBOSE_OUTPUT_ROW:
		cbRestoreOptions->Items->Add("None");
		cbRestoreOptions->Items->Add("To Screen");
		break;
	}
	UpdateOptions(sgRestoreOptions, pnlRestoreOptionName, cbRestoreOptions,
		ACol, ARow);

}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::cbRestoreOptionsExit(TObject *Sender) {
	sgRestoreOptions->Cells[OPTION_VALUE_COL][cbRestoreOptions->Tag] =
		cbRestoreOptions->Text;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::sgValidateOptionsSelectCell(TObject *Sender,
	int ACol, int ARow, bool &CanSelect) {
	UpdateOptions(sgValidateOptions, pnlValidate, cbValidateOptions,
		ACol, ARow);
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::cbValidateOptionsExit(TObject *Sender) {
	sgValidateOptions->Cells[OPTION_VALUE_COL][cbValidateOptions->Tag] =
		cbValidateOptions->Text;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::lstCertificatesSelectItem(TObject *Sender,
	TListItem *Item, bool Selected) {
	lblCertificate->Caption = srvProperties->LicenseInfo->Desc[Item->Index];
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::StatisticsExecute(TObject *Sender) {
	TStatOptions lDBStatisticsOptions;
	TfrmVerbose *frmVerbose;

	Screen->Cursor = crHourGlass;
	srvStats->Attach();
	try {
		// if successfully attached to server
		if (srvStats->Active == true) {
			// assign database details
			srvStats->DatabaseName = edtStatistics->Text;
			lDBStatisticsOptions = TStatOptions();
			// determine which options have been selected

			switch (cbStats->ItemIndex) {
			case 1:
				lDBStatisticsOptions << DataPages;
				break;
			case 2:
				lDBStatisticsOptions << DbLog;
				break;
			case 3:
				lDBStatisticsOptions << HeaderPages;
				break;
			case 4:
				lDBStatisticsOptions << IndexPages;
				break;
			case 5:
				lDBStatisticsOptions << SystemRelations;
			}
			// assign validation options
			srvStats->Options = lDBStatisticsOptions;
			srvStats->ServiceStart();
			frmVerbose = new TfrmVerbose(this);
			frmVerbose->Show();
			frmVerbose->edOutput->Lines->Add
				("Database Stats - " + edtStatistics->Text);
			while (!srvStats->Eof) {
				Application->ProcessMessages();
				frmVerbose->edOutput->Lines->Add(Trim(srvStats->GetNextLine()));
			}
			frmVerbose->edOutput->Lines->Add("Done");
		}

	}
	catch (Exception& E) {
		ShowMessage(E.Message);
	}
	Screen->Cursor = crDefault;
	if (srvStats->Active)
		srvStats->Detach();
}

// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::StatisticsUpdate(TObject *Sender) {
	(dynamic_cast<TAction*>(Sender))->Enabled =
		(edtStatistics->Text != "") && FLoggedIn;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::sgPropertiesSelectCell(TObject *Sender, int ACol,
	int ARow, bool &CanSelect) {
	cbProperties->Items->Clear();
	switch (ARow) {
	case FORCED_WRITES_ROW:
		cbProperties->Style = csDropDown;
		cbProperties->Items->Add(FORCED_WRITES_TRUE);
		cbProperties->Items->Add(FORCED_WRITES_FALSE);
		cbProperties->Tag = FORCED_WRITES_ROW;
		break;
	case SWEEP_INTERVAL_ROW:
		cbProperties->Style = csSimple;
		cbProperties->Text =
			sgProperties->Cells[OPTION_VALUE_COL][SWEEP_INTERVAL_ROW];
		cbProperties->Tag = SWEEP_INTERVAL_ROW;
		break;
	case READ_ONLY_ROW:
		cbProperties->Style = csDropDown;
		cbProperties->Items->Add(READ_ONLY_TRUE);
		cbProperties->Items->Add(READ_ONLY_FALSE);
		cbProperties->Tag = READ_ONLY_ROW;
		break;
	case SQL_DIALECT_ROW:
		cbProperties->Style = csDropDown;
		cbProperties->Items->Add(SQL_DIALECT1);
		cbProperties->Items->Add(SQL_DIALECT2);
		cbProperties->Items->Add(SQL_DIALECT3);
		if (Lookup->Enabled)
			cbProperties->ItemIndex =
				StrToInt(sgProperties->Cells[OPTION_VALUE_COL]
			[SQL_DIALECT_ROW]) - 1;
		cbProperties->Tag = SQL_DIALECT_ROW;
		break;
	}
	UpdateOptions(sgProperties, pnlProperties, cbProperties, ACol, ARow);

}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::LookupExecute(TObject *Sender) {
	TListItem *lListItem;
	bool dummy;

	switch (srvConfig->Protocol) {
	case TCP:
		dbProperties->DatabaseName = srvConfig->ServerName + ":" +
			edtProperties->Text;
		break;
	case NamedPipe:
		dbProperties->DatabaseName = "\\\\" + srvConfig->ServerName + "\\" +
			edtProperties->Text;
		break;
	case SPX:
		dbProperties->DatabaseName = srvConfig->ServerName + "@" +
			edtProperties->Text;
		break;
	case Local:
		dbProperties->DatabaseName = edtProperties->Text;
		break;
	}

	srvConfig->DatabaseName = edtProperties->Text;
	dbProperties->Params->Clear();
	dbProperties->Params->Assign(srvConfig->Params);
	dbProperties->Connected = true;
	trProperties->StartTransaction();

	stxPageSize->Caption = IntToStr(infoDB->PageSize);
	// get page size from ib info object
	stxDBPages->Caption = IntToStr(infoDB->Allocation);
	// get number of pages allocated
	sgProperties->Cells[OPTION_VALUE_COL][SWEEP_INTERVAL_ROW] =
		IntToStr(infoDB->SweepInterval);

	if (infoDB->ForcedWrites != 0) // True
			sgProperties->Cells[OPTION_VALUE_COL][FORCED_WRITES_ROW] =
			FORCED_WRITES_TRUE;
	else // False
			sgProperties->Cells[OPTION_VALUE_COL][FORCED_WRITES_ROW] =
			FORCED_WRITES_FALSE;
	if (infoDB->ReadOnly != 0) // True
			sgProperties->Cells[OPTION_VALUE_COL][READ_ONLY_ROW] =
			READ_ONLY_TRUE;
	else // False
			sgProperties->Cells[OPTION_VALUE_COL][READ_ONLY_ROW] =
			READ_ONLY_FALSE;
	sgProperties->Cells[OPTION_VALUE_COL][SQL_DIALECT_ROW] =
		IntToStr(infoDB->DBSQLDialect);

	sqlFiles->ExecQuery();
	while (!sqlFiles->Eof) {
		lListItem = lvSecondaryFiles->Items->Add();
		lListItem->Caption = sqlFiles->Fields[0]->AsString;
		lListItem->SubItems->Add(sqlFiles->Fields[1]->AsString);
		sqlFiles->Next();
	}
	sqlFiles->Close();

	sqlOwner->ExecQuery();
	stxDBOwner->Caption = sqlOwner->Fields[0]->AsString;
	sqlOwner->Close();
	trProperties->Commit();
	dbProperties->Close();
	sgPropertiesSelectCell(sgProperties, 1, cbProperties->Tag, dummy);

}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::LookupUpdate(TObject *Sender) {
	(dynamic_cast<TAction*>(Sender))->Enabled =
		(edtProperties->Text != "") && FLoggedIn;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::cbPropertiesExit(TObject *Sender) {
	sgProperties->Cells[OPTION_VALUE_COL][cbProperties->Tag] =
		cbProperties->Text;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::cbPropertiesChange(TObject *Sender) {
	Apply->Enabled = true;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::ApplyExecute(TObject *Sender) {
	int FW, RO, SW, SD;
	Screen->Cursor = crHourGlass;
	try {
		srvConfig->Attach();
		dbProperties->Connected = true;
		FW = infoDB->ForcedWrites;
		RO = infoDB->ReadOnly;
		SW = infoDB->SweepInterval;
		SD = infoDB->DBSQLDialect;
		dbProperties->Connected = false;

		if (srvConfig->Active) // if attached successfully
		{
			if ((sgProperties->Cells[OPTION_VALUE_COL][READ_ONLY_ROW]
				== READ_ONLY_FALSE) && (RO == 1))
				srvConfig->SetReadOnly(false);
			else if ((sgProperties->Cells[OPTION_VALUE_COL][READ_ONLY_ROW]
				== READ_ONLY_TRUE) && (RO == 0))
				srvConfig->SetReadOnly(true);

			while (srvConfig->IsServiceRunning)
				Application->ProcessMessages();

			// Set sweep interval if changed
			if (StrToInt(sgProperties->Cells[OPTION_VALUE_COL]
				[SWEEP_INTERVAL_ROW]) != SW) {
				srvConfig->SetSweepInterval
					(StrToInt(sgProperties->Cells[OPTION_VALUE_COL]
					[SWEEP_INTERVAL_ROW]));
				while (srvConfig->IsServiceRunning)
					Application->ProcessMessages();
			}

			// Set SQL Dialect if changed
			if (StrToInt(sgProperties->Cells[OPTION_VALUE_COL][SQL_DIALECT_ROW])
				!= SD) {
				srvConfig->SetDBSqlDialect
					(StrToInt(sgProperties->Cells[OPTION_VALUE_COL]
					[SQL_DIALECT_ROW]));
				while (srvConfig->IsServiceRunning)
					Application->ProcessMessages();
			}
			// Set forced writes if changed
			if ((sgProperties->Cells[OPTION_VALUE_COL][FORCED_WRITES_ROW]
				== FORCED_WRITES_TRUE) && (FW == 0))
				srvConfig->SetWriteMode(wmSync);
			else if ((sgProperties->Cells[OPTION_VALUE_COL][FORCED_WRITES_ROW]
				== FORCED_WRITES_FALSE) && (FW == 1))
				srvConfig->SetWriteMode(wmASync);

			while (srvConfig->IsServiceRunning)
				Application->ProcessMessages();
		}
		Apply->Enabled = false;
	}
	catch (Exception& E) {
		ShowMessage(E.Message);
	}
	if (srvConfig->Active)
		srvConfig->Detach();
	Screen->Cursor = crDefault;
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::actAddAliasExecute(TObject *Sender) {
	srvProperties->AddAlias(edtAlias->Text, edtPath->Text);
	srvProperties->FetchAliasInfo();
	UpdateAliasList();
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::actAddAliasUpdate(TObject *Sender) {
	(dynamic_cast<TAction*>(Sender))->Enabled =
		(edtAlias->Text != "") && (edtPath->Text != "");

}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::actDeleteAliasExecute(TObject *Sender) {
	srvProperties->DeleteAlias(edtAlias->Text);
	srvProperties->FetchAliasInfo();
	UpdateAliasList();
	edtAlias->Text = "";
	edtPath->Text = "";
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::actDeleteAliasUpdate(TObject *Sender) {
	(dynamic_cast<TAction*>(Sender))->Enabled = lstAliases->SelCount > 0;
}

// ---------------------------------------------------------------------------
void __fastcall TfrmAdminTool::cbStatsExit(TObject *Sender) {
	sgStats->Cells[OPTION_VALUE_COL][0] = cbStats->Text;
}
// ---------------------------------------------------------------------------

void __fastcall TfrmAdminTool::lstAliasesSelectItem(TObject *Sender,
	TListItem *Item, bool Selected) {
	edtAlias->Text = Item->Caption;
	edtPath->Text = Item->SubItems[0].ToString();
}
// ---------------------------------------------------------------------------

