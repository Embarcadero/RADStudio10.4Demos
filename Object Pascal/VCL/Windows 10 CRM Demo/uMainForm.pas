unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Controls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.Bind.Navigator,
  Vcl.Grids, Vcl.WinXCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Vcl.WinXCalendars, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageXML,
  Vcl.WinXPanels, System.Actions, Vcl.ActnList, Vcl.Themes,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.VirtualImage, System.IOUtils, Vcl.TitleBarCtrls;

type
  TMainForm = class(TForm)
    pnlToolbar: TPanel;
    SplitView: TSplitView;
    NavPanel: TPanel;
    NewLeadsSG: TStringGrid;
    BindNavigator1: TBindNavigator;
    lblTitle: TLabel;
    PageControl: TPageControl;
    LeadsTab: TTabSheet;
    CalendarTab: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    LeadsBindNewSourceDB: TBindSourceDB;
    BindingsList1: TBindingsList;
    Image5: TImage;
    CalendarView1: TCalendarView;
    LeadsSearchBox: TSearchBox;
    Panel4: TPanel;
    Label3: TLabel;
    DashboardTab: TTabSheet;
    Panel5: TPanel;
    Label4: TLabel;
    ImportLeadsDialog: TOpenDialog;
    ExportLeadsDialog: TSaveDialog;
    FlowPanel1: TFlowPanel;
    RelativePanel1: TRelativePanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RelativePanel2: TRelativePanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RelativePanel3: TRelativePanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RelativePanel4: TRelativePanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RelativePanel5: TRelativePanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    RelativePanel6: TRelativePanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    SalesTab: TTabSheet;
    Panel6: TPanel;
    Label23: TLabel;
    SalesSearchBox: TSearchBox;
    ProposalStringGrid: TStringGrid;
    BindNavigator3: TBindNavigator;
    AccountsTab: TTabSheet;
    Panel7: TPanel;
    Label24: TLabel;
    AcctSearchBox: TSearchBox;
    AccountsSG: TStringGrid;
    BindNavigator4: TBindNavigator;
    UsersTab: TTabSheet;
    Panel8: TPanel;
    Label25: TLabel;
    SearchBox7: TSearchBox;
    UsersSG: TStringGrid;
    UsersBindSourceDB: TBindSourceDB;
    LinkGridToDataSourceUsersBindSourceDB: TLinkGridToDataSource;
    BindNavigator5: TBindNavigator;
    ProposalBindSourceDB: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB5: TLinkGridToDataSource;
    UsernameComboBox: TComboBox;
    LinkListControlToField1: TLinkListControlToField;
    AcctBindSourceDB: TBindSourceDB;
    MarketingTab: TTabSheet;
    Panel3: TPanel;
    Label2: TLabel;
    EmailsSearchBox: TSearchBox;
    StringGrid2: TStringGrid;
    EmailsBindSourceDB: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    SaveEmailsDialog: TSaveDialog;
    NewLeadsPanel: TPanel;
    Splitter1: TSplitter;
    Label27: TLabel;
    ActiveLeadsSG: TStringGrid;
    ActiveLeadsPanel: TPanel;
    Label28: TLabel;
    Splitter2: TSplitter;
    ProposalSentPanel: TPanel;
    ProposalSentLeadsSG: TStringGrid;
    Label29: TLabel;
    Splitter3: TSplitter;
    ClosedPanel: TPanel;
    ClosedLeadsSG: TStringGrid;
    Label30: TLabel;
    LinkGridToDataSourceLeadsBindSourceDB: TLinkGridToDataSource;
    LeadsBindActiveSourceDB: TBindSourceDB;
    LinkGridToDataSourceLeadsBindActiveSourceDB: TLinkGridToDataSource;
    LeadsBindSourceDB: TBindSourceDB;
    LeadsBindProposalSentSourceDB: TBindSourceDB;
    LeadsBindClosedSourceDB: TBindSourceDB;
    LinkGridToDataSourceLeadsBindClosedSourceDB: TLinkGridToDataSource;
    TitleBarPanel1: TTitleBarPanel;
    VCLStylesCB: TComboBox;
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
    ViewLeadButton: TSpeedButton;
    CreateLeadButton: TSpeedButton;
    ExportLeadsButton: TSpeedButton;
    LeadsRelativePanel: TRelativePanel;
    AcctsRelativePanel: TRelativePanel;
    ExportAcctsButton: TSpeedButton;
    RemoveAcctButton: TSpeedButton;
    CreateAcctButton: TSpeedButton;
    ProposalsRelativePanel: TRelativePanel;
    CancelProposalButton: TSpeedButton;
    CompleteProposalButton: TSpeedButton;
    MarketingRelativePanel: TRelativePanel;
    ExportEmailsButton: TSpeedButton;
    UsersRelativePanel: TRelativePanel;
    CreateUserButton: TSpeedButton;
    RemoveUserButton: TSpeedButton;
    DashboardButton: TButton;
    AcctsButton: TButton;
    LeadsButton: TButton;
    SalesButton: TButton;
    MarketingButton: TButton;
    CalendarButton: TButton;
    UsersButton: TButton;
    LinkGridToDataSourceAcctBindSourceDB: TLinkGridToDataSource;
    ExportAcctsDialog: TSaveDialog;
    LinkGridToDataSourceLeadsBindProposalSentSourceDB: TLinkGridToDataSource;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    VirtualImage6: TVirtualImage;
    VirtualImage7: TVirtualImage;
    MenuVirtualImage: TVirtualImage;
    NewTotalBindSourceDB: TBindSourceDB;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    ActiveTotalBindSourceDB: TBindSourceDB;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    ProposalTotalBindSourceDB: TBindSourceDB;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    ClosedTotalBindSourceDB: TBindSourceDB;
    LinkPropertyToFieldCaption4: TLinkPropertyToField;
    InactiveTotalBindSourceDB: TBindSourceDB;
    LinkPropertyToFieldCaption5: TLinkPropertyToField;
    AllTotalBindSourceDB: TBindSourceDB;
    LinkPropertyToFieldCaption6: TLinkPropertyToField;
    VirtualImage9: TVirtualImage;
    VirtualImage10: TVirtualImage;
    VirtualImage11: TVirtualImage;
    VirtualImage12: TVirtualImage;
    VirtualImage13: TVirtualImage;
    VirtualImage14: TVirtualImage;
    procedure CalendarView1DrawDayItem(Sender: TObject;
      DrawParams: TDrawViewInfoParams; CalendarViewViewInfo: TCellItemViewInfo);
    procedure AcctSearchBoxKeyPress(Sender: TObject; var Key: Char);
    procedure LeadsSearchBoxKeyPress(Sender: TObject; var Key: Char);
    procedure SalesSearchBoxKeyPress(Sender: TObject; var Key: Char);
    procedure EmailsSearchBoxKeyPress(Sender: TObject; var Key: Char);
    procedure NewLeadsSGEnter(Sender: TObject);
    procedure ActiveLeadsSGEnter(Sender: TObject);
    procedure ProposalSentLeadsSGEnter(Sender: TObject);
    procedure ClosedLeadsSGEnter(Sender: TObject);
    procedure NewLeadsSGDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure NewLeadsSGDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure NewLeadsSGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VCLStylesCBChange(Sender: TObject);
    procedure LeadsRelativePanelResize(Sender: TObject);
    procedure AcctsRelativePanelResize(Sender: TObject);
    procedure ProposalsRelativePanelResize(Sender: TObject);
    procedure MarketingRelativePanelResize(Sender: TObject);
    procedure UsersRelativePanelResize(Sender: TObject);
    procedure CreateLeadButtonClick(Sender: TObject);
    procedure ExportLeadsButtonClick(Sender: TObject);
    procedure ViewLeadButtonClick(Sender: TObject);
    procedure ExportEmailsButtonClick(Sender: TObject);
    procedure SplitViewOpening(Sender: TObject);
    procedure SplitViewClosing(Sender: TObject);
    procedure CreateAcctButtonClick(Sender: TObject);
    procedure DashboardButtonClick(Sender: TObject);
    procedure AccountsTabResize(Sender: TObject);
    procedure RemoveAcctButtonClick(Sender: TObject);
    procedure ExportAcctsButtonClick(Sender: TObject);
    procedure CreateUserButtonClick(Sender: TObject);
    procedure RemoveUserButtonClick(Sender: TObject);
    procedure UsersTabResize(Sender: TObject);
    procedure CancelProposalButtonClick(Sender: TObject);
    procedure CompleteProposalButtonClick(Sender: TObject);
    procedure MenuVirtualImageClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure UsernameComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure UsernameComboBoxChange(Sender: TObject);
    procedure NewLeadsSGDblClick(Sender: TObject);
    procedure ActiveLeadsSGDblClick(Sender: TObject);
    procedure VCLStylesCBKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FRanOnce: Boolean;
    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure RefreshGrids;
    procedure UpdateNavButtons;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses uDataMod, uLeads, uDraftProposal, uProposal;

