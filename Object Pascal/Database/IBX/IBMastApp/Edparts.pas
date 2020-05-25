//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Edparts;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, ExtCtrls, Mask, DBCtrls,
  Buttons, System.UITypes;

type
  TEdPartsForm = class(TForm)
    Panel1: TPanel;
    Navigator: TDBNavigator;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdPartNo: TDBEdit;
    PrintBtn: TSpeedButton;
    DataComboBox1: TDBLookupComboBox;
    Bevel1: TBevel;
    PartsSource1: TDataSource;
    DBCheckBox1: TDBCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure PrintBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  public
    procedure Edit(PartNo: Double);
  end;

var
  EdPartsForm: TEdPartsForm;

implementation

{$R *.dfm}

uses DataMod;


procedure TEdPartsForm.Edit(PartNo: Double);
begin
  MastData.Parts.Open;
  MastData.Parts.Locate('PartNo', PartNo, []);
  ShowModal;
end;

procedure TEdPartsForm.PrintBtnClick(Sender: TObject);
begin
  if MessageDlg('   Print this form?', mtConfirmation, [mbYes,mbNo], 0)
    = mrYes then Print;
end;

procedure TEdPartsForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := MastData.DataSetApplyUpdates(MastData.Parts, ModalResult = mrOK);
  if CanClose then
    MastData.Transaction.CommitRetaining;

end;

end.
