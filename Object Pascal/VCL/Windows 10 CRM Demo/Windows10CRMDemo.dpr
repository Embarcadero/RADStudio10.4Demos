program Windows10CRMDemo;

uses
  Vcl.Forms,
  uDataMod in 'uDataMod.pas' {DM: TDataModule},
  uMainForm in 'uMainForm.pas' {MainForm},
  uLeads in 'uLeads.pas' {LeadsForm},
  uDraftProposal in 'uDraftProposal.pas' {DraftProposalForm},
  uProposal in 'uProposal.pas' {ProposalForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDraftProposalForm, DraftProposalForm);
  Application.CreateForm(TProposalForm, ProposalForm);
  Application.CreateForm(TLeadsForm, LeadsForm);
  Application.Run;
end.
