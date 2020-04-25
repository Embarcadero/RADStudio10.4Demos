//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop


#include "uMainForm.h"
#include "uDataMod.h"
#include "uLeads.h"
#include "uDraftProposal.h"
#include "uProposal.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
	: TForm(Owner)
{

}

void __fastcall TMainForm::RefreshGrids( )
{
  LeadsBindClosedSourceDB->DataSet->Refresh();
  LeadsBindActiveSourceDB->DataSet->Refresh();
  LeadsBindNewSourceDB->DataSet->Refresh();
  LeadsBindProposalSentSourceDB->DataSet->Refresh();
}


void __fastcall TMainForm::RemoveAcctButtonClick( TObject* Sender )
{
  AcctBindSourceDB->DataSet->Delete();
}


void __fastcall TMainForm::RemoveUserButtonClick( TObject* Sender )
{
  UsersBindSourceDB->DataSet->Delete();
}


void __fastcall TMainForm::AcctSearchBoxKeyPress(TObject *Sender, System::WideChar &Key)
{
  DM->SearchAccounts( AcctSearchBox->Text );
}


void __fastcall TMainForm::CalendarView1DrawDayItem(TObject *Sender, TDrawViewInfoParams *DrawParams,
		  TCellItemViewInfo *CalendarViewViewInfo)
{
int LCurrentDay = DayOfWeek( CalendarViewViewInfo->Date );
  if ( LCurrentDay == 1 || LCurrentDay == 7 )
  {
	DrawParams->Font->Style = TFontStyles() << fsBold;
  }
}


void __fastcall TMainForm::CancelProposalButtonClick( TObject* Sender )
{
  if ( ProposalBindSourceDB->DataSet->RecordCount > 0 )
  {
    DM->UpdateProposalStatus( ProposalBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger, L"Canceled" );
  }
}


void __fastcall TMainForm::PageControlChange( TObject* Sender )
{
  if ( PageControl->ActivePageIndex == 0 )
  {
	DM->FDQueryNewTotal->Refresh();
	DM->FDQueryActiveTotal->Refresh();
	DM->FDQueryProposalTotal->Refresh();
	DM->FDQueryInactiveTotal->Refresh();
	DM->FDQueryClosedTotal->Refresh();
	DM->FDQueryTotal->Refresh();
  }
  switch ( PageControl->ActivePageIndex )
  {
    case 0:
	  DashboardButton->SetFocus();
    break;
    case 1:
	  AcctsButton->SetFocus();
    break;
    case 2:
	  LeadsButton->SetFocus();
    break;
    case 3:
	  SalesButton->SetFocus();
    break;
    case 4:
	  MarketingButton->SetFocus();
	  EmailsBindSourceDB->DataSet->Refresh();
    break;
    case 5:
	  CalendarButton->SetFocus();
    break;
    case 6:
	  UsersButton->SetFocus();
    break;
  }
}


void __fastcall TMainForm::SalesSearchBoxKeyPress(TObject *Sender, System::WideChar &Key)
{
  DM->SearchProposals( SalesSearchBox->Text );
}


void __fastcall TMainForm::SplitViewClosing( TObject* Sender )
{
  DashboardButton->Caption = L"";
  AcctsButton->Caption = L"";
  LeadsButton->Caption = L"";
  SalesButton->Caption = L"";
  MarketingButton->Caption = L"";
  CalendarButton->Caption = L"";
  UsersButton->Caption = L"";
}


void __fastcall TMainForm::SplitViewOpening( TObject* Sender )
{
  DashboardButton->Caption = L"          " + DashboardButton->Hint;
  AcctsButton->Caption = L"          " + AcctsButton->Hint;
  LeadsButton->Caption = L"          " + LeadsButton->Hint;
  SalesButton->Caption = L"          " + SalesButton->Hint;
  MarketingButton->Caption = L"          " + MarketingButton->Hint;
  CalendarButton->Caption = L"          " + CalendarButton->Hint;
  UsersButton->Caption = L"          " + UsersButton->Hint;
}


void __fastcall TMainForm::AccountsTabResize( TObject* Sender )
{
  LinkGridToDataSourceAcctBindSourceDB->Columns->Items[1]->Width = AccountsSG->Width - LinkGridToDataSourceAcctBindSourceDB->Columns->Items[0]->Width;
}


