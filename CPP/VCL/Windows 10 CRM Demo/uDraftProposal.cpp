//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "uDraftProposal.h"
#include "uMainForm.h"
#include "uDataMod.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDraftProposalForm *DraftProposalForm;
//---------------------------------------------------------------------------
__fastcall TDraftProposalForm::TDraftProposalForm(TComponent* Owner)
	: TForm(Owner)
{
}

void __fastcall TDraftProposalForm::NewDraft( int ALeadId, const String ACompanyName )
{
	DM->LineItemsFDMemTable->EmptyDataSet();
	DM->DraftProposalFDMemTable->EmptyDataSet();
	FLeadId = ALeadId;
	DateEdit->Text = FormatDateTime( "ddddd", Now() );
	TLinkObservers::ControlChanged( DateEdit );
	CompanyEdit->Text = ACompanyName;
	TLinkObservers::ControlChanged( CompanyEdit );
}


void __fastcall TDraftProposalForm::BindSourceDBLineItemsSubDataSourceDataChange( TObject* Sender, TField *Field )
{
	if (DraftProposalForm->Visible) {
		DM->LineItemsTotalQuery->Open();
		if ( DM->LineItemsTotalQuery->FindField( L"Total" ) != NULL )
			TotalEdit->Text = CurrToStr( DM->LineItemsTotalQuery->FieldByName( L"Total" )->AsCurrency );
		TLinkObservers::ControlChanged( TotalEdit );
		DM->LineItemsTotalQuery->Close();
	}
}


void __fastcall TDraftProposalForm::PreviewButtonClick( TObject* Sender )
{
	DraftCardPanel->NextCard();
	ReportMemo->Lines->Text = GenerateReport( BindSourceDBDraftProposal->DataSet, BindSourceDBLineItems->DataSet );
	if ( !( WebBrowser1->Document != NULL ) )
	WebBrowser1->Navigate( L"about:blank" );
	Variant LDoc = WebBrowser1->Document;
	LDoc.OleProcedure(L"Clear");
	LDoc.OleFunction(L"Write", &WideString(ReportMemo->Lines->Text) );
	LDoc.OleProcedure(L"Close");
}


void __fastcall TDraftProposalForm::CancelButtonClick( TObject* Sender )
{
	Close();
}


void __fastcall TDraftProposalForm::BackButtonClick( TObject* Sender )
{
	DraftCardPanel->PreviousCard();
}


String __fastcall TDraftProposalForm::GenerateReport( TDataSet *ADataSet, TDataSet *ALineItemsDataSet )
{
	String result;
	TStringList *LReport;
	LReport = new TStringList();
	try
	{
		AddReportLine( L"<!DOCTYPE html>", LReport );
		AddReportLine( L"<html lang=\"en\"><head>", LReport );
		AddReportLine( L"<meta name=\"viewport\" content=\"width=device-width; initial-scale=1\" />", LReport );
		AddReportLine( ProposalCSSMemo->Lines->Text, LReport );
		AddReportLine( L"</head><body><table width=\"100%\" align=\"center\" cellspacing=\"0\" cellpadding=\"10\" border=\"0\">", LReport );
		AddReportHeaderLine( TNetEncoding::HTML->Encode( L"My Company" ), TNetEncoding::HTML->Encode( L"Invoice" ), LReport );
		AddReportLine( EmptyLBRow, LReport );
		AddReportSubHeader( TNetEncoding::HTML->Encode( ADataSet->FieldByName( L"Date" )->AsString ), LReport );
		AddReportSubHeaderInfo( TNetEncoding::HTML->Encode( ADataSet->FieldByName( L"CompanyName" )->AsString ), TNetEncoding::HTML->Encode( ADataSet->FieldByName( L"Address1" )->AsString ), TNetEncoding::HTML->Encode( ADataSet->FieldByName( L"Address2" )->AsString ), TNetEncoding::HTML->Encode( ADataSet->FieldByName( L"Phone" )->AsString ), LReport );
		AddReportLine( EmptyLBRow, LReport );
		AddReportLine( EmptyLBRow, LReport );
		AddInvoiceSection( ALineItemsDataSet, LReport );
		LReport->Append( String( TableTRStart ) + L"</b></td><td align=\"right\">" + L"<h2>Total</h2>" + TableTREnd );
		LReport->Append( String( TableTRStart ) + L"</b></td><td align=\"right\">$" + TotalEdit->Text + TableTREnd );
		AddReportLine( EmptyLBRow, LReport );
		AddReportLine( EmptyLBRow, LReport );
		AddReportLine( EmptyLBRow, LReport );
		AddReportFooterLine( L"Thank you for your business!&nbsp;", LReport );
		LReport->Append( L"</table></body></html>" );
		result = LReport->Text;
	}
	__finally
	{
		delete LReport;
	}
	return result;
}


void __fastcall TDraftProposalForm::PreviewCardClick( TObject* Sender )
{
	DraftCardPanel->PreviousCard();
}


