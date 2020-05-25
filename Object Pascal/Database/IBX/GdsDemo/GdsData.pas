//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit GdsData;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Mask,
  DBCtrls, GdsStd, IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBTable;

type
  TStdDataForm = class(TGDSStdForm)
    StdCtrlPanel: TPanel;
    FilterOnRadioGroup: TRadioGroup;
    OrdersSource: TDataSource;
    GroupBox1: TGroupBox;
    FilterOnLabel: TLabel;
    FilterCriteria: TEdit;
    FilterCheckBox: TCheckBox;
    NextBtn: TButton;
    PriorBtn: TButton;
    Orders: TIBDataSet;
    IBTransaction1: TIBTransaction;
    Database: TIBDatabase;
    Cust: TIBDataSet;
    CustCUSTNO: TFloatField;
    CustCOMPANY: TIBStringField;
    CustADDR1: TIBStringField;
    CustADDR2: TIBStringField;
    CustCITY: TIBStringField;
    CustSTATE: TIBStringField;
    CustZIP: TIBStringField;
    CustCOUNTRY: TIBStringField;
    CustPHONE: TIBStringField;
    CustFAX: TIBStringField;
    CustTAXRATE: TFloatField;
    CustCONTACT: TIBStringField;
    CustLASTINVOICEDATE: TDateTimeField;
    OrdersAmountDue: TFloatField;
    OrdersTaxAmount: TFloatField;
    OrdersCustName: TStringField;
    OrdersORDERNO: TFloatField;
    OrdersCUSTNO: TFloatField;
    OrdersSALEDATE: TDateTimeField;
    OrdersSHIPDATE: TDateTimeField;
    OrdersEMPNO: TIntegerField;
    OrdersSHIPTOCONTACT: TIBStringField;
    OrdersSHIPTOADDR1: TIBStringField;
    OrdersSHIPTOADDR2: TIBStringField;
    OrdersSHIPTOCITY: TIBStringField;
    OrdersSHIPTOSTATE: TIBStringField;
    OrdersSHIPTOZIP: TIBStringField;
    OrdersSHIPTOCOUNTRY: TIBStringField;
    OrdersSHIPTOPHONE: TIBStringField;
    OrdersSHIPVIA: TIBStringField;
    OrdersPO: TIBStringField;
    OrdersTERMS: TIBStringField;
    OrdersPAYMENTMETHOD: TIBStringField;
    OrdersITEMSTOTAL: TFloatField;
    OrdersTAXRATE: TFloatField;
    OrdersFREIGHT: TFloatField;
    OrdersAMOUNTPAID: TFloatField;
    procedure FilterOnRadioGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OrdersFilterOnDate(DataSet: TDataSet; var Accept: Boolean);
    procedure OrdersFilterOnAmount(DataSet: TDataSet; var Accept: Boolean);
    procedure FilterCheckBoxClick(Sender: TObject);
    procedure PriorBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure FilterCriteriaExit(Sender: TObject);
    procedure FilterCriteriaKeyPress(Sender: TObject; var Key: Char);
    procedure OrdersCalcFields(DataSet: TDataSet);
  protected
    FLastAmount: Double;
    FLastDate: TDateTime;
    function CalcAmountDue: Double;
    procedure ConvertFilterCriteria;
  end;

var
  StdDataForm: TStdDataForm;

implementation

{$R *.dfm}

procedure TStdDataForm.FilterOnRadioGroupClick(Sender: TObject);
begin
  inherited;
  with FilterOnRadioGroup do
  begin
    FilterOnLabel.Caption := Format('Records where %S >=', [Items[ItemIndex]]);
    case ItemIndex of
      0: begin
           Orders.OnFilterRecord := OrdersFilterOnDate;
           FilterCriteria.Text := DateToStr(FLastDate);
         end;
      1: begin
           Orders.OnFilterRecord := OrdersFilterOnAmount;
           FilterCriteria.Text := FloatToStr(FLastAmount);
         end;
    end;
    ActiveControl := FilterCriteria;
  end;
  if Orders.Filtered then Orders.Refresh;
end;

procedure TStdDataForm.FormCreate(Sender: TObject);
begin
  inherited;
  FLastDate := EncodeDate(2010, 1, 1);
  FLastAmount := 1000;
  FilterOnRadioGroup.ItemIndex := 0;
end;

{ Calculate the value of AmountDue. Used in the OnCalcFields
  and OnFilterRecord event handlers. }

function TStdDataForm.CalcAmountDue: Double;
begin
  Result := Orders.FieldByName('ItemsTotal').AsFloat * (1.0 + Orders.FieldByName('TaxRate').AsFloat / 100) +
    Orders.FieldByName('freight').AsFloat - Orders.FieldByName('AmountPaid').AsFloat;
end;

{ Convert the FilterCriteria text into a Date or Float.  This value
  will be used in the OnFilterRecord callback instead of using the
  FilterCriteria directly, so that the string does not need to be
  converted each time the event is triggered. }

procedure TStdDataForm.ConvertFilterCriteria;
begin
  if FilterCriteria.Text <> '' then
    case FilterOnRadioGroup.ItemIndex of
      0: FLastDate := StrToDate(FilterCriteria.Text);
      1: FLastAmount := StrToFloat(FilterCriteria.Text);
    end;
  if Orders.Filtered then Orders.Refresh;
end;

{ Try to convert the filter criteria whenever the edit control
  looses focus, or the user presses enter }

procedure TStdDataForm.FilterCriteriaExit(Sender: TObject);
begin
  inherited;
  ConvertFilterCriteria;
end;

procedure TStdDataForm.FilterCriteriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    ConvertFilterCriteria;
    Key := #0
  end;
end;

{ Calculate this order's total on the fly. Include in the dataset
  if its amount is greater than or equal to the specified filter
  criteria. Note that calculated and lookup fields are undefined
  in an OnFilterRecord event handler. }
procedure TStdDataForm.OrdersCalcFields(DataSet: TDataSet);
begin
  inherited;
  OrdersTaxAmount.Value := Orders.FieldByName('ItemsTotal').AsFloat * (Orders.FieldByName('TaxRate').AsFloat / 100);
  OrdersAmountDue.Value := CalcAmountDue;
end;

procedure TStdDataForm.OrdersFilterOnAmount(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := CalcAmountDue >= FLastAmount;
end;

{ Include this order in the dataset if its date is greater
  than or equal to the specified filter criteria. }
procedure TStdDataForm.OrdersFilterOnDate(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := Orders.FieldByName('SaleDate').Value >= FLastDate;
end;

{ Store contents of filter criteria from edit control }
procedure TStdDataForm.FilterCheckBoxClick(Sender: TObject);
begin
  inherited;
  ConvertFilterCriteria;
  Orders.Filtered := FilterCheckBox.Checked;
  NextBtn.Enabled := not FilterCheckBox.Checked;
  PriorBtn.Enabled := not FilterCheckBox.Checked;
end;

{ Button handlers for new filter-oriented dataset navigation methods }
procedure TStdDataForm.PriorBtnClick(Sender: TObject);
begin
  inherited;
  ConvertFilterCriteria;
  Orders.FindPrior;
end;

procedure TStdDataForm.NextBtnClick(Sender: TObject);
begin
  inherited;
  ConvertFilterCriteria;
  Orders.FindNext;
end;

end.
