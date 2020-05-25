//---------------------------------------------------------------------------

#ifndef uDraftProposalH
#define uDraftProposalH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.Controls.hpp>
#include <Data.Bind.DBScope.hpp>
#include <Data.Bind.EngExt.hpp>
#include <Data.Bind.Grid.hpp>
#include <Data.DB.hpp>
#include <SHDocVw.hpp>
#include <System.Bindings.Outputs.hpp>
#include <System.Rtti.hpp>
#include <Vcl.Bind.DBEngExt.hpp>
#include <Vcl.Bind.Editors.hpp>
#include <Vcl.Bind.Grid.hpp>
#include <Vcl.Bind.Navigator.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.OleCtrls.hpp>
#include <Vcl.VirtualImage.hpp>
#include <Vcl.WinXCtrls.hpp>
#include <Vcl.WinXPanels.hpp>
#include <System.SysUtils.hpp>
#include <System.NetEncoding.hpp>
#include <mshtml.h>
//---------------------------------------------------------------------------
class TDraftProposalForm : public TForm
{
__published:	// IDE-managed Components
	TCardPanel *DraftCardPanel;
	TCard *DraftCard;
	TPanel *DraftHeaderPanel;
	TLabel *Label11;
	TVirtualImage *VirtualImage1;
	TRelativePanel *RelativePanel1;
	TStringGrid *LineItemsStringGrid;
	TBindNavigator *BindNavigator1;
	TRelativePanel *RelativePanel2;
	TPanel *Panel1;
	TLabel *Total;
	TEdit *TotalEdit;
	TPanel *Panel6;
	TButton *PreviewButton;
	TButton *CancelButton;
	TStackPanel *StackPanel1;
	TPanel *Panel5;
	TLabel *Label1;
	TEdit *CompanyEdit;
	TPanel *Panel4;
	TEdit *Address1Edit;
	TEdit *DateEdit;
	TPanel *Panel3;
	TEdit *Address2Edit;
	TPanel *Panel2;
	TEdit *PhoneEdit;
	TMemo *ProposalCSSMemo;
	TCard *PreviewCard;
	TWebBrowser *WebBrowser1;
	TPanel *PreviewHeaderPanel;
	TLabel *Label2;
	TVirtualImage *VirtualImage2;
	TMemo *ReportMemo;
	TPanel *NavPanel;
	TButton *SaveProposalButton;
	TButton *BackButton;
	TBindSourceDB *BindSourceDBProposal;
	TBindSourceDB *BindSourceDBLineItems;
	TBindingsList *BindingsList1;
	TLinkGridToDataSource *LinkGridToDataSourceBindSourceDB2;
	TLinkControlToField *LinkControlToField1;
	TLinkControlToField *LinkControlToField2;
	TLinkControlToField *LinkControlToField3;
	TLinkControlToField *LinkControlToField4;
	TLinkControlToField *LinkControlToField5;
	TLinkControlToField *LinkControlToField6;
	TBindSourceDB *BindSourceDBDraftProposal;
	TBindSourceDB *BindSourceDBProposalQuery;
	void __fastcall PreviewButtonClick( TObject* Sender );
	void __fastcall BackButtonClick( TObject* Sender );
	void __fastcall PreviewCardClick( TObject* Sender );
	void __fastcall CancelButtonClick( TObject* Sender );
	void __fastcall BindSourceDBLineItemsSubDataSourceDataChange( TObject* Sender, TField *Field );
	void __fastcall SaveProposalButtonClick( TObject* Sender );
private:	// User declarations
	void __fastcall AddReportLine( const String S, System::Classes::TStrings* const AStrings );
	void __fastcall AddReportHeaderLine( const String S1, const String S2, System::Classes::TStrings* const AStrings );
	void __fastcall AddReportFooterLine( const String S1, System::Classes::TStrings* const AStrings );
	void __fastcall AddReportSubHeader( const String S1, System::Classes::TStrings* const AStrings );
	void __fastcall AddReportSubHeaderInfo( const String S1, const String S2, const String S3, const String S4, System::Classes::TStrings* const AStrings );
	void __fastcall AddReportSubHeaderLine( const String S, System::Classes::TStrings* const AStrings );
	void __fastcall AddReportHorzRow( const String AName, const String AValue, System::Classes::TStrings* const AStrings );
	void __fastcall AddReportVertRow( const String AName, const String AValue, System::Classes::TStrings* const AStrings );
	void __fastcall AddInvoiceSection( TDataSet *ALineItemsDataSet, System::Classes::TStrings* const AStrings );
	void __fastcall AddInvoiceData( String AName, String APrice, String AQuantity, System::Classes::TStrings* const AStrings );
	String __fastcall GenerateReport( TDataSet *ADataSet, TDataSet *ALineItemsDataSet );
public:		// User declarations
	int FLeadId;
	void __fastcall NewDraft( int ALeadId, const String ACompanyName );
	__fastcall TDraftProposalForm(TComponent* Owner);
};

const wchar_t EmptyLBRow[] = L"<tr class=\"row header ltblue\"><td>&nbsp;</td><td><h3>&nbsp;</h3></td></tr>";
const wchar_t TableTRStart[] = L"<tr class=\"row header ltblue\"><td><b>";
const wchar_t TableTDMid[] = L"</b></td><td>";
const wchar_t TableTREnd[] = L"</td></tr>";
const wchar_t TableTR2Start[] = L"<tr class=\"row\"><td colspan=\"2\"><b>";
const wchar_t TableTR2End[] = L"</b></td></tr>";
const wchar_t InvoiceTStart[] = L"<tr class=\"row\"><td colspan=\"2\"><table width=\"100%\" align=\"center\" cellspacing=\"0\" cellpadding=\"10\" border=\"0\">";
const wchar_t InvoiceTHStart[] = L"<tr class=\"row\"><th><b>";
const wchar_t InvoiceTHMid[] = L"</b></th><th><b>";
const wchar_t InvoiceTHEnd[] = L"</b></th></tr>";
const wchar_t InvoiceTRStart[] = L"<tr class=\"row\" align=\"center\"><td>";
const wchar_t InvoiceTRMid[] = L"</td><td>";
const wchar_t InvoiceTREnd[] = L"</td></tr>";
const wchar_t InvoiceTEnd[] = L"</table></td></tr>";
//---------------------------------------------------------------------------
extern PACKAGE TDraftProposalForm *DraftProposalForm;
//---------------------------------------------------------------------------
#endif