void __fastcall TMainForm::UsersTabResize( TObject* Sender )
{
  LinkGridToDataSourceUsersBindSourceDB->Columns->Items[1]->Width = UsersSG->Width - LinkGridToDataSourceUsersBindSourceDB->Columns->Items[0]->Width;
}


void __fastcall TMainForm::UsernameComboBoxChange( TObject* Sender )
{
  LeadsForm->Close();
  DraftProposalForm->Close();
  ProposalForm->Close();
  DM->SetUser( UsernameComboBox->Text );
}


void __fastcall TMainForm::UsernameComboBoxKeyPress( TObject *Sender, System::WideChar &Key )
{
  Key = L'\x00';
}


void __fastcall TMainForm::UsersRelativePanelResize( TObject* Sender )
{
  if ( UsersRelativePanel->Width <= 436 )
  {
	CreateUserButton->Caption = L"";
	CreateUserButton->Width = 40;
	RemoveUserButton->Caption = L"";
	RemoveUserButton->Width = 40;
  }
  else
  {
	CreateUserButton->Caption = CreateUserButton->Hint;
	CreateUserButton->Width = 121;
	RemoveUserButton->Caption = RemoveUserButton->Hint;
	RemoveUserButton->Width = 121;
  }
}


void __fastcall TMainForm::VCLStylesCBChange( TObject* Sender )
{
  MainForm->WindowState = TWindowState::wsMaximized;
  TStyleManager::TrySetStyle( VCLStylesCB->Text );
  UpdateNavButtons();
}


void __fastcall TMainForm::VCLStylesCBKeyPress(TObject *Sender, System::WideChar &Key)
{
  Key = L'\x00';
}


void __fastcall TMainForm::ViewLeadButtonClick( TObject* Sender )
{
  LeadsForm->Show();
}


void __fastcall TMainForm::MenuVirtualImageClick( TObject* Sender )
{
  SplitView->Opened = !SplitView->Opened;
}


void __fastcall TMainForm::AcctsRelativePanelResize( TObject* Sender )
{
  if ( AcctsRelativePanel->Width <= 634 )
  {
    ExportAcctsButton->Caption = L"";
    ExportAcctsButton->Width = 40;
    CreateAcctButton->Caption = L"";
    CreateAcctButton->Width = 40;
    RemoveAcctButton->Caption = L"";
    RemoveAcctButton->Width = 40;
  }
  else
  {
    ExportAcctsButton->Caption = ExportAcctsButton->Hint;
    ExportAcctsButton->Width = 112;
    CreateAcctButton->Caption = CreateAcctButton->Hint;
    CreateAcctButton->Width = 112;
    RemoveAcctButton->Caption = RemoveAcctButton->Hint;
    RemoveAcctButton->Width = 112;
  }
}

void __fastcall TMainForm::ActiveLeadsSGEnter( TObject* Sender )
{
  LeadsForm->LocateLead( LeadsBindActiveSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger );
  BindNavigator1->DataSource = LeadsBindActiveSourceDB;
}


void __fastcall TMainForm::ProposalSentLeadsSGEnter( TObject* Sender )
{
  LeadsForm->LocateLead( LeadsBindProposalSentSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger );
  BindNavigator1->DataSource = LeadsBindProposalSentSourceDB;
}


void __fastcall TMainForm::ProposalsRelativePanelResize( TObject* Sender )
{
  if ( ProposalsRelativePanel->Width <= 436 )
  {
    CompleteProposalButton->Caption = L"";
    CompleteProposalButton->Width = 40;
    CancelProposalButton->Caption = L"";
    CancelProposalButton->Width = 40;
  }
  else
  {
    CompleteProposalButton->Caption = CompleteProposalButton->Hint;
    CompleteProposalButton->Width = 121;
    CancelProposalButton->Caption = CancelProposalButton->Hint;
    CancelProposalButton->Width = 121;
  }
}


void __fastcall TMainForm::ClosedLeadsSGEnter( TObject* Sender )
{
  LeadsForm->LocateLead( LeadsBindClosedSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger );
  BindNavigator1->DataSource = LeadsBindClosedSourceDB;
}


void __fastcall TMainForm::CompleteProposalButtonClick( TObject* Sender )
{
  if ( ProposalBindSourceDB->DataSet->RecordCount > 0 )
  {
    DM->UpdateProposalStatus( ProposalBindSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger, L"Accepted" );
	ProposalBindSourceDB->DataSet->Refresh();
  }
}


