unit uDraftProposal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Controls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.Grids, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPanels, Data.Bind.Components, Data.Bind.DBScope, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Grid, Vcl.OleCtrls, SHDocVw, System.NetEncoding,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.VirtualImage;

type
  TDraftProposalForm = class(TForm)
    StackPanel1: TStackPanel;
    RelativePanel1: TRelativePanel;
    LineItemsStringGrid: TStringGrid;
    BindNavigator1: TBindNavigator;
    BindSourceDBProposal: TBindSourceDB;
    BindSourceDBLineItems: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Panel1: TPanel;
    PreviewButton: TButton;
    CancelButton: TButton;
    TotalEdit: TEdit;
    Total: TLabel;
    Panel2: TPanel;
    PhoneEdit: TEdit;
    Panel3: TPanel;
    Address2Edit: TEdit;
    Panel4: TPanel;
    Address1Edit: TEdit;
    Panel5: TPanel;
    CompanyEdit: TEdit;
    DraftHeaderPanel: TPanel;
    Label11: TLabel;
    Label1: TLabel;
    DateEdit: TEdit;
    RelativePanel2: TRelativePanel;
    Panel6: TPanel;
    DraftCardPanel: TCardPanel;
    DraftCard: TCard;
    PreviewCard: TCard;
    WebBrowser1: TWebBrowser;
    PreviewHeaderPanel: TPanel;
    Label2: TLabel;
    NavPanel: TPanel;
    SaveProposalButton: TButton;
    BackButton: TButton;
    BindSourceDBDraftProposal: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    ProposalCSSMemo: TMemo;
    ReportMemo: TMemo;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    BindSourceDBProposalQuery: TBindSourceDB;
    procedure PreviewButtonClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure PreviewCardClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure BindSourceDBLineItemsSubDataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure SaveProposalButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddReportLine(const S: String; AStrings: TStrings);
    procedure AddReportHeaderLine(const S1, S2: String; AStrings: TStrings);
    procedure AddReportFooterLine(const S1: String; AStrings: TStrings);
    procedure AddReportSubHeader(const S1: String; Astrings: Tstrings);
    procedure AddReportSubHeaderInfo(const S1, S2, S3, S4: String; Astrings: Tstrings);
    procedure AddInvoiceSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
    procedure AddInvoiceData(AName, APrice, AQuantity: String; AStrings: TStrings);
    function GenerateReport(ADataSet, ALineItemsDataSet: TDataSet): String;
  public
    { Public declarations }
    FLeadId: Integer;
    procedure NewDraft(ALeadId: Integer; const ACompanyName: String);
  end;
  const
    EmptyLBRow = '<tr class="row header ltblue"><td>&nbsp;</td><td><h3>&nbsp;</h3></td></tr>';
    TableTRStart = '<tr class="row header ltblue"><td><b>';
    TableTDMid = '</b></td><td>';
    TableTREnd = '</td></tr>';
    TableTR2Start = '<tr class="row"><td colspan="2"><b>';
    TableTR2End = '</b></td></tr>';
    InvoiceTStart = '<tr class="row"><td colspan="2"><table width="100%" align="center" cellspacing="0" cellpadding="10" border="0">';
    InvoiceTHStart = '<tr class="row"><th><b>';
    InvoiceTHMid = '</b></th><th><b>';
    InvoiceTHEnd = '</b></th></tr>';
    InvoiceTRStart = '<tr class="row" align="center"><td>';
    InvoiceTRMid = '</td><td>';
    InvoiceTREnd = '</td></tr>';
    InvoiceTEnd = '</table></td></tr>';
var
  DraftProposalForm: TDraftProposalForm;

implementation

{$R *.dfm}

uses
  uMainForm, uDataMod;

