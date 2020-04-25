unit uProposal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw,
  Data.Bind.Controls, Vcl.Buttons, Vcl.Bind.Navigator, Vcl.Grids, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXPanels;

type
  TProposalForm = class(TForm)
    WebBrowser: TWebBrowser;
    NavPanel: TPanel;
    CompleteButton: TButton;
    CloseButton: TButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure CompleteButtonClick(Sender: TObject);
  private
    { Private declarations }
    FLeadId: Integer;
    procedure LoadDocument(const ADocument: String);
  public
    { Public declarations }
    procedure LoadProposal(ALeadId: Integer; const ADocument: String);
  end;

var
  ProposalForm: TProposalForm;

implementation

{$R *.dfm}

uses
  uDataMod;

procedure TProposalForm.CompleteButtonClick(Sender: TObject);
begin
  DM.CompleteProposal(FLeadId);
  Close;
end;

procedure TProposalForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TProposalForm.LoadProposal(ALeadId: Integer; const ADocument: String);
begin
  FLeadId := ALeadId;
  LoadDocument(ADocument);
end;

procedure TProposalForm.LoadDocument(const ADocument: String);
var
  LDoc: Variant;
begin
  if not Assigned(WebBrowser.Document) then
    WebBrowser.Navigate('about:blank');

  LDoc := WebBrowser.Document;
  LDoc.Clear;
  LDoc.Write(ADocument);
  LDoc.Close;
end;

end.