void __fastcall TMainForm::CreateAcctButtonClick( TObject* Sender )
{
  String LNewAccount;
  LNewAccount = InputBox( "Create New Account", L"Account Name", L"New Account" );
  AcctBindSourceDB->DataSet->DisableControls();
  AcctBindSourceDB->DataSet->AppendRecord( ARRAYOFCONST(( 0, LNewAccount )) );
  AcctBindSourceDB->DataSet->EnableControls();
  LinkGridToDataSourceAcctBindSourceDB->Active = false;
  LinkGridToDataSourceAcctBindSourceDB->Active = true;
}


void __fastcall TMainForm::CreateLeadButtonClick( TObject* Sender )
{
  LeadsBindNewSourceDB->DataSet->Append();
  LeadsBindNewSourceDB->DataSet->FieldByName( L"LeadId" )->AsString = L"";
  LeadsBindNewSourceDB->DataSet->FieldByName( L"Status" )->AsString = L"New";
  LeadsBindNewSourceDB->DataSet->FieldByName( L"Name" )->AsString = L"First Last";
  LeadsBindNewSourceDB->DataSet->FieldByName( L"User" )->AsString = UsernameComboBox->Text;
  LeadsBindNewSourceDB->DataSet->FieldByName( L"DateCreated" )->AsDateTime = Now();
  LeadsBindNewSourceDB->DataSet->Post();
  LeadsBindSourceDB->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LeadsBindNewSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger )) ), TLocateOptions() );
  BindNavigator1->DataSource = LeadsBindNewSourceDB;
  LeadsForm->Show();
}


void __fastcall TMainForm::CreateUserButtonClick( TObject* Sender )
{
  String LNewUser = InputBox( "Create New User", L"User Name", L"user" );
  String LExistingUser = UsersBindSourceDB->DataSet->Lookup( L"Username", LNewUser, L"Username" );
  if ( LExistingUser != LNewUser )
  {
	UsersBindSourceDB->DataSet->Append();
	UsersBindSourceDB->DataSet->FieldByName( L"UserId" )->AsInteger = 0;
	UsersBindSourceDB->DataSet->FieldByName( L"Username" )->AsString = LNewUser;
	UsersBindSourceDB->DataSet->Post();
	DM->UsersFDTable->Refresh();
  }
  else
  {
	ShowMessage( "A user with that username already exists->" );
  }
}


void __fastcall TMainForm::DashboardButtonClick( TObject* Sender )
{
  PageControl->ActivePageIndex = ((TButton*)( Sender ))->Tag;
}


void __fastcall TMainForm::LeadsRelativePanelResize( TObject* Sender )
{
  if ( LeadsRelativePanel->Width <= 781 )
  {
    ExportLeadsButton->Caption = L"";
    ExportLeadsButton->Width = 40;
    CreateLeadButton->Caption = L"";
    CreateLeadButton->Width = 40;
    ViewLeadButton->Caption = L"";
    ViewLeadButton->Width = 40;
  }
  else
  {
    ExportLeadsButton->Caption = ExportLeadsButton->Hint;
    ExportLeadsButton->Width = 153;
    CreateLeadButton->Caption = CreateLeadButton->Hint;
    CreateLeadButton->Width = 153;
    ViewLeadButton->Caption = ViewLeadButton->Hint;
    ViewLeadButton->Width = 153;
  }
}


void __fastcall TMainForm::LeadsSearchBoxKeyPress( TObject* Sender, Char& Key )
{
  DM->SearchLeads( LeadsSearchBox->Text );
}


void __fastcall TMainForm::MarketingRelativePanelResize( TObject* Sender )
{
  if ( MarketingRelativePanel->Width <= 320 )
  {
    ExportEmailsButton->Caption = L"";
    ExportEmailsButton->Width = 40;
  }
  else
  {
    ExportEmailsButton->Caption = ExportEmailsButton->Hint;
    ExportEmailsButton->Width = 121;
  }
}


void __fastcall TMainForm::NewLeadsSGDblClick( TObject* Sender )
{
  ViewLeadButtonClick( Sender );
}