procedure TDraftProposalForm.NewDraft(ALeadId: Integer; const ACompanyName: String);
begin
  DM.LineItemsFDMemTable.EmptyDataSet;
  DM.DraftProposalFDMemTable.EmptyDataSet;
  FLeadId := ALeadId;
  DateEdit.Text := FormatDateTime('ddddd', Now);
  TLinkObservers.ControlChanged(DateEdit);
  CompanyEdit.Text := ACompanyName;
  TLinkObservers.ControlChanged(CompanyEdit);
end;

procedure TDraftProposalForm.BindSourceDBLineItemsSubDataSourceDataChange(
  Sender: TObject; Field: TField);
begin
  if DraftProposalForm.Visible then
  begin
    DM.LineItemsTotalQuery.Open;
    if DM.LineItemsTotalQuery.FindField('Total')<>nil then
      TotalEdit.Text := CurrToStr(DM.LineItemsTotalQuery.FieldByName('Total').AsCurrency);
      TLinkObservers.ControlChanged(TotalEdit);
    DM.LineItemsTotalQuery.Close;
  end;
end;

procedure TDraftProposalForm.PreviewButtonClick(Sender: TObject);
var
  LDoc: Variant;
begin
  DraftCardPanel.NextCard;

  ReportMemo.Lines.Text := GenerateReport(BindSourceDBDraftProposal.DataSet, BindSourceDBLineItems.DataSet);

  if not Assigned(WebBrowser1.Document) then
    WebBrowser1.Navigate('about:blank');

  LDoc := WebBrowser1.Document;
  LDoc.Clear;
  LDoc.Write(ReportMemo.Lines.Text);
  LDoc.Close;
end;


procedure TDraftProposalForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TDraftProposalForm.BackButtonClick(Sender: TObject);
begin
  DraftCardPanel.PreviousCard;
end;

function TDraftProposalForm.GenerateReport(ADataSet, ALineItemsDataSet: TDataSet): String;
var
  LReport: TStringList;
