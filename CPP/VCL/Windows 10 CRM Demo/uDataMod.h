//---------------------------------------------------------------------------

#ifndef uDataModH
#define uDataModH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.BatchMove.DataSet.hpp>
#include <FireDAC.Comp.BatchMove.hpp>
#include <FireDAC.Comp.BatchMove.Text.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Phys.SQLite.hpp>
#include <FireDAC.Phys.SQLiteDef.hpp>
#include <FireDAC.Phys.SQLiteVDataSet.hpp>
#include <FireDAC.Phys.SQLiteWrapper.Stat.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.ExprFuncs.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.Stan.StorageBin.hpp>
#include <FireDAC.Stan.StorageJSON.hpp>
#include <FireDAC.Stan.StorageXML.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
#include <System.Ioutils.hpp>
#include <sysopen.h>
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TFDMemTable *LeadsFDMemTable;
	TFDStanStorageBinLink *FDStanStorageBinLink1;
	TFDStanStorageXMLLink *FDStanStorageXMLLink1;
	TFDStanStorageJSONLink *FDStanStorageJSONLink1;
	TFDMemTable *StatusFDMemTable;
	TFDMemTable *AcctFDMemTable;
	TFDMemTable *UsersFDMemTable;
	TFDMemTable *DocsFDMemTable;
	TFDMemTable *ProposalFDMemTable;
	TFDMemTable *ProposalStatusFDMemTable;
	TFDPhysSQLiteDriverLink *FDPhysSQLiteDriverLink1;
	TFDConnection *FDConnection1;
	TFDLocalSQL *FDLocalSQL1;
	TFDQuery *FDEmailsQuery;
	TFDBatchMove *FDBatchMove1;
	TFDBatchMoveDataSetReader *FDBatchMoveDataSetReader1;
	TFDBatchMoveTextWriter *FDBatchMoveTextWriter1;
	TFDQuery *FDAccountsQuery;
	TFDQuery *FDLeadsQueryNew;
	TFDQuery *FDProposalsQuery;
	TFDQuery *FDLeadsQueryActive;
	TFDQuery *FDLeadsQueryProposalSent;
	TFDQuery *FDLeadsQueryClosed;
	TFDMemTable *LineItemsFDMemTable;
	TFDMemTable *DraftProposalFDMemTable;
	TFDQuery *LineItemsTotalQuery;
	TFDQuery *FDQueryNewTotal;
	TFDQuery *FDQueryActiveTotal;
	TFDQuery *FDQueryProposalTotal;
	TFDQuery *FDQueryClosedTotal;
	TFDQuery *FDQueryTotal;
	TFDQuery *FDQueryInactiveTotal;
	TFDTable *LeadsFDTable;
	TFDSQLiteSecurity *FDSQLiteSecurity1;
	TFDTable *DocsFDTable;
	TFDTable *UsersFDTable;
	TFDTable *AcctFDTable;
	TFDTable *ProposalsFDTable;
	TFDQuery *FDDocsQuery;
	TFDQuery *FDLeadsQueryAll;
	void __fastcall LeadsFDTableAfterScroll(TDataSet *DataSet);
	void __fastcall FDLeadsQueryNewAfterScroll(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  void __fastcall InitializeTable( TFDTable *ATable, TFDMemTable *AMemTable );
  void __fastcall InitializeDatabase( );
  void __fastcall CompleteProposal( int ALeadId );
  void __fastcall SetUserQuery( const String AUsername, TFDQuery *AQuery );
  void __fastcall UpdateProposalStatus( int ALeadId, const String AStatus );
  void __fastcall ExportEmails( const String AFilename );
  void __fastcall SearchQuery( const String ASQL, TFDQuery *AQuery );
  void __fastcall SearchAccounts( const String ASearch );
  void __fastcall SearchLeadsSubQuery( const String ASearch, TFDQuery *AQuery );
  void __fastcall SearchLeads( const String ASearch );
  void __fastcall SearchProposals( const String ASearch );
  void __fastcall SearchEmails( const String ASearch );
  void __fastcall SetUser( const String AUsername );
	__fastcall TDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
const wchar_t DB_FILENAME[] = L"w10crmdemocpp.sdb";
const wchar_t DB_PASSWORD[] = L"SecretPassword";
const wchar_t DB_ENCRYPTION[] = L"aes-256";
const wchar_t DB_LEADSTABLE[] = L"Leads";
const wchar_t DB_ACCTSTABLE[] = L"Accounts";
const wchar_t DB_USERSTABLE[] = L"Users";
const wchar_t DB_DOCSTABLE[] = L"Docs";
const wchar_t DB_PROPOSALSTABLE[] = L"Proposals";
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
