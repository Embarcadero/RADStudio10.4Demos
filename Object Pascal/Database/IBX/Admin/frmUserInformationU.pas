//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit frmUserInformationU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, IBX.IBServices;

type
  TfrmUserInformation = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtConfirmPassword: TEdit;
    edtPassword: TEdit;
    edtUser: TEdit;
    Label4: TLabel;
    edtFirstName: TEdit;
    Label5: TLabel;
    edtMiddleName: TEdit;
    Label6: TLabel;
    edtLastName: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    ActionList1: TActionList;
    Ok: TAction;
    procedure OkUpdate(Sender: TObject);
    procedure OkExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIBSecurityService: TIBSecurityService;
    { Private declarations }
    procedure RetrieveInfo;
  public
    procedure DisplayUser(UserName : String);
    property SecurityService : TIBSecurityService read FIBSecurityService write FIBSecurityService;
    { Public declarations }
  end;

var
  frmUserInformation: TfrmUserInformation;

implementation

uses frmAdminToolU;

{$R *.dfm}

{ TfrmUserInformation }

procedure TfrmUserInformation.DisplayUser(UserName: String);
begin
  SecurityService.Active := true;
  try
    if UserName <> '' then
    begin
      SecurityService.DisplayUser(UserName);
      edtUser.Text := SecurityService.UserInfo[0].UserName;
      edtUser.ReadOnly := true;
      edtPassword.Text := '';
      edtConfirmPassword.Text := '';
      edtFirstName.Text := SecurityService.UserInfo[0].FirstName;
      edtMiddleName.Text := SecurityService.UserInfo[0].MiddleName;
      edtLastName.Text := SecurityService.UserInfo[0].LastName;
      SecurityService.SecurityAction := ActionModifyUser;
    end
    else
    begin
      edtUser.Text := '';
      edtUser.ReadOnly := false;
      edtPassword.Text := '';
      edtConfirmPassword.Text := '';
      edtFirstName.Text := '';
      edtMiddleName.Text := '';
      edtLastName.Text := '';
      SecurityService.SecurityAction := ActionAddUser;
    end;
  finally
    SecurityService.Active := false;
  end;
end;

procedure TfrmUserInformation.RetrieveInfo;
begin
  if edtPassword.Text <> edtConfirmPassword.Text then
    raise Exception.Create('Passwords do not match');
  with SecurityService do
  begin
    UserName := edtUser.Text;
    Password := edtPassword.Text;
    FirstName := edtFirstName.Text;
    MiddleName := edtMiddleName.Text;
    LastName := edtLastName.Text;
  end;
end;

procedure TfrmUserInformation.OkUpdate(Sender: TObject);
begin
 TAction(Sender).Enabled := (edtPassword.Text = edtConfirmPassword.Text) and
    (edtUser.Text <> '');
end;

procedure TfrmUserInformation.OkExecute(Sender: TObject);
begin
  RetrieveInfo;
  SecurityService.Active := true;
  if SecurityService.SecurityAction = ActionAddUser then
    SecurityService.AddUser
  else
    SecurityService.ModifyUser;
  SecurityService.Active := false;
end;

procedure TfrmUserInformation.FormShow(Sender: TObject);
begin
  if edtUser.Text = '' then
    edtUser.SetFocus
  else
    edtPassword.SetFocus;
end;

end.
