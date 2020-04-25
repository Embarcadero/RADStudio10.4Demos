unit uLeads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.WinXPanels, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Controls,
  Vcl.Buttons, Vcl.Bind.Navigator, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Bind.Grid, Data.Bind.Grid, Vcl.Grids,
  System.UITypes, Data.DB, Vcl.Imaging.pngimage, Vcl.VirtualImage,
  System.IOUtils, Vcl.Themes;

type
  TLeadsForm = class(TForm)
    NamePanel: TPanel;
    StatusPanel: TPanel;
    AcctPanel: TPanel;
    OfficePhonePanel: TPanel;
    EmailPanel: TPanel;
    UserPanel: TPanel;
    DateCreatedPanel: TPanel;
    LeadsBindSourceDB: TBindSourceDB;
    Label2: TLabel;
    StatusComboBox: TComboBox;
    Label3: TLabel;
    NameEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    OfficePhoneEdit: TEdit;
    Label6: TLabel;
    EmailEdit: TEdit;
    Label7: TLabel;
    UserEdit: TEdit;
    Label8: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    StatusBindSourceDB: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    DocsPanel: TPanel;
    Panel9: TPanel;
    DeleteDocButton: TButton;
    AddDocButton: TButton;
    OpenDialog1: TOpenDialog;
    AccountNameComboBox: TComboBox;
    LinkFillControlToField2: TLinkFillControlToField;
    AcctBindSourceDB: TBindSourceDB;
    ScrollBox1: TScrollBox;
    DatesPanel: TPanel;
    Label9: TLabel;
    FormPanel: TPanel;
    Label10: TLabel;
    DateContactedPicker: TDateTimePicker;
    DateCreatedPicker: TDateTimePicker;
    LinkControlToField6: TLinkControlToField;
    DocsBindSourceDB: TBindSourceDB;
    NotesMemo: TMemo;
    LinkControlToField7: TLinkControlToField;
    DocStringGrid: TStringGrid;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    Button7: TButton;
    Button8: TButton;
    UsersBindSourceDB: TBindSourceDB;
    ViewDocButton: TButton;
    Panel13: TPanel;
    Label11: TLabel;
    Panel14: TPanel;
    NotesPanel: TPanel;
    LeadRelativePanel: TRelativePanel;
    CreateProposalButton: TSpeedButton;
    ViewProposalButton: TSpeedButton;
    CancelProposalButton: TSpeedButton;
    CompleteProposalButton: TSpeedButton;
    Label1: TLabel;
    DetailRelativePanel: TRelativePanel;
    DateClosedPanel: TPanel;
    Label12: TLabel;
    DateClosedPicker: TDateTimePicker;
    DateDraftedPanel: TPanel;
    Label13: TLabel;
    DateDraftedPicker: TDateTimePicker;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LeadIdPanel: TPanel;
    Label14: TLabel;
    LinkControlToField10: TLinkControlToField;
    ProposalBindSourceDB: TBindSourceDB;
    LeadIdLabel: TLabel;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    DateContactedPanel: TPanel;
    VirtualImage3: TVirtualImage;
    procedure AddDocButtonClick(Sender: TObject);
    procedure DeleteDocButtonClick(Sender: TObject);
    procedure CreateProposalButtonClick(Sender: TObject);
    procedure ViewProposalButtonClick(Sender: TObject);
    procedure DetailRelativePanelResize(Sender: TObject);
    procedure LeadRelativePanelResize(Sender: TObject);
    procedure DateContactedPickerChange(Sender: TObject);
    procedure CompleteProposalButtonClick(Sender: TObject);
    procedure CancelProposalButtonClick(Sender: TObject);
    procedure ViewDocButtonClick(Sender: TObject);
    procedure LinkControlToField6AssignedValue(Sender: TObject;
      AssignValueRec: TBindingAssignValueRec; const Value: TValue);
    procedure LinkControlToField10AssignedValue(Sender: TObject;
      AssignValueRec: TBindingAssignValueRec; const Value: TValue);
    procedure LinkControlToField8AssignedValue(Sender: TObject;
      AssignValueRec: TBindingAssignValueRec; const Value: TValue);
    procedure LinkControlToField9AssignedValue(Sender: TObject;
      AssignValueRec: TBindingAssignValueRec; const Value: TValue);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LocateLead(AIndex: Integer);
  end;

