//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit frmAddCertificate;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, dialogs;

type
  TAddDlg = class(TForm)
    Label1: TLabel;
    edID: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edKey: TEdit;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure clearedits;
  public
    { Public declarations }
  end;

var
  AddDlg: TAddDlg;

implementation

uses umain;

{$R *.dfm}

procedure TAddDlg.OKBtnClick(Sender: TObject);
begin
  with Form1.IBLicensingService1 do
  begin
    ID := trim(edID.text);
    Key := trim(edKey.text);
    try
      AddLicense;
      ClearEdits;
      self.ModalResult := mrOK;
    except
      ShowMessage('The certificate could not be validated based on the information given. Please recheck the id and key information.');
    end;
  end;
end;

procedure TAddDlg.CancelBtnClick(Sender: TObject);
begin
  ClearEdits;
end;

procedure TAddDlg.clearedits;
begin
  edId.text := '';
  edKey.Text := '';
end;

end.