void __fastcall TDraftProposalForm::SaveProposalButtonClick( TObject* Sender )
{
  TStringStream *LReportStream;
  BindSourceDBProposal->DataSet->Append();
  BindSourceDBProposal->DataSet->Edit();
  BindSourceDBProposal->DataSet->FieldByName( L"LeadId" )->AsInteger = FLeadId;
  BindSourceDBProposal->DataSet->FieldByName( L"ProposalName" )->AsString = L"New Proposal";
  BindSourceDBProposal->DataSet->FieldByName( L"Status" )->AsString = L"New";
  BindSourceDBProposal->DataSet->FieldByName( L"Value" )->AsCurrency = BindSourceDBDraftProposal->DataSet->FieldByName( L"Total" )->AsCurrency;
  LReportStream = new TStringStream();
  try
  {
    LReportStream->WriteString( ReportMemo->Lines->Text );
    LReportStream->Position = 0;
	((TBlobField*)( BindSourceDBProposal->DataSet->FieldByName( L"Proposal" ) ))->LoadFromStream( LReportStream );
  }
  __finally
  {
	delete LReportStream;
  }
  BindSourceDBProposal->DataSet->FieldByName( L"DateCreated" )->AsDateTime = Now();
  BindSourceDBProposal->DataSet->FieldByName( L"User" )->AsString = MainForm->UsernameComboBox->Text;
  BindSourceDBProposal->DataSet->Post();
  BindSourceDBProposalQuery->DataSet->Refresh();
  BindSourceDBProposalQuery->DataSet->Locate( L"LeadId", VarArrayOf( OPENARRAY(Variant, ( FLeadId )) ), TLocateOptions() );
  DraftCardPanel->PreviousCard();
  Close();
}


void __fastcall TDraftProposalForm::AddReportLine( const String S, System::Classes::TStrings* const AStrings )
{
  AStrings->Append( S );
}


void __fastcall TDraftProposalForm::AddReportHeaderLine( const String S1, const String S2, System::Classes::TStrings* const AStrings )
{
  AStrings->Append( String( L"<tr class=\"row header blue\"><td><h3><p class=\"bg-primary\">" ) + S1 + L"</p></h3></td>" + L"<td align=\"right\"><h3><p class=\"bg-primary\">" + S2 + L"</p></h3></td></tr>" );
}


void __fastcall TDraftProposalForm::AddReportSubHeader( const String S1, System::Classes::TStrings* const AStrings )
{
  AStrings->Append( String( L"<tr class=\"row header blue\"><td align=\"left\"><p class=\"bg-info\"><b>Bill To</b></p></td><td align=\"right\">" ) + L"<p class=\"bg-info\"><b>Date: " + S1 + L"</b></p></td></tr>" );
}


void __fastcall TDraftProposalForm::AddReportSubHeaderInfo( const String S1, const String S2, const String S3, const String S4, System::Classes::TStrings* const AStrings )
{
  AStrings->Append( String( L"<tr class=\"row header ltblue\"><td align=\"left\"><h4>" ) + L"<p class=\"bg-info\">" + S1 + L"</p>" + L"<p class=\"bg-info\">" + S2 + L"</p>" + L"<p class=\"bg-info\">" + S3 + L"</p>" + L"<p class=\"bg-info\">"
              + S4 + L"</p>" + L"</h4></td><td></td></tr>" );
}


void __fastcall TDraftProposalForm::AddReportSubHeaderLine( const String S, System::Classes::TStrings* const AStrings )
{
  AStrings->Append( String( L"<tr class=\"row header ltblue\"><td colspan=\"2\"><h3><p class=\"bg-info\">" ) + S + L"</p></h3></td></tr>" );
}


void __fastcall TDraftProposalForm::AddReportFooterLine( const String S1, System::Classes::TStrings* const AStrings )
{
  AStrings->Append( String( L"<tr class=\"row header blue\"><td colspan=\"2\"><h3><p class=\"bg-primary\" align=\"center\">" ) + S1 + L"</p></h3></td></tr>" );
}


void __fastcall TDraftProposalForm::AddReportHorzRow( const String AName, const String AValue, System::Classes::TStrings* const AStrings )
{
  AddReportLine( String( TableTRStart ) + AName + TableTDMid + AValue + TableTREnd, AStrings );
}


void __fastcall TDraftProposalForm::AddReportVertRow( const String AName, const String AValue, System::Classes::TStrings* const AStrings )
{
  if ( !AName.IsEmpty())
    AddReportLine( String( TableTR2Start ) + AName + TableTR2End, AStrings );
  AddReportLine( String( TableTR2Start ) + AValue + TableTR2End, AStrings );
}


void __fastcall TDraftProposalForm::AddInvoiceSection( TDataSet *ALineItemsDataSet, System::Classes::TStrings* const AStrings )
{
  AddReportLine( String( InvoiceTStart ) + InvoiceTHStart + L"Name" + InvoiceTHMid + L"Quantity" + InvoiceTHMid + L"Price" + InvoiceTHEnd, AStrings );
  ALineItemsDataSet->First();
  while ( ! ALineItemsDataSet->Eof )
  {
    AddInvoiceData( ALineItemsDataSet->FieldByName( L"Title" )->AsString, ALineItemsDataSet->FieldByName( L"Quantity" )->AsString, ALineItemsDataSet->FieldByName( L"Price" )->AsString, AStrings );
	ALineItemsDataSet->Next();
  }
  AddReportLine( InvoiceTEnd, AStrings );
}


void __fastcall TDraftProposalForm::AddInvoiceData( String AName, String APrice, String AQuantity, System::Classes::TStrings* const AStrings )
{
  AddReportLine( String( InvoiceTRStart ) + AName + InvoiceTRMid + APrice + InvoiceTRMid + AQuantity + InvoiceTREnd, AStrings );
}

//---------------------------------------------------------------------------
