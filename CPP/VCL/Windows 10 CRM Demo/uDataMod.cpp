//---------------------------------------------------------------------------


#pragma hdrstop

#include "uDataMod.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TDM *DM;
//---------------------------------------------------------------------------
__fastcall TDM::TDM(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TDM::InitializeTable( TFDTable *ATable, TFDMemTable *AMemTable )
{
  ATable->FieldDefs->Clear();
  ATable->FieldDefs->Assign( AMemTable->FieldDefs );
  ATable->CreateTable( false );
  ATable->CopyDataSet( AMemTable, TFDCopyDataSetOptions() << coStructure << coRestart << coAppend );
}


void __fastcall TDM::InitializeDatabase( )
{
  FDConnection1->Params->Values[L"Database"] = TPath::Combine( TPath::GetDocumentsPath(), DB_FILENAME );
  LeadsFDTable->TableName = DB_LEADSTABLE;
  AcctFDTable->TableName = DB_ACCTSTABLE;
  UsersFDTable->TableName = DB_USERSTABLE;
  DocsFDTable->TableName = DB_DOCSTABLE;
  ProposalsFDTable->TableName = DB_PROPOSALSTABLE;
  if ( TFile::Exists( FDConnection1->Params->Values[L"Database"] ) == true )
  {
	FDSQLiteSecurity1->Database = FDConnection1->Params->Values[L"Database"];
  }
  else
  {
	FDConnection1->Open();
	try
	{
	  InitializeTable( DocsFDTable, DocsFDMemTable );
	  InitializeTable( LeadsFDTable, LeadsFDMemTable );
	  InitializeTable( AcctFDTable, AcctFDMemTable );
	  InitializeTable( UsersFDTable, UsersFDMemTable );
	  InitializeTable( ProposalsFDTable, ProposalFDMemTable );
	}
	__finally
	{
	  FDConnection1->Close();
	}
	FDSQLiteSecurity1->Database = FDConnection1->Params->Values[L"Database"];
	FDSQLiteSecurity1->Password = String( DB_ENCRYPTION ) + L":" + DB_PASSWORD;
	FDSQLiteSecurity1->SetPassword();
  }
  FDConnection1->Params->Values[L"Encrypt"] = DB_ENCRYPTION;
  FDConnection1->Params->Password = DB_PASSWORD;
  FDConnection1->Open();
  DocsFDTable->Open();
  LeadsFDTable->Open();
  AcctFDTable->Open();
  UsersFDTable->Open();
  ProposalsFDTable->Open();
  SetUser( UsersFDMemTable->FieldByName( L"Username" )->AsString );
  FDAccountsQuery->Open();
  delete LeadsFDMemTable;
  delete AcctFDMemTable;
  delete UsersFDMemTable;
  delete DocsFDMemTable;
  delete ProposalFDMemTable;
}


void __fastcall TDM::CompleteProposal( int ALeadId )
{
  DM->UpdateProposalStatus( ALeadId, L"Accepted" );
}


void __fastcall TDM::UpdateProposalStatus( int ALeadId, const String AStatus )
{
  if ( ProposalsFDTable->Locate( L"LeadId", VarArrayOf(OPENARRAY(Variant, ( ALeadId )) ), TLocateOptions() ) )
  {
	ProposalsFDTable->Edit();
    ProposalsFDTable->FieldByName( L"Status" )->AsString = AStatus;
    if ( AStatus == L"Accepted" )
	  ProposalsFDTable->FieldByName( L"DateCompleted" )->AsDateTime = Now();
	ProposalsFDTable->Post();
	FDProposalsQuery->Close();
	FDProposalsQuery->Open();
	FDProposalsQuery->Locate( L"ProposalId", VarArrayOf(OPENARRAY(Variant, ( ProposalsFDTable->FieldByName( L"ProposalId" )->AsInteger ))), TLocateOptions() );
  }
}


void __fastcall TDM::SetUserQuery( const String AUsername, TFDQuery *AQuery )
{
  AQuery->Close();
  AQuery->ParamByName( L"Username" )->AsString = AUsername;
  AQuery->Open();
}


void __fastcall TDM::SetUser( const String AUsername )
{
  SetUserQuery( AUsername, FDEmailsQuery );
  SetUserQuery( AUsername, FDLeadsQueryAll );
  SetUserQuery( AUsername, FDLeadsQueryNew );
  SetUserQuery( AUsername, FDProposalsQuery );
  SetUserQuery( AUsername, FDDocsQuery );
  SetUserQuery( AUsername, FDLeadsQueryActive );
  SetUserQuery( AUsername, FDLeadsQueryProposalSent );
  SetUserQuery( AUsername, FDLeadsQueryClosed );
  SetUserQuery( AUsername, FDQueryNewTotal );
  SetUserQuery( AUsername, FDQueryActiveTotal );
  SetUserQuery( AUsername, FDQueryProposalTotal );
  SetUserQuery( AUsername, FDQueryClosedTotal );
  SetUserQuery( AUsername, FDQueryTotal );
  SetUserQuery( AUsername, FDQueryInactiveTotal );
}


void __fastcall TDM::LeadsFDTableAfterScroll( TDataSet *DataSet )
{
  FDDocsQuery->Close();
  FDDocsQuery->ParamByName( L"LeadId" )->AsInteger = LeadsFDTable->FieldByName( L"LeadId" )->AsInteger;
  FDDocsQuery->Open();
}


void __fastcall TDM::ExportEmails( const String AFilename )
{
  FDBatchMoveTextWriter1->FileName = AFilename;
  FDBatchMove1->Execute();
}


void __fastcall TDM::SearchQuery( const String ASQL, TFDQuery *AQuery )
{
  AQuery->Close();
  AQuery->MacroByName( L"Where" )->AsRaw = ASQL;
  AQuery->Open();
}


void __fastcall TDM::FDLeadsQueryNewAfterScroll( TDataSet *DataSet )
{
  LeadsFDTable->Locate( L"LeadId", VarArrayOf(OPENARRAY(Variant, ( DataSet->FieldByName( L"LeadId" )->AsInteger ))), TLocateOptions() );
}


void __fastcall TDM::SearchAccounts( const String ASearch )
{
  SearchQuery( (!ASearch.IsEmpty() ? L"UPPER(AccountName) LIKE '%" + UpperCase( ASearch ) + L"%'" : L"" ), FDAccountsQuery );
}


void __fastcall TDM::SearchLeadsSubQuery( const String ASearch, TFDQuery *AQuery )
{
  SearchQuery( (!ASearch.IsEmpty() ? L"AND UPPER(Name) LIKE '%" + UpperCase( ASearch ) + L"%' OR UPPER(AccountName) LIKE '%" + UpperCase( ASearch ) + L"%' OR UPPER(OfficePhone) LIKE '%" + UpperCase( ASearch ) + L"%' OR UPPER(Email) LIKE '%" + UpperCase( ASearch ) + L"%'" : L""), AQuery );
}


void __fastcall TDM::SearchLeads( const String ASearch )
{
  SearchLeadsSubQuery( ASearch, FDLeadsQueryNew );
  SearchLeadsSubQuery( ASearch, FDLeadsQueryActive );
  SearchLeadsSubQuery( ASearch, FDLeadsQueryProposalSent );
  SearchLeadsSubQuery( ASearch, FDLeadsQueryClosed );
}


void __fastcall TDM::SearchProposals( const String ASearch )
{
  SearchQuery( (!ASearch.IsEmpty() ? L"AND UPPER(ProposalName) LIKE '%" + UpperCase( ASearch ) + L"%'" : L""), FDProposalsQuery );
}


void __fastcall TDM::SearchEmails( const String ASearch )
{
  SearchQuery( (!ASearch.IsEmpty() ? L"AND UPPER(Email) LIKE '%" + UpperCase( ASearch ) + L"%'" : L"" ), FDEmailsQuery );
}