procedure TMainForm.RefreshGrids;
begin
  LeadsBindClosedSourceDB.DataSet.Refresh;
  LeadsBindActiveSourceDB.DataSet.Refresh;
  LeadsBindNewSourceDB.DataSet.Refresh;
  LeadsBindProposalSentSourceDB.DataSet.Refresh;
end;

procedure TMainForm.RemoveAcctButtonClick(Sender: TObject);
begin
  AcctBindSourceDB.DataSet.Delete;
end;

procedure TMainForm.RemoveUserButtonClick(Sender: TObject);
begin
  UsersBindSourceDB.DataSet.Delete;
end;

procedure TMainForm.AcctSearchBoxKeyPress(Sender: TObject; var Key: Char);
begin
  DM.SearchAccounts(AcctSearchBox.Text);
end;

procedure TMainForm.CalendarView1DrawDayItem(Sender: TObject;
  DrawParams: TDrawViewInfoParams; CalendarViewViewInfo: TCellItemViewInfo);
begin
  if DayOfWeek(CalendarViewViewInfo.Date) in [1, 7] then
  begin
    DrawParams.Font.Style := [fsBold];
  end;
end;

procedure TMainForm.CancelProposalButtonClick(Sender: TObject);
begin
  if ProposalBindSourceDB.DataSet.RecordCount>0 then
  begin
    DM.UpdateProposalStatus(ProposalBindSourceDB.DataSet.FieldByName('LeadId').AsInteger,'Canceled');
  end;
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePageIndex=0 then
    begin
      DM.FDQueryNewTotal.Refresh;
      DM.FDQueryActiveTotal.Refresh;
      DM.FDQueryProposalTotal.Refresh;
      DM.FDQueryInactiveTotal.Refresh;
      DM.FDQueryClosedTotal.Refresh;
      DM.FDQueryTotal.Refresh;
    end;
  case PageControl.ActivePageIndex of
    0: DashboardButton.SetFocus;
    1: AcctsButton.SetFocus;
    2: LeadsButton.SetFocus;
    3: SalesButton.SetFocus;
    4: begin
      MarketingButton.SetFocus;
      EmailsBindSourceDB.DataSet.Refresh;
    end;
    5: CalendarButton.SetFocus;
    6: UsersButton.SetFocus;
  end;

