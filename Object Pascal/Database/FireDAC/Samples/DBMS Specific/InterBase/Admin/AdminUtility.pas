//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit AdminUtility;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, System.Rtti, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Menus, System.Actions,
  FMX.ActnList, Data.Bind.Grid, FMX.Edit, FMX.ListBox, FMX.Grid, FMX.TabControl,
  FMX.ScrollBox, FMX.Controls.Presentation;

type
  TForm14 = class(TForm)
    BindingsList1: TBindingsList;
    ActionList1: TActionList;
    actRefreshUsers: TAction;
    tcMain: TTabControl;
    tabUsers: TTabItem;
    StringGridBindSourceDB1: TStringGrid;
    expServer: TExpander;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    edtHost: TEdit;
    ListBoxItem2: TListBoxItem;
    edtUserName: TEdit;
    ListBoxItem3: TListBoxItem;
    edtPassword: TEdit;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem4: TListBoxItem;
    edtUserSecEUADatabase: TEdit;
    ListBoxItem5: TListBoxItem;
    edtSEPassword: TEdit;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    Label1: TLabel;
    bsUsers: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    tabBackup: TTabItem;
    tabRestore: TTabItem;
    tabValidate: TTabItem;
    Expander1: TExpander;
    ListBox2: TListBox;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    Expander2: TExpander;
    ListBox3: TListBox;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    ListBoxItem6: TListBoxItem;
    edtBackupDBPath: TEdit;
    Expander4: TExpander;
    ListBox5: TListBox;
    ListBoxGroupHeader6: TListBoxGroupHeader;
    ListBoxItem8: TListBoxItem;
    edtValidateDBPath: TEdit;
    ListBoxItem9: TListBoxItem;
    edtBackupBackupPath: TEdit;
    OpenDialog1: TOpenDialog;
    Expander3: TExpander;
    ListBox4: TListBox;
    ListBoxGroupHeader5: TListBoxGroupHeader;
    ListBoxItem7: TListBoxItem;
    edtRestoreRestoreToPath: TEdit;
    ListBoxItem10: TListBoxItem;
    edtRestoreBackupPath: TEdit;
    btnBackup: TButton;
    btnRestore: TButton;
    btnValidate: TButton;
    actBackup: TAction;
    actRestore: TAction;
    actValidate: TAction;
    ListBox6: TListBox;
    ListBoxGroupHeader7: TListBoxGroupHeader;
    ListBoxItem11: TListBoxItem;
    cbBackup_IgnoreCheckSum: TCheckBox;
    cbBackup_IgnoreLimboTransactions: TCheckBox;
    cbBackup_MetaDataOnly: TCheckBox;
    cbBackup_NoGarbageCollection: TCheckBox;
    cbBackup_OldDescriptions: TCheckBox;
    cbBackup_NonTransportable: TCheckBox;
    cbBackup_Convert: TCheckBox;
    cbBackup_Expand: TCheckBox;
    MemoBackup: TMemo;
    ListBox7: TListBox;
    ListBoxGroupHeader8: TListBoxGroupHeader;
    ListBoxItem12: TListBoxItem;
    cbRestore_Replace: TCheckBox;
    cbRestore_DeactivateIdx: TCheckBox;
    cbRestore_FixFFSData: TCheckBox;
    cbRestore_NoValidity: TCheckBox;
    cbRestore_NoShadow: TCheckBox;
    cbRestore_OneAtATime: TCheckBox;
    cbRestore_UseAllSpace: TCheckBox;
    MemoRestore: TMemo;
    cbRestore_FixFSSMetaData: TCheckBox;
    cbRestore_Validate: TCheckBox;
    cbRestore_MetaDataOnly: TCheckBox;
    ListBox8: TListBox;
    ListBoxGroupHeader9: TListBoxGroupHeader;
    ListBoxItem13: TListBoxItem;
    cbValidate_ValidateFull: TCheckBox;
    cbValidate_ValidatePages: TCheckBox;
    cbValidate_IgnoreCheckSum: TCheckBox;
    cbValidate_MendRecords: TCheckBox;
    cbValidate_KillShaddows: TCheckBox;
    memoValidate: TMemo;
    procedure GetDataBaseRestorePath(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetDataBaseFilePath(Sender: TObject);
    procedure actRefreshUsersExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actRestoreExecute(Sender: TObject);
    procedure actValidateExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure GetFile(Sender : TObject; Filter : string);
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation


uses dmAdmin;
{$R *.fmx}

procedure TForm14.GetDataBaseRestorePath(Sender: TObject);
begin
  GetFile(Sender,'InterBase Backups|*.ibk;*.gbk');
end;

procedure TForm14.GetFile(Sender: TObject; Filter: string);
var
  Edit : TEdit;
begin
  if not (Sender is TEdit) then
    Exit;

  Edit := (Sender as TEdit);
  OpenDialog1.FileName := Edit.Text;
  OpenDialog1.Filter := Filter;
  if OpenDialog1.Execute then
    Edit.Text := OpenDialog1.FileName;
end;

procedure TForm14.GetDataBaseFilePath(Sender: TObject);
begin
  GetFile(Sender,'InterBase Database|*.ib;*.gdb');
end;

procedure TForm14.actBackupExecute(Sender: TObject);
begin
  AdminDM.StartBackupInterBaseDB(edtHost.Text,
                           edtUserName.Text,
                           edtPassword.Text,
                           edtBackupDBPath.Text,
                           edtBackupBackupPath.Text,
                           edtSEPassword.Text,
                           cbBackup_IgnoreCheckSum.IsChecked,
                           cbBackup_IgnoreLimboTransactions.IsChecked,
                           cbBackup_MetaDataOnly.IsChecked,
                           cbBackup_NoGarbageCollection.IsChecked,
                           cbBackup_OldDescriptions.IsChecked,
                           cbBackup_NonTransportable.IsChecked,
                           cbBackup_Convert.IsChecked,
                           cbBackup_Expand.IsChecked,
                           memoBackup.Lines);
end;

procedure TForm14.actRefreshUsersExecute(Sender: TObject);
begin
  AdminDM.LoadInterBaseUsers(edtHost.Text,
                             edtUserName.Text,
                             edtPassword.Text,
                             edtUserSecEUADatabase.Text,
                             edtSEPassword.Text);
end;

procedure TForm14.actRestoreExecute(Sender: TObject);
begin
  AdminDM.StartRestoreInterBaseDB(edtHost.Text,
                             edtUserName.Text,
                             edtPassword.Text,
                             edtRestoreBackupPath.Text,
                             edtRestoreRestoreToPath.Text,
                             edtSEPassword.Text,
                             cbRestore_Replace.IsChecked,
                             cbRestore_DeactivateIdx.IsChecked,
                             cbRestore_FixFFSData.IsChecked,
                             cbRestore_NoValidity.IsChecked,
                             cbRestore_NoShadow.IsChecked,
                             cbRestore_OneAtATime.IsChecked,
                             cbRestore_UseAllSpace.IsChecked,
                             cbRestore_FixFSSMetaData.IsChecked,
                             cbRestore_Validate.IsChecked,
                             cbRestore_MetaDataOnly.IsChecked,
                             memoRestore.Lines);
end;

procedure TForm14.actValidateExecute(Sender: TObject);
begin
  AdminDM.StartValidateInterBaseDB(edtHost.Text,
                              edtUserName.Text,
                              edtPassword.Text,
                              edtValidateDBPath.Text,
                              edtSEPassword.Text,
                              cbValidate_ValidateFull.IsChecked,
                              cbValidate_ValidatePages.IsChecked,
                              cbValidate_IgnoreCheckSum.IsChecked,
                              cbValidate_MendRecords.IsChecked,
                              cbValidate_KillShaddows.IsChecked,
                              memoValidate.Lines);
end;

procedure TForm14.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if AdminDM.IsProcessing then begin
    CanClose := False;
    ShowMessage('Processes are running - Please wait');
  end;
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
  tcMain.ActiveTab := tcMain.Tabs[0];
end;

end.
