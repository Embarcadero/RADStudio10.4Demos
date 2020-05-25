
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit Edcust;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons;

type
  TEdCustForm = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdCustNo: TDBEdit;
    DBEdName: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdInv: TDBEdit;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    Panel: TPanel;
    DBNavigator: TDBNavigator;
    PrintBtn: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label10: TLabel;
    Panel1: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
    procedure PrintBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  public
    procedure Edit(CustNo: Double);
  end;

var
  EdCustForm: TEdCustForm;

implementation

{$R *.dfm}

uses DataMod;

procedure TEdCustForm.Edit(CustNo: Double);
begin
  MastData.Cust.Open;
  MastData.Cust.Locate('CustNo', CustNo, []);
  ShowModal;
end;

procedure TEdCustForm.PrintBtnClick(Sender: TObject);
begin
  if MessageDlg('   Print this form?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    Print;
end;

procedure TEdCustForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := MastData.DataSetApplyUpdates(MastData.Cust, ModalResult = mrOK);
end;

end.