begin
  LReport := TStringList.Create;
  try

     AddReportLine('<!DOCTYPE html>',LReport);
     AddReportLine('<html lang="en"><head>',LReport);
     AddReportLine('<meta name="viewport" content="width=device-width; initial-scale=1" />',LReport);
     AddReportLine(ProposalCSSMemo.Lines.Text,LReport);
     AddReportLine('</head><body><table width="100%" align="center" cellspacing="0" cellpadding="10" border="0">',LReport);
     AddReportHeaderLine(TNetEncoding.HTML.Encode('My Company'), TNetEncoding.HTML.Encode('Invoice'),LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportSubHeader(TNetEncoding.HTML.Encode(ADataSet.FieldByName('Date').AsString),LReport);
     AddReportSubHeaderInfo(TNetEncoding.HTML.Encode(ADataSet.FieldByName('CompanyName').AsString),
                            TNetEncoding.HTML.Encode(ADataSet.FieldByName('Address1').AsString),
                            TNetEncoding.HTML.Encode(ADataSet.FieldByName('Address2').AsString),
                            TNetEncoding.HTML.Encode(ADataSet.FieldByName('Phone').AsString),LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddInvoiceSection(ALineItemsDataset, LReport);
     LReport.Append(TableTRStart + '</b></td><td align="right">'  + '<h2>Total</h2>' + TableTREnd);
     LReport.Append(TableTRStart + '</b></td><td align="right">$' + TotalEdit.Text + TableTREnd);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportLine(EmptyLBRow, LReport);
     AddReportFooterLine('Thank you for your business!&nbsp;',LReport);
     LReport.Append('</table></body></html>');
     Result := LReport.Text;

  finally
    LReport.Free;
  end;
end;

 procedure TDraftProposalForm.PreviewCardClick(Sender: TObject);
begin
  DraftCardPanel.PreviousCard;
end;

procedure TDraftProposalForm.SaveProposalButtonClick(Sender: TObject);
var
LReportStream: TStringStream;
begin
  BindSourceDBProposal.DataSet.Append;
  BindSourceDBProposal.DataSet.Edit;
  BindSourceDBProposal.DataSet.FieldByName('LeadId').AsInteger := FLeadId;
  BindSourceDBProposal.DataSet.FieldByName('ProposalName').AsString := 'New Proposal';
  BindSourceDBProposal.DataSet.FieldByName('Status').AsString := 'New';
  BindSourceDBProposal.DataSet.FieldByName('Value').AsCurrency := BindSourceDBDraftProposal.DataSet.FieldByName('Total').AsCurrency;
  LReportStream := TStringStream.Create;
  try
    LReportStream.WriteString(ReportMemo.Lines.Text);
    LReportStream.Position := 0;
    TBlobField(BindSourceDBProposal.DataSet.FieldByName('Proposal')).LoadFromStream(LReportStream);
  finally
    LReportStream.Free;
  end;
  BindSourceDBProposal.DataSet.FieldByName('DateCreated').AsDateTime := Now;
  BindSourceDBProposal.DataSet.FieldByName('User').AsString := MainForm.UsernameComboBox.Text;
  BindSourceDBProposal.DataSet.Post;
  BindSourceDBProposalQuery.DataSet.Refresh;
  BindSourceDBProposalQuery.DataSet.Locate('LeadId',VarArrayOf([FLeadId]),[]);
  DraftCardPanel.PreviousCard;
  Close;
end;

procedure TDraftProposalForm.AddReportLine(const S: String; AStrings: TStrings);
begin
  AStrings.Append(S);
end;

procedure TDraftProposalForm.AddReportHeaderLine(const S1, S2: String; AStrings: TStrings);
begin
  AStrings.Append('<tr class="row header blue"><td><h3><p class="bg-primary">' + S1 + '</p></h3></td>'
                  + '<td align="right"><h3><p class="bg-primary">' + S2 + '</p></h3></td></tr>');
end;

procedure TDraftProposalForm.AddReportSubHeader(const S1: String; AStrings: TStrings);
begin
  AStrings.Append('<tr class="row header blue"><td align="left"><p class="bg-info"><b>Bill To</b></p></td><td align="right">'
                  + '<p class="bg-info"><b>Date: ' + S1 + '</b></p></td></tr>');
end;

procedure TDraftProposalForm.AddReportSubHeaderInfo(const S1, S2, S3, S4: String; AStrings: TStrings);
begin
  AStrings.Append('<tr class="row header ltblue"><td align="left"><h4>'
                    +'<p class="bg-info">'+ S1 +'</p>'
                    +'<p class="bg-info">'+ S2 +'</p>'
                    +'<p class="bg-info">'+ S3 +'</p>'
                    +'<p class="bg-info">'+ S4 +'</p>'
                    +'</h4></td><td></td></tr>');
end;

procedure TDraftProposalForm.AddReportFooterLine(const S1: String; AStrings: TStrings);
begin
  AStrings.Append('<tr class="row header blue"><td colspan="2"><h3><p class="bg-primary" align="center">' + S1 + '</p></h3></td></tr>');
end;

procedure TDraftProposalForm.AddInvoiceSection(ALineItemsDataSet: TDataSet; AStrings: TStrings);
begin
  AddReportLine(InvoiceTStart + InvoiceTHStart + 'Name' + InvoiceTHMid + 'Quantity' + InvoiceTHMid + 'Price' + InvoiceTHEnd, AStrings);
  ALineItemsDataSet.First;
  while not ALineItemsDataSet.EOF do
   begin
     AddInvoiceData(ALineItemsDataSet.FieldByName('Title').AsString,
                    ALineItemsDataSet.FieldByName('Quantity').AsString,
                    ALineItemsDataSet.FieldByName('Price').AsString, AStrings);
     ALineItemsDataSet.Next;
   end;
  AddReportLine(InvoiceTEnd, AStrings);
end;

procedure TDraftProposalForm.AddInvoiceData(AName, APrice, AQuantity: String; AStrings: TStrings);
begin
  AddReportLine(InvoiceTRStart + AName + InvoiceTRMid + APrice + InvoiceTRMid + AQuantity + InvoiceTREnd, AStrings);
end;

end.