end;

procedure TMainForm.SalesSearchBoxKeyPress(Sender: TObject; var Key: Char);
begin
  DM.SearchProposals(SalesSearchBox.Text);
end;

procedure TMainForm.SplitViewClosing(Sender: TObject);
begin
  DashboardButton.Caption := '';
  AcctsButton.Caption := '';
  LeadsButton.Caption := '';
  SalesButton.Caption := '';
  MarketingButton.Caption := '';
  CalendarButton.Caption := '';
  UsersButton.Caption := '';
end;

procedure TMainForm.SplitViewOpening(Sender: TObject);
begin
  DashboardButton.Caption := '          '+DashboardButton.Hint;
  AcctsButton.Caption := '          '+AcctsButton.Hint;
  LeadsButton.Caption := '          '+LeadsButton.Hint;
  SalesButton.Caption := '          '+SalesButton.Hint;
  MarketingButton.Caption := '          '+MarketingButton.Hint;
  CalendarButton.Caption := '          '+CalendarButton.Hint;
  UsersButton.Caption := '          '+UsersButton.Hint;
end;

procedure TMainForm.AccountsTabResize(Sender: TObject);
begin
  LinkGridToDataSourceAcctBindSourceDB.Columns[1].Width := AccountsSG.Width - LinkGridToDataSourceAcctBindSourceDB.Columns[0].Width;