void __fastcall TMainForm::NewLeadsSGDragDrop( TObject* Sender, TObject* Source, int X, int Y )
{
  String LStatus;
  int LIndex = 0;
  TDataSet *LDataSet;
  String LDateField;
  LIndex = - 1;
  if ( Source == Sender )
  {
  }
  else
  {
	switch ( ((TStringGrid*)( Sender ))->Parent->Tag )
    {
      case 1:
      {
        LStatus = L"New";
		LDateField = L"DateCreated";
        LDataSet = LeadsBindNewSourceDB->DataSet;
      }
      break;
      case 2:
      {
        LStatus = L"Active";
        LDateField = L"DateContacted";
		LDataSet = LeadsBindActiveSourceDB->DataSet;
	  }
	  break;
	  case 3:
	  {
		LStatus = L"Proposal Sent";
		LDateField = L"DateDrafted";
		LDataSet = LeadsBindProposalSentSourceDB->DataSet;
	  }
	  break;
	  case 4:
	  {
		LStatus = L"Closed";
		LDateField = L"DateClosed";
		LDataSet = LeadsBindClosedSourceDB->DataSet;
	  }
	  break;
	default:
	  LDataSet = LeadsBindNewSourceDB->DataSet;
	}
	switch ( ((TStringGrid*)( Source ))->Parent->Tag )
	{
	  case 1:
	  {
		if ( LeadsBindNewSourceDB->DataSet->RecordCount > 0 )
		{
		  LIndex = LeadsBindNewSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger;
		  if ( LeadsBindSourceDB->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex )) ), TLocateOptions() ) )
		  {
			LeadsBindSourceDB->DataSet->Edit();
			LeadsBindSourceDB->DataSet->FieldByName( L"Status" )->AsString = LStatus;
			if ( (double)LeadsBindSourceDB->DataSet->FieldByName( LDateField )->AsDateTime == 0.0 )
			  LeadsBindSourceDB->DataSet->FieldByName( LDateField )->AsDateTime = Now();
			LeadsBindSourceDB->DataSet->Post();
		  }
		  LDataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex )) ), TLocateOptions() );
		}
	  }
	  break;
	  case 2:
	  {
		if ( LeadsBindActiveSourceDB->DataSet->RecordCount > 0 )
		{
		  LIndex = LeadsBindActiveSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger;
		  if ( LeadsBindSourceDB->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex ))  ), TLocateOptions() ))
		  {
			LeadsBindSourceDB->DataSet->Edit();
			LeadsBindSourceDB->DataSet->FieldByName( L"Status" )->AsString = LStatus;
			if ( (double)LeadsBindSourceDB->DataSet->FieldByName( LDateField )->AsDateTime == 0.0 )
			  LeadsBindSourceDB->DataSet->FieldByName( LDateField )->AsDateTime = Now();
			LeadsBindSourceDB->DataSet->Post();
		  }
		  LDataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex )) ), TLocateOptions() );
		}
	  }
	  break;
	  case 3:
	  {
		if ( LeadsBindProposalSentSourceDB->DataSet->RecordCount > 0 )
		{
		  LIndex = LeadsBindProposalSentSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger;
		  if ( LeadsBindSourceDB->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex )) ), TLocateOptions() ) )
		  {
			LeadsBindSourceDB->DataSet->Edit();
			LeadsBindSourceDB->DataSet->FieldByName( L"Status" )->AsString = LStatus;
			if ( (double)LeadsBindSourceDB->DataSet->FieldByName( LDateField )->AsDateTime == 0.0 )
			  LeadsBindSourceDB->DataSet->FieldByName( LDateField )->AsDateTime = Now();
			LeadsBindSourceDB->DataSet->Post();
		  }
		  LDataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex )) ), TLocateOptions() );
		}
	  }
	  break;
	  case 4:
	  {
		if ( LeadsBindClosedSourceDB->DataSet->RecordCount > 0 )
		{
		  LIndex = LeadsBindClosedSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger;
		  if ( LeadsBindSourceDB->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex )) ), TLocateOptions() ) )
		  {
			LeadsBindSourceDB->DataSet->Edit();
			LeadsBindSourceDB->DataSet->FieldByName( L"Status" )->AsString = LStatus;
			if ( (double)LeadsBindSourceDB->DataSet->FieldByName( LDateField )->AsDateTime == 0.0)
			  LeadsBindSourceDB->DataSet->FieldByName( LDateField )->AsDateTime = Now();
			LeadsBindSourceDB->DataSet->Post();
		  }
		  LDataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex )) ), TLocateOptions());
		}
	  }
	  break;
	}
	RefreshGrids();
	LDataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( LIndex )) ), TLocateOptions() );
  }
}


