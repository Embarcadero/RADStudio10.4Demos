
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
{
                     MastApp Main Window.

  By default, the database component's alias is DBDEMOS, and so the
  application accesses the Paradox tables. You can upsize the
  application to use Local InterBase data by choosing View | Remote
  Data from the application's main menu.  For this to work, however,
  the Local InterBase Server must be running.  The application checks
  for this and raises an exception if there's a problem.

  The application also creates the MASTSQL alias if it doesn't
  already exist.  This code for this appears in the MastData module.

}

unit Main;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, Menus, ExtCtrls, DB, DBTables;

type
  TDateOrder = (doMDY, doDMY, doYMD);

  TMainForm = class(TForm)
    MainPanel: TPanel;
    PrinterSetup: TPrinterSetupDialog;
    OrderBtn: TSpeedButton;
    BrowseBtn: TSpeedButton;
    PartsBtn: TSpeedButton;
    CloseBtn: TSpeedButton;
    ReportBtn: TSpeedButton;
    HelpBtn: TSpeedButton;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FilePrinterSetup: TMenuItem;
    FileExit: TMenuItem;
    FileNewOrder: TMenuItem;
    FilePrintReport: TMenuItem;
    PrintCustList: TMenuItem;
    PrintOrders: TMenuItem;
    PrintInvoice: TMenuItem;
    ViewMenu: TMenuItem;
    ViewOrders: TMenuItem;
    ViewPartsInventory: TMenuItem;
    ViewStayOnTop: TMenuItem;
    ViewLocal: TMenuItem;
    ViewRemote: TMenuItem;
    HelpMenu: TMenuItem;
    HelpAbout: TMenuItem;
    HelpContents: TMenuItem;
    procedure BrowseCustOrd(Sender: TObject);
    procedure CloseApp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BrowseParts(Sender: TObject);
    procedure ToggleStayonTop(Sender: TObject);
    procedure NewOrder(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure PrinterSetupClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ReportBtnClick(Sender: TObject);
    procedure OrderReport(Sender: TObject);
    procedure CustomerReport(Sender: TObject);
    procedure InvoiceReport(Sender: TObject);
    procedure ViewLocalClick(Sender: TObject);
    procedure ViewRemoteClick(Sender: TObject);
    procedure ViewMenuClick(Sender: TObject);
  private
    procedure PrintOrderReport(Preview: Boolean);
    procedure PrintInvoiceReport(Preview: Boolean);
    procedure PrintCustomerReport(Preview: Boolean);
    procedure CloseAllWindows;
    procedure UpdateRSConnect(const Dbpath:string);
    procedure InitRSRUN;
  end;

var
  MainForm: TMainForm;

implementation

uses
   DataMod,  { Data Module }
   BrCstOrd, { The Browse Orders by Customer form }
   BrParts,  { The Browse Parts form }
   EdOrders, { The Edit Orders form }
   QryCust,  { The Specify Date Range form }
   PickRep,  { The Report Selection form }
   About,    { The About dialog box }
   IniFiles, { Delphi Unit for INI file support }
   PickInvc; { The invoice number selection dialog }

{$R *.dfm}

function GetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := doMDY;
  I := 1;
  while I <= Length(DateFormat) do
  begin
    case Chr(Ord(DateFormat[I]) and $DF) of
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;
  Result := doMDY;
end;

procedure TMainForm.BrowseCustOrd(Sender: TObject);
begin
  case GetDateOrder(FormatSettings.ShortDateFormat) of
    doYMD: FormatSettings.ShortDateFormat := 'yy/mm/dd';
    doMDY: FormatSettings.ShortDateFormat := 'mm/dd/yy';
    doDMY: FormatSettings.ShortDateFormat := 'dd/mm/yy';
  end;
  BrCustOrdForm.Show;
end;

procedure TMainForm.CloseApp(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.UpdateRSConnect(const Dbpath: string);
const
  TiniFilename = 'RPTSMITH.CON';   {ReportSmith connections file}
  AppConTitle = 'MASTAPP';
  SQLConTitle = 'MASTSQL';
  ConnectNamesSection = 'ConnectNamesSection';
  ConnectNamesKey = 'ConnectNames';
  MASTAPPSection = 'MASTAPP';
  MASTSQLSection = 'MASTSQL';
  TypeKey = 'Type';
  ServerKey = 'Server';
  SQLTypeVal = 67;
  SQLServerVal = 'MASTSQL';
  SQLDataFilePathKey = 'Database';
  SQLUseridKey = 'USERID';
  SQLUseridVal = 'SYSDBA';
  TypeVal = 61;
  ServerVal = 'PARADOX';
  DataFilePathKey = 'DataFilePath';
var
  TempStr: string;
  RSCON: TIniFile;
begin
 { the ReportSmith CON file is actually an INI file -- assumes in win dir}
  RSCon := TIniFile.Create(TiniFilename);
  TempStr := RSCon.ReadString(ConnectNamesSection, ConnectNamesKey, '');
  { CON file contents differs for SQL connections }
  if MastData.Database.IsSQLBased then
  begin
    if AnsiPos(SQLConTitle,TempStr) = 0 then
    begin
      if TempStr <> '' then
        TempStr := TempStr + ',';
      RSCon.WriteString(ConnectNamesSection, ConnectNamesKey, TempStr+SQLConTitle);
    end;
    RSCon.WriteInteger(MASTSQLSection, TypeKey, SQLTypeVal);
    RSCon.WriteString(MASTSQLSection, SQLDataFilePathKey, DBpath);
    RSCon.WriteString(MASTSQLSection, ServerKey, SQLServerVal);
    RSCon.WriteString(MASTSQLSection, SQLUseridKey, SQLUseridVal);
  end
  else
  begin
    if AnsiPos(AppConTitle,TempStr) = 0 then
    begin
      if TempStr <> '' then
        TempStr := TempStr + ',';
      RSCon.WriteString(ConnectNamesSection, ConnectNamesKey, TempStr+AppConTitle);
    end;
    RSCon.WriteInteger(MASTAPPSection, TypeKey, TypeVal);
    RSCon.WriteString(MASTAPPSection, DataFilePathKey, DBpath);
    RSCon.WriteString(MASTAPPSection, ServerKey, ServerVal);
  end;
  RSCon.Free;
end;

procedure TMainForm.InitRSRUN;
var
  DBPath: string;
  ParamList: TStringList;
begin
  { get the actual location of the database from the alias,
    the path is needed for the reports -- assumes alias is defined }
  ParamList := TStringList.Create;
  try
    Session.GetAliasParams(MastData.Database.AliasName, ParamList);
    if MastData.Database.IsSQLBased then
      DBPath := ParamList.Values['SERVER NAME']
    else
      DBPath := ParamList.Values['PATH'];
  finally
    ParamList.Free;
  end;
  { set up the ReportSmith "connection" identifying the database location }
  UpdateRSConnect(DBPath);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ClientWidth := CloseBtn.Left + CloseBtn.Width + 1;
  ClientHeight := CloseBtn.Top + CloseBtn.Height;
  MainPanel.Align := alClient;
  { position the form at the top of display }
  Left := 0;
  Top := 0;
  { initialize ReportSmith }
  InitRSRUN;
end;

procedure TMainForm.BrowseParts(Sender: TObject);
begin
  BrPartsForm.Show;
end;


procedure TMainForm.ToggleStayonTop(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    if Checked then MainForm.FormStyle := fsStayOnTop
    else MainForm.FormStyle := fsNormal;
  end;
end;

procedure TMainForm.NewOrder(Sender: TObject);
begin
  EdOrderForm.Enter;
end;

procedure TMainForm.HelpBtnClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TMainForm.PrinterSetupClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;

procedure TMainForm.AboutClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Application.HelpCommand(HELP_QUIT,0);
end;

procedure TMainForm.CloseAllWindows;
var
  I: Integer;
  F: TForm;
begin
  for I := 0 to Application.ComponentCount - 1 do
  begin
    if Application.Components[I] is TForm then
    begin
      F := TForm(Application.Components[I]);
      if (F <> Self) and (F.Visible) then F.Close;
    end;
  end;
end;

procedure TMainForm.ViewLocalClick(Sender: TObject);
begin
  CloseAllWindows;
  MastData.UseLocalData;
  ViewLocal.Checked := True;
  Caption := Application.Title + ' (Paradox Data)';
end;

procedure TMainForm.ViewRemoteClick(Sender: TObject);
begin
  CloseAllWindows;
  MastData.UseRemoteData;
  ViewRemote.Checked := True;
  Caption := Application.Title + ' (Local Interbase)';
end;

procedure TMainForm.ViewMenuClick(Sender: TObject);
begin
  { Enable the Remote data menu item only if local Interbase is running }
  ViewRemote.Enabled := FindWindow(NIL, 'InterBase Server') <> 0;
end;

procedure TMainForm.ReportBtnClick(Sender: TObject);
begin
  with PickRpt do
  if ShowModal = mrOK then
    Case ReportType.ItemIndex of
      0: PrintCustomerReport( Preview );
      1: PrintOrderReport( Preview );
      2: PrintInvoiceReport( Preview );
    end;
end;

procedure TMainForm.PrintCustomerReport(Preview: Boolean);
begin
  with MastData.CustByLastInvQuery do
  begin
    Open;
    ShowMessage('Here should be Customer By Invoice report');
    Close;
  end;
end;

procedure TMainForm.PrintOrderReport(Preview: Boolean);
const
  FromToHeading = 'From ''%s'' To ''%s''';
begin
  // Request the 'From' and 'To' dates from the user.
  with QueryCustDlg do
  begin
    MsgLab.Caption := 'Print all orders ranging:';
    if FromDate = 0 then FromDate := EncodeDate(95, 01, 01);
    if ToDate = 0 then ToDate := Now;

    if ShowModal = mrOk then
    with MastData.OrdersByDateQuery do
    begin
      Close;
      Params.ParamByName('FromDate').AsDate := FromDate;
      Params.ParamByName('ToDate').AsDate := ToDate;
      Open;

      // Format the From To header with the user's dates entered
      ShowMessage('Here should be Orders By Date report');
      Close;
     end;
   end;
end;

procedure TMainForm.PrintInvoiceReport(Preview: Boolean);
begin
  if PickOrderNoDlg.ShowModal = mrOk then
    ShowMessage('Here should be Invoice By OrderNo report');
end;

procedure TMainForm.OrderReport(Sender: TObject);
begin
  PrintOrderReport(False); // print-no preview
end;

procedure TMainForm.CustomerReport(Sender: TObject);
begin
  PrintCustomerReport(False); // print-no preview
end;

procedure TMainForm.InvoiceReport(Sender: TObject);
begin
  PrintInvoiceReport(False); // print-no preview
end;

end.