end;

procedure TMainForm.UsersTabResize(Sender: TObject);
begin
  LinkGridToDataSourceUsersBindSourceDB.Columns[1].Width := UsersSG.Width - LinkGridToDataSourceUsersBindSourceDB.Columns[0].Width;

end;

procedure TMainForm.UsernameComboBoxChange(Sender: TObject);
begin
  LeadsForm.Close;
  DraftProposalForm.Close;
  ProposalForm.Close;
  DM.SetUser(UsernameComboBox.Text);
end;

procedure TMainForm.UsernameComboBoxKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TMainForm.UsersRelativePanelResize(Sender: TObject);
begin
  if UsersRelativePanel.Width<=436 then
  begin
    CreateUserButton.Caption := '';
    CreateUserButton.Width := 40;
    RemoveUserButton.Caption := '';
    RemoveUserButton.Width := 40;
  end
  else
  begin
    CreateUserButton.Caption := CreateUserButton.Hint;
    CreateUserButton.Width := 121;
    RemoveUserButton.Caption := RemoveUserButton.Hint;
    RemoveUserButton.Width := 121;
  end;
end;

procedure TMainForm.VCLStylesCBChange(Sender: TObject);
begin
  MainForm.WindowState := TWindowState.wsMaximized;
  TStyleManager.TrySetStyle(VCLStylesCB.Text);
  UpdateNavButtons;
end;

procedure TMainForm.VCLStylesCBKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TMainForm.ViewLeadButtonClick(Sender: TObject);
begin
  LeadsForm.Show;
end;

procedure TMainForm.MenuVirtualImageClick(Sender: TObject);
begin
  SplitView.Opened := not SplitView.Opened;
end;

procedure TMainForm.AcctsRelativePanelResize(Sender: TObject);
begin
  if AcctsRelativePanel.Width<=634 then
  begin

    ExportAcctsButton.Caption := '';
    ExportAcctsButton.Width := 40;
    CreateAcctButton.Caption := '';
    CreateAcctButton.Width := 40;
    RemoveAcctButton.Caption := '';
    RemoveAcctButton.Width := 40;
  end
  else
  begin
    ExportAcctsButton.Caption := ExportAcctsButton.Hint;
    ExportAcctsButton.Width := 112;
    CreateAcctButton.Caption := CreateAcctButton.Hint;
    CreateAcctButton.Width := 112;
    RemoveAcctButton.Caption := RemoveAcctButton.Hint;
    RemoveAcctButton.Width := 112;
  end;
end;

procedure TMainForm.ActiveLeadsSGDblClick(Sender: TObject);
begin
  ViewLeadButtonClick(Sender);
end;

procedure TMainForm.ActiveLeadsSGEnter(Sender: TObject);
begin
  LeadsForm.LocateLead(LeadsBindActiveSourceDB.DataSet.FieldByName('LeadId').AsInteger);
  BindNavigator1.DataSource := LeadsBindActiveSourceDB;
end;

procedure TMainForm.ProposalSentLeadsSGEnter(Sender: TObject);
begin
  LeadsForm.LocateLead(LeadsBindProposalSentSourceDB.DataSet.FieldByName('LeadId').AsInteger);
  BindNavigator1.DataSource := LeadsBindProposalSentSourceDB;
end;

procedure TMainForm.ProposalsRelativePanelResize(Sender: TObject);
begin
  if ProposalsRelativePanel.Width<=436 then
  begin
    CompleteProposalButton.Caption := '';
    CompleteProposalButton.Width := 40;
    CancelProposalButton.Caption := '';
    CancelProposalButton.Width := 40;
  end
  else
  begin
    CompleteProposalButton.Caption := CompleteProposalButton.Hint;
    CompleteProposalButton.Width := 121;
    CancelProposalButton.Caption := CancelProposalButton.Hint;
    CancelProposalButton.Width := 121;
  end;
end;