var
  LeadsForm: TLeadsForm;

implementation

{$R *.dfm}

uses
  System.Math, ShellApi, uMainForm, uDataMod, uProposal, uDraftProposal;

procedure TLeadsForm.LocateLead(AIndex: Integer);
begin
  LeadsBindSourceDB.DataSet.Locate('LeadId',VarArrayOf([AIndex]),[]);
end;

procedure TLeadsForm.DateContactedPickerChange(Sender: TObject);
begin
  if TDateTimePicker(Sender).DateTime = 0 then
    TDateTimePicker(Sender).Format := ' '
  else
    TDateTimePicker(Sender).Format := '';
end;

procedure TLeadsForm.DeleteDocButtonClick(Sender: TObject);
begin
  if DocsBindSourceDB.DataSet.RecordCount>0 then
  begin
    if MessageDlg('Delete ' + DocsBindSourceDB.DataSet.FieldByName('DocumentName')
      .AsString + '?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      DocsBindSourceDB.DataSet.Delete;
    end;
  end;
end;

procedure TLeadsForm.DetailRelativePanelResize(Sender: TObject);
begin
  if DetailRelativePanel.Width<936 then
  begin
    DetailRelativePanel.ControlCollection.Items[1].Below := FormPanel;
    DetailRelativePanel.ControlCollection.Items[1].AlignRightWithPanel := False;
    DetailRelativePanel.ControlCollection.Items[1].AlignTopWithPanel := False;
    DetailRelativePanel.ControlCollection.Items[1].AlignLeftWithPanel := True;
  end
  else
  begin
    DetailRelativePanel.ControlCollection.Items[1].Below := nil;
    DetailRelativePanel.ControlCollection.Items[1].AlignLeftWithPanel := False;
    DetailRelativePanel.ControlCollection.Items[1].AlignRightWithPanel := True;
    DetailRelativePanel.ControlCollection.Items[1].AlignTopWithPanel := True;
  end;
end;

procedure TLeadsForm.LeadRelativePanelResize(Sender: TObject);
begin
  if LeadRelativePanel.Width<=800 then
  begin
    CreateProposalButton.Caption := '';
    CreateProposalButton.Width := 40;
    ViewProposalButton.Caption := '';
    ViewProposalButton.Width := 40;
    CancelProposalButton.Caption := '';
    CancelProposalButton.Width := 40;
    CompleteProposalButton.Caption := '';
    CompleteProposalButton.Width := 40;
  end
  else
  begin
    CreateProposalButton.Caption := CreateProposalButton.Hint;
    CreateProposalButton.Width := 185;
    ViewProposalButton.Caption := ViewProposalButton.Hint;
    ViewProposalButton.Width := 185;
    CancelProposalButton.Caption := CancelProposalButton.Hint;
    CancelProposalButton.Width := 185;
    CompleteProposalButton.Caption := CompleteProposalButton.Hint;
    CompleteProposalButton.Width := 185;
  end;

end;

procedure TLeadsForm.LinkControlToField10AssignedValue(Sender: TObject;
  AssignValueRec: TBindingAssignValueRec; const Value: TValue);
begin
  DateContactedPickerChange(DateContactedPicker);
end;

procedure TLeadsForm.LinkControlToField6AssignedValue(Sender: TObject;
  AssignValueRec: TBindingAssignValueRec; const Value: TValue);
begin
  DateContactedPickerChange(DateCreatedPicker);
end;

procedure TLeadsForm.LinkControlToField8AssignedValue(Sender: TObject;
  AssignValueRec: TBindingAssignValueRec; const Value: TValue);
begin
  DateContactedPickerChange(DateDraftedPicker);
end;

procedure TLeadsForm.LinkControlToField9AssignedValue(Sender: TObject;
  AssignValueRec: TBindingAssignValueRec; const Value: TValue);
begin
  DateContactedPickerChange(DateClosedPicker);
end;

procedure TLeadsForm.AddDocButtonClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    DocsBindSourceDB.DataSet.Append;
    DocsBindSourceDB.DataSet.Edit;
    DocsBindSourceDB.DataSet.FieldByName('LeadId').AsInteger :=
      LeadsBindSourceDB.DataSet.FieldByName('LeadId').AsInteger;
    DocsBindSourceDB.DataSet.FieldByName('DocumentName').AsString :=
      ExtractFileName(OpenDialog1.FileName);
    TBlobField(DocsBindSourceDB.DataSet.FieldByName('Document'))
      .LoadFromFile(OpenDialog1.FileName);
    DocsBindSourceDB.DataSet.FieldByName('User').AsString :=
      UsersBindSourceDB.DataSet.FieldByName('Username').AsString;
    DocsBindSourceDB.DataSet.Post;
  end;
end;

procedure TLeadsForm.CancelProposalButtonClick(Sender: TObject);
begin
  DM.UpdateProposalStatus(LeadsBindSourceDB.DataSet.FieldByName('LeadId').AsInteger,'Canceled');
end;

procedure TLeadsForm.CompleteProposalButtonClick(Sender: TObject);
begin
  DM.CompleteProposal(LeadsBindSourceDB.DataSet.FieldByName('LeadId').AsInteger);
end;

procedure TLeadsForm.CreateProposalButtonClick(Sender: TObject);
begin
  if not ProposalBindSourceDB.DataSet.Locate('LeadId',VarArrayOf([LeadsBindSourceDB.DataSet.FieldByName('LeadId').AsInteger]),[]) then
  begin
    DraftProposalForm.NewDraft(LeadsBindSourceDB.DataSet.FieldByName('LeadId').AsInteger,LeadsBindSourceDB.DataSet.FieldByName('AccountName').AsString);
    DraftProposalForm.ShowModal;
  end
  else
  begin
    ShowMessage('This lead already has a proposal.');
  end;
end;

procedure TLeadsForm.ViewDocButtonClick(Sender: TObject);
var
LDocStream: TMemoryStream;
LTempDocument: String;
begin
  LDocStream := TStringStream.Create;
  try
    if DocsBindSourceDB.DataSet.RecordCount>0 then
    begin
      if DocsBindSourceDB.DataSet.FieldByName('Document') <> nil then
      begin
        TBlobField(DocsBindSourceDB.DataSet.FieldByName('Document')).SaveToStream(LDocStream);
        LTempDocument := TPath.Combine(TPath.GetTempPath,DocsBindSourceDB.DataSet.FieldByName('DocumentName').AsString);
        LDocStream.SaveToFile(LTempDocument);
      end;
    end;

  finally
    LDocStream.Free;
  end;

  if LTempDocument<>'' then
    ShellExecute(Handle, nil, PChar(LTempDocument), nil,  nil, SW_SHOWNORMAL)
  else
    ShowMessage('No document selected.');
end;

procedure TLeadsForm.ViewProposalButtonClick(Sender: TObject);
var
LReportStream: TStringStream;
LReportString: String;
LCurrentLeadId: Integer;
begin
  LCurrentLeadId := LeadsBindSourceDB.DataSet.FieldByName('LeadId').AsInteger;

  LReportStream := TStringStream.Create;
  try
    if ProposalBindSourceDB.DataSet.Locate('LeadId',VarArrayOf([LCurrentLeadId]),[]) then
    begin
      if ProposalBindSourceDB.DataSet.FieldByName('Proposal') <> nil then
      begin
        TBlobField(ProposalBindSourceDB.DataSet.FieldByName('Proposal')).SaveToStream(LReportStream);
        LReportString := LReportStream.DataString;
      end;
    end;

  finally
    LReportStream.Free;
  end;
  if LReportString <> '' then
  begin
    ProposalForm.LoadProposal(LCurrentLeadId, LReportString);
    ProposalForm.ShowModal;
  end;
end;

end.