void __fastcall TMainForm::NewLeadsSGDragOver( TObject* Sender, TObject* Source, int X, int Y, TDragState State, bool& Accept )
{
  Accept = dynamic_cast< TStringGrid* >( Source );
}


void __fastcall TMainForm::NewLeadsSGEnter( TObject* Sender )
{
  LeadsForm->LocateLead( LeadsBindNewSourceDB->DataSet->FieldByName( L"LeadId" )->AsInteger );
  BindNavigator1->DataSource = LeadsBindNewSourceDB;
}


void __fastcall TMainForm::NewLeadsSGMouseDown( TObject* Sender, TMouseButton Button, TShiftState Shift, int X, int Y )
{
  if ( Button == mbLeft )
	((TStringGrid*)( Sender ))->BeginDrag( false, 4 );
}


void __fastcall TMainForm::EmailsSearchBoxKeyPress( TObject* Sender, Char& Key )
{
  DM->SearchEmails( EmailsSearchBox->Text );
}


void __fastcall TMainForm::ExportAcctsButtonClick( TObject* Sender )
{
  if ( ExportAcctsDialog->Execute() )
  {
    DM->AcctFDTable->SaveToFile( ExportAcctsDialog->FileName );
  }
}


void __fastcall TMainForm::ExportEmailsButtonClick( TObject* Sender )
{
  if ( SaveEmailsDialog->Execute() )
  {
    DM->ExportEmails( SaveEmailsDialog->FileName );
  }
}


void __fastcall TMainForm::ExportLeadsButtonClick( TObject* Sender )
{
  if ( ExportLeadsDialog->Execute() )
  {
    DM->LeadsFDTable->SaveToFile( ExportLeadsDialog->FileName );
  }
}


void __fastcall TMainForm::AppIdle( TObject* Sender, bool& Done )
{
  if ( ! FRanOnce )
  {
    FRanOnce = true;
	DM->InitializeDatabase();
    DashboardButton->SetFocus();
  }
}


void __fastcall TMainForm::UpdateNavButtons( )
{
  DWord LStyle = 0;
  LStyle = GetWindowLong( DashboardButton->Handle, GWL_STYLE );
  SetWindowLong( DashboardButton->Handle, GWL_STYLE, LStyle | BS_LEFT );
  DashboardButton->Caption = L"          " + DashboardButton->Hint;
  SetWindowLong( AcctsButton->Handle, GWL_STYLE, LStyle | BS_LEFT );
  AcctsButton->Caption = L"          " + AcctsButton->Hint;
  SetWindowLong( LeadsButton->Handle, GWL_STYLE, LStyle | BS_LEFT );
  LeadsButton->Caption = L"          " + LeadsButton->Hint;
  SetWindowLong( SalesButton->Handle, GWL_STYLE, LStyle | BS_LEFT );
  SalesButton->Caption = L"          " + SalesButton->Hint;
  SetWindowLong( MarketingButton->Handle, GWL_STYLE, LStyle | BS_LEFT );
  MarketingButton->Caption = L"          " + MarketingButton->Hint;
  SetWindowLong( CalendarButton->Handle, GWL_STYLE, LStyle | BS_LEFT );
  CalendarButton->Caption = L"          " + CalendarButton->Hint;
  SetWindowLong( UsersButton->Handle, GWL_STYLE, LStyle | BS_LEFT );
  UsersButton->Caption = L"          " + UsersButton->Hint;
}


void __fastcall TMainForm::FormResize( TObject* Sender )
{
  if ( MainForm->Width <= 640 )
  {
    if ( SplitView->Opened == true )
      SplitView->Opened = false;
  }
  else
  {
    if ( SplitView->Opened == false )
	  SplitView->Opened = true;
  }
}

void __fastcall TMainForm::FormCreate(TObject *Sender)
{
  String StyleName;
  Application->OnIdle = AppIdle;
  for(String StyleName: TStyleManager::StyleNames) {
	VCLStylesCB->Items->Add( StyleName );
  }

  VCLStylesCB->ItemIndex = VCLStylesCB->Items->IndexOf( TStyleManager::ActiveStyle->Name );
  UpdateNavButtons();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormActivate(TObject *Sender)
{
  if (FRanOnce)
  {
	if (LeadsBindSourceDB->DataSet->State == TDataSetState::dsEdit) {
	  LeadsBindSourceDB->DataSet->Post();
	}
	((TBindSourceDB*)(BindNavigator1->DataSource))->DataSet->Refresh();
  }
}
//---------------------------------------------------------------------------