procedure TMainForm.ClosedLeadsSGEnter(Sender: TObject);
begin
  LeadsForm.LocateLead(LeadsBindClosedSourceDB.DataSet.FieldByName('LeadId').AsInteger);
  BindNavigator1.DataSource := LeadsBindClosedSourceDB;
end;

procedure TMainForm.CompleteProposalButtonClick(Sender: TObject);
begin
  if ProposalBindSourceDB.DataSet.RecordCount>0 then
  begin
    DM.UpdateProposalStatus(ProposalBindSourceDB.DataSet.FieldByName('LeadId').AsInteger,'Accepted');
    ProposalBindSourceDB.DataSet.Refresh;
  end;
end;

procedure TMainForm.CreateAcctButtonClick(Sender: TObject);
var
LNewAccount: String;
begin
  LNewAccount := InputBox('Create New Account', 'Account Name', 'New Account');
  AcctBindSourceDB.DataSet.DisableControls;
  AcctBindSourceDB.DataSet.AppendRecord([nil,LNewAccount]);
  AcctBindSourceDB.DataSet.EnableControls;
  LinkGridToDataSourceAcctBindSourceDB.Active := False;
  LinkGridToDataSourceAcctBindSourceDB.Active := True;

end;

procedure TMainForm.CreateLeadButtonClick(Sender: TObject);
begin
  LeadsBindNewSourceDB.DataSet.Append;
  LeadsBindNewSourceDB.DataSet.FieldByName('LeadId').AsString := '';
  LeadsBindNewSourceDB.DataSet.FieldByName('Status').AsString := 'New';
  LeadsBindNewSourceDB.DataSet.FieldByName('Name').AsString := 'First Last';
  LeadsBindNewSourceDB.DataSet.FieldByName('User').AsString := UsernameCombobox.Text;
  LeadsBindNewSourceDB.DataSet.FieldByName('DateCreated').AsDateTime := Now;
  LeadsBindNewSourceDB.DataSet.Post;
  LeadsBindSourceDB.DataSet.Locate('LeadId',VarArrayOf([LeadsBindNewSourceDB.DataSet.FieldByName('LeadId').AsInteger]),[]);
  BindNavigator1.DataSource := LeadsBindNewSourceDB;
  LeadsForm.Show;
end;

procedure TMainForm.CreateUserButtonClick(Sender: TObject);
var
LNewUser: String;
begin
  LNewUser := InputBox('Create New User', 'User Name', 'user');
  if UsersBindSourceDB.DataSet.Lookup('Username', VarArrayOf([LNewUser]),'Username')<>LNewUser then
  begin
    UsersBindSourceDB.DataSet.Append;
    UsersBindSourceDB.DataSet.FieldByName('UserId').AsInteger := 0;
    UsersBindSourceDB.DataSet.FieldByName('Username').AsString := LNewUser;
    UsersBindSourceDB.DataSet.Post;
    DM.UsersFDTable.Refresh;
  end
  else
  begin
    ShowMessage('A user with that username already exists.');
  end;
end;

procedure TMainForm.DashboardButtonClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := TButton(Sender).Tag;
end;

procedure TMainForm.LeadsRelativePanelResize(Sender: TObject);
begin
  if LeadsRelativePanel.Width<=781 then
  begin

    ExportLeadsButton.Caption := '';
    ExportLeadsButton.Width := 40;
    CreateLeadButton.Caption := '';
    CreateLeadButton.Width := 40;
    ViewLeadButton.Caption := '';
    ViewLeadButton.Width := 40;
  end
  else
  begin
    ExportLeadsButton.Caption := ExportLeadsButton.Hint;
    ExportLeadsButton.Width := 153;
    CreateLeadButton.Caption := CreateLeadButton.Hint;
    CreateLeadButton.Width := 153;
    ViewLeadButton.Caption := ViewLeadButton.Hint;
    ViewLeadButton.Width := 153;
  end;
end;

procedure TMainForm.LeadsSearchBoxKeyPress(Sender: TObject; var Key: Char);
begin
  DM.SearchLeads(LeadsSearchBox.Text);
end;

procedure TMainForm.MarketingRelativePanelResize(Sender: TObject);
begin
  if MarketingRelativePanel.Width<=320 then
  begin
    ExportEmailsButton.Caption := '';
    ExportEmailsButton.Width := 40;
  end
  else
  begin
    ExportEmailsButton.Caption := ExportEmailsButton.Hint;
    ExportEmailsButton.Width := 121;
  end;
