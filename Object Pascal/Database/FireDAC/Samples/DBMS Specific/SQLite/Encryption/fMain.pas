unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Def,
  FireDAC.FMXUI.Wait, FMX.Controls.Presentation, FMX.StdCtrls, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Stan.Intf, FMX.TabControl, FMX.Edit,
  FMX.ScrollBox, FMX.Memo, FireDAC.UI.Intf, FireDAC.Stan.Async,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Pool,
  Data.DB, FireDAC.Comp.Client, FMX.ListBox, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, System.Rtti, FMX.Grid.Style, FMX.Grid,
  FireDAC.Comp.DataSet, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TFrmMain = class(TForm)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDSQLiteSecurity1: TFDSQLiteSecurity;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Label1: TLabel;
    edtPath: TEdit;
    mmSQLScript: TMemo;
    FDScript1: TFDScript;
    FDConnection1: TFDConnection;
    btnCreateDB: TButton;
    btnDropDB: TButton;
    btnEncrypt: TButton;
    btnChange: TButton;
    Label6: TLabel;
    edtNewPwd: TEdit;
    btnGetState: TButton;
    cbMode: TComboBox;
    Label3: TLabel;
    edtPwd: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    lblState: TLabel;
    btnDecrypt: TButton;
    FDQuery1: TFDQuery;
    Grid1: TGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btnCreateDBClick(Sender: TObject);
    procedure btnDropDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEncryptClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnGetStateClick(Sender: TObject);
    procedure btnDecryptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  FireDAC.Stan.Cipher;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  edtPath.Text := TPath.GetTempPath + 'test.sdb';
  // Get the list of registered cipher algorythms
  cbMode.Items.Delimiter := ';';
  cbMode.Items.DelimitedText := FDCipherGetClasses();
  cbMode.ItemIndex := 0;
end;

procedure TFrmMain.btnCreateDBClick(Sender: TObject);
begin
  FDConnection1.Connected := False;

  // Create empty unencrypted database. Note, the database may be encrypted
  // from the beginning, if to specify Password connection parameter. But for
  // sake of demonstration, that is performed separately on "Encrypt DB" page.
  FDConnection1.Params.Clear;
  FDConnection1.Params.DriverID := 'SQLite';
  FDConnection1.Params.Database := edtPath.Text;
  FDConnection1.Connected := True;

  // Populate new empty unencrypted database.
  FDScript1.ExecuteScript(mmSQLScript.Lines);
end;

procedure TFrmMain.btnDropDBClick(Sender: TObject);
begin
  FDConnection1.Connected := False;

  if TFile.Exists(edtPath.Text) then
    TFile.Delete(edtPath.Text);
end;

procedure TFrmMain.btnEncryptClick(Sender: TObject);
begin
  FDConnection1.Connected := False;

  // Use TFDSQLiteSecurity.SetPassword to encrypt database. There the Password
  // property value is of <encryption algorythm>:<password> format.
  FDSQLiteSecurity1.Database := edtPath.Text;
  FDSQLiteSecurity1.Password := cbMode.Items[cbMode.ItemIndex] + ':' + edtPwd.Text;
  FDSQLiteSecurity1.SetPassword;
end;

procedure TFrmMain.btnChangeClick(Sender: TObject);
begin
  FDConnection1.Connected := False;

  // Use TFDSQLiteSecurity.ChangePassword to change encrypt database password.
  FDSQLiteSecurity1.Database := edtPath.Text;
  FDSQLiteSecurity1.Password := cbMode.Items[cbMode.ItemIndex] + ':' + edtPwd.Text;
  FDSQLiteSecurity1.ToPassword := cbMode.Items[cbMode.ItemIndex] + ':' + edtNewPwd.Text;
  FDSQLiteSecurity1.ChangePassword;

  edtPwd.Text := edtNewPwd.Text;
end;

procedure TFrmMain.btnGetStateClick(Sender: TObject);
begin
  FDConnection1.Connected := False;

  // Use TFDSQLiteSecurity.CheckEncryption to request database encryption status:
  // <unencrypted> - database is unencrypted.
  // <encrypted> - database is encrypted, but the algorythm / password is wrong.
  // encryption algorythm name - database is encrypted, and the algorythm / password are correct.
  FDSQLiteSecurity1.Database := edtPath.Text;
  FDSQLiteSecurity1.Password := cbMode.Items[cbMode.ItemIndex] + ':' + edtPwd.Text;
  lblState.Text := FDSQLiteSecurity1.CheckEncryption;

  if (lblState.Text <> '<unencrypted>') and
     (lblState.Text <> '<encrypted>') then begin
    FDConnection1.Params.Clear;
    FDConnection1.Params.DriverID := 'SQLite';
    FDConnection1.Params.Database := edtPath.Text;
    FDConnection1.Params.Values['Encrypt'] := cbMode.Items[cbMode.ItemIndex];
    FDConnection1.Params.Password := edtPwd.Text;
    FDConnection1.Connected := True;
    FDQuery1.Open('select * from tab');
  end;
end;

procedure TFrmMain.btnDecryptClick(Sender: TObject);
begin
  FDConnection1.Connected := False;

  // Use TFDSQLiteSecurity.RemovePassword to unencrypt database.
  FDSQLiteSecurity1.Database := edtPath.Text;
  FDSQLiteSecurity1.Password := cbMode.Items[cbMode.ItemIndex] + ':' + edtPwd.Text;
  FDSQLiteSecurity1.RemovePassword;
end;

end.