end;

procedure TMainForm.NewLeadsSGDblClick(Sender: TObject);
begin
  ViewLeadButtonClick(Sender);
end;

procedure TMainForm.NewLeadsSGDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  LStatus: String;
  LIndex: Integer;
  LDataSet: TDataSet;
  LDateField: String;
begin
  LIndex := -1;

  if Source = Sender then
  begin

  end
  else
  begin

    case TStringGrid(Sender).Parent.Tag of
      1:
        begin
          LStatus := 'New';
          LDateField := 'DateCreated';
          LDataSet := LeadsBindNewSourceDB.DataSet;
        end;
      2:
        begin
          LStatus := 'Active';
          LDateField := 'DateContacted';
          LDataSet := LeadsBindActiveSourceDB.DataSet;
        end;
      3:
        begin
          LStatus := 'Proposal Sent';
          LDateField := 'DateDrafted';
          LDataSet := LeadsBindProposalSentSourceDB.DataSet;
        end;
      4:
        begin
          LStatus := 'Closed';
          LDateField := 'DateClosed';
          LDataSet := LeadsBindClosedSourceDB.DataSet;
        end;
      else
       LDataSet := LeadsBindNewSourceDB.DataSet;
    end;

    case TStringGrid(Source).Parent.Tag of
      1:
        begin
          if LeadsBindNewSourceDB.DataSet.RecordCount > 0 then
          begin
            LIndex := LeadsBindNewSourceDB.DataSet.FieldByName('LeadId').AsInteger;
            if LeadsBindSourceDB.DataSet.Locate('LeadId',VarArrayOf([LIndex]),[]) then
            begin
              LeadsBindSourceDB.DataSet.Edit;
              LeadsBindSourceDB.DataSet.FieldByName('Status').AsString := LStatus;
              if LeadsBindSourceDB.DataSet.FieldByName(LDateField).AsDateTime=0 then LeadsBindSourceDB.DataSet.FieldByName(LDateField).AsDateTime := Now;
              LeadsBindSourceDB.DataSet.Post;
            end;
            LDataSet.Locate('LeadId',VarArrayOf([LIndex]),[]);
          end;
        end;
      2:
        begin
          if LeadsBindActiveSourceDB.DataSet.RecordCount > 0 then
          begin
            LIndex := LeadsBindActiveSourceDB.DataSet.FieldByName('LeadId').AsInteger;
            if LeadsBindSourceDB.DataSet.Locate('LeadId',VarArrayOf([LIndex]),[]) then
            begin
              LeadsBindSourceDB.DataSet.Edit;
              LeadsBindSourceDB.DataSet.FieldByName('Status').AsString := LStatus;
              if LeadsBindSourceDB.DataSet.FieldByName(LDateField).AsDateTime=0 then LeadsBindSourceDB.DataSet.FieldByName(LDateField).AsDateTime := Now;
              LeadsBindSourceDB.DataSet.Post;
            end;
            LDataSet.Locate('LeadId',VarArrayOf([LIndex]),[]);
          end;
        end;
      3:
        begin
          if LeadsBindProposalSentSourceDB.DataSet.RecordCount > 0 then
          begin
            LIndex := LeadsBindProposalSentSourceDB.DataSet.FieldByName('LeadId').AsInteger;
            if LeadsBindSourceDB.DataSet.Locate('LeadId',VarArrayOf([LIndex]),[]) then
            begin
              LeadsBindSourceDB.DataSet.Edit;
              LeadsBindSourceDB.DataSet.FieldByName('Status').AsString := LStatus;
              if LeadsBindSourceDB.DataSet.FieldByName(LDateField).AsDateTime=0 then LeadsBindSourceDB.DataSet.FieldByName(LDateField).AsDateTime := Now;
              LeadsBindSourceDB.DataSet.Post;
            end;
            LDataSet.Locate('LeadId',VarArrayOf([LIndex]),[]);
          end;
        end;
      4:
        begin
          if LeadsBindClosedSourceDB.DataSet.RecordCount > 0 then
          begin
            LIndex := LeadsBindClosedSourceDB.DataSet.FieldByName('LeadId').AsInteger;
            if LeadsBindSourceDB.DataSet.Locate('LeadId',VarArrayOf([LIndex]),[]) then
            begin
              LeadsBindSourceDB.DataSet.Edit;
              LeadsBindSourceDB.DataSet.FieldByName('Status').AsString := LStatus;
              if LeadsBindSourceDB.DataSet.FieldByName(LDateField).AsDateTime=0 then LeadsBindSourceDB.DataSet.FieldByName(LDateField).AsDateTime := Now;
              LeadsBindSourceDB.DataSet.Post;
            end;
            LDataSet.Locate('LeadId',VarArrayOf([LIndex]),[]);
          end;
        end;
    end;

    RefreshGrids;

    LDataSet.Locate('LeadId',VarArrayOf([LIndex]),[]);
  end;
end;

procedure TMainForm.NewLeadsSGDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TStringGrid;
end;

procedure TMainForm.NewLeadsSGEnter(Sender: TObject);
begin
  LeadsForm.LocateLead(LeadsBindNewSourceDB.DataSet.FieldByName('LeadId').AsInteger);
  BindNavigator1.DataSource := LeadsBindNewSourceDB;
end;

procedure TMainForm.NewLeadsSGMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
     TStringGrid(Sender).BeginDrag(False,4);
end;

procedure TMainForm.EmailsSearchBoxKeyPress(Sender: TObject; var Key: Char);
begin
  DM.SearchEmails(EmailsSearchBox.Text);
end;

procedure TMainForm.ExportAcctsButtonClick(Sender: TObject);
begin
  if ExportAcctsDialog.Execute then
  begin
    DM.AcctFDTable.SaveToFile(ExportAcctsDialog.FileName);
  end;
end;

procedure TMainForm.ExportEmailsButtonClick(Sender: TObject);
begin
  if SaveEmailsDialog.Execute then
  begin
    DM.ExportEmails(SaveEmailsDialog.FileName);
  end;
end;

procedure TMainForm.ExportLeadsButtonClick(Sender: TObject);
begin
  if ExportLeadsDialog.Execute then
  begin
    DM.LeadsFDTable.SaveToFile(ExportLeadsDialog.FileName);
  end;
end;

procedure TMainForm.AppIdle(Sender: TObject; var Done: Boolean);
begin
  if not FRanOnce then
  begin
    FRanOnce := True;

    DM.InitializeDatabase;

    DashboardButton.SetFocus;
  end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if FRanOnce then
  begin
    if LeadsBindSourceDB.DataSet.State = TDataSetState.dsEdit then
      LeadsBindSourceDB.DataSet.Post;
    TBindSourceDB(BindNavigator1.DataSource).DataSet.Refresh;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  Application.OnIdle := AppIdle;

  for StyleName in TStyleManager.StyleNames do
    VCLStylesCB.Items.Add(StyleName);

  VCLStylesCB.ItemIndex := VCLStylesCB.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  UpdateNavButtons;
end;

procedure TMainForm.UpdateNavButtons;
var
  LStyle: Dword;
begin
  LStyle := GetWindowLong(DashboardButton.Handle, GWL_STYLE);
  SetWindowLong(DashboardButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  DashboardButton.Caption := '          '+DashboardButton.Hint;
  SetWindowLong(AcctsButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  AcctsButton.Caption := '          '+AcctsButton.Hint;
  SetWindowLong(LeadsButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  LeadsButton.Caption := '          '+LeadsButton.Hint;
  SetWindowLong(SalesButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  SalesButton.Caption := '          '+SalesButton.Hint;
  SetWindowLong(MarketingButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  MarketingButton.Caption := '          '+MarketingButton.Hint;
  SetWindowLong(CalendarButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  CalendarButton.Caption := '          '+CalendarButton.Hint;
  SetWindowLong(UsersButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  UsersButton.Caption := '          '+UsersButton.Hint;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  if MainForm.Width<=640 then
  begin
    if SplitView.Opened=True then SplitView.Opened := False;
  end
  else
  begin
    if SplitView.Opened=False then SplitView.Opened := True;
  end;
end;

end.
