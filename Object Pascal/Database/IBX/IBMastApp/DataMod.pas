//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit DataMod;

{ See the comments in MAIN.PAS for information about this project }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, IBX.IBQuery, IBX.IBCustomDataSet, IBX.IBTable, IBX.IBDatabase, IBX.IB,
  Variants, VarUtils,
  System.UITypes;

type
  TMastData = class(TDataModule)
    Database: TIBDatabase;
    PartsQuery: TIBQuery;
    PartsQueryPartNo: TFloatField;
    PartsQueryDescription: TIBStringField;
    PartsQueryOnHand: TFloatField;
    PartsQueryOnOrder: TFloatField;
    PartsQueryVendorNo: TFloatField;
    PartsQueryCost: TCurrencyField;
    PartsQueryListPrice: TCurrencyField;
    PartsQueryBackOrd: TBooleanField;
    LastItemQuery: TIBQuery;
    CustQuery: TIBQuery;
    CustQueryCustNo: TFloatField;
    CustQueryCompany: TIBStringField;
    CustQueryPhone: TIBStringField;
    CustQueryLastInvoiceDate: TDateTimeField;
    CustByLastInvQuery: TIBQuery;
    CustByLastInvQueryCustNo: TFloatField;
    CustByLastInvQueryCompany: TIBStringField;
    CustByLastInvQueryAddr1: TIBStringField;
    CustByLastInvQueryAddr2: TIBStringField;
    CustByLastInvQueryCity: TIBStringField;
    CustByLastInvQueryState: TIBStringField;
    CustByLastInvQueryZip: TIBStringField;
    CustByLastInvQueryCountry: TIBStringField;
    CustByLastInvQueryPhone: TIBStringField;
    CustByLastInvQueryFAX: TIBStringField;
    CustByLastInvQueryTaxRate: TFloatField;
    CustByLastInvQueryContact: TIBStringField;
    CustByLastInvQueryLastInvoiceDate: TDateTimeField;
    OrdersByDateQuery: TIBQuery;
    OrdersByDateQueryOrderNo: TFloatField;
    OrdersByDateQueryCustNo: TFloatField;
    OrdersByDateQuerySaleDate: TDateTimeField;
    OrdersByDateQueryShipDate: TDateTimeField;
    OrdersByDateQueryEmpNo: TIntegerField;
    OrdersByDateQueryShipToContact: TIBStringField;
    OrdersByDateQueryShipToAddr1: TIBStringField;
    OrdersByDateQueryShipToAddr2: TIBStringField;
    OrdersByDateQueryShipToCity: TIBStringField;
    OrdersByDateQueryShipToState: TIBStringField;
    OrdersByDateQueryShipToZip: TIBStringField;
    OrdersByDateQueryShipToCountry: TIBStringField;
    OrdersByDateQueryShipToPhone: TIBStringField;
    OrdersByDateQueryShipVIA: TIBStringField;
    OrdersByDateQueryPO: TIBStringField;
    OrdersByDateQueryTerms: TIBStringField;
    OrdersByDateQueryPaymentMethod: TIBStringField;
    OrdersByDateQueryItemsTotal: TCurrencyField;
    OrdersByDateQueryTaxRate: TFloatField;
    OrdersByDateQueryFreight: TCurrencyField;
    OrdersByDateQueryAmountPaid: TCurrencyField;
    OrdersByDateQueryCompany: TIBStringField;
    Transaction: TIBTransaction;
    OpenDialog: TOpenDialog;
    OrdersSource: TDataSource;
    CustByOrdSrc: TDataSource;
    ItemsSource: TDataSource;
    PartsSource: TDataSource;
    EmpsSource: TDataSource;
    VendorSource: TDataSource;
    CustSource: TDataSource;
    CustMasterSrc: TDataSource;
    OrdByCustSrc: TDataSource;
    CustByCompSrc: TDataSource;
    Orders: TIBDataSet;
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
    OrdersTAXTOTAL: TFloatField;
    OrdersAMOUNTDUE: TFloatField;
    OrdersSALESPERSON: TStringField;
    CustByOrd: TIBDataSet;
    Items: TIBDataSet;
    CustByOrdCUSTNO: TFloatField;
    CustByOrdCOMPANY: TIBStringField;
    CustByOrdADDR1: TIBStringField;
    CustByOrdADDR2: TIBStringField;
    CustByOrdCITY: TIBStringField;
    CustByOrdSTATE: TIBStringField;
    CustByOrdZIP: TIBStringField;
    CustByOrdCOUNTRY: TIBStringField;
    CustByOrdPHONE: TIBStringField;
    CustByOrdFAX: TIBStringField;
    CustByOrdTAXRATE: TFloatField;
    CustByOrdCONTACT: TIBStringField;
    CustByOrdLASTINVOICEDATE: TDateTimeField;
    ItemsITEMNO: TFloatField;
    ItemsORDERNO: TFloatField;
    ItemsPARTNO: TFloatField;
    ItemsQTY: TIntegerField;
    ItemsDISCOUNT: TFloatField;
    ItemsEXTPRICE: TFloatField;
    ItemsDESCRIPTION: TStringField;
    ItemsSELLPRICE: TCurrencyField;
    Parts: TIBDataSet;
    PartsPARTNO: TFloatField;
    PartsVENDORNO: TFloatField;
    PartsDESCRIPTION: TIBStringField;
    PartsONHAND: TFloatField;
    PartsONORDER: TFloatField;
    PartsCOST: TFloatField;
    PartsLISTPRICE: TFloatField;
    PartsBACKORD: TBooleanField;
    Emps: TIBDataSet;
    EmpsEMPNO: TIntegerField;
    EmpsLASTNAME: TIBStringField;
    EmpsFIRSTNAME: TIBStringField;
    EmpsPHONEEXT: TIBStringField;
    EmpsHIREDATE: TDateTimeField;
    EmpsSALARY: TFloatField;
    Vendors: TIBDataSet;
    VendorsVENDORNO: TFloatField;
    VendorsVENDORNAME: TIBStringField;
    VendorsADDRESS1: TIBStringField;
    VendorsADDRESS2: TIBStringField;
    VendorsCITY: TIBStringField;
    VendorsSTATE: TIBStringField;
    VendorsZIP: TIBStringField;
    VendorsCOUNTRY: TIBStringField;
    VendorsPHONE: TIBStringField;
    VendorsFAX: TIBStringField;
    VendorsPREFERRED: TIBStringField;
    EmpsFULLNAME: TIBStringField;
    NextCust: TIBDataSet;
    NextCustNEWCUST: TFloatField;
    NextOrd: TIBDataSet;
    CustByComp: TIBDataSet;
    CustByCompCUSTNO: TFloatField;
    CustByCompCOMPANY: TIBStringField;
    CustByCompADDR1: TIBStringField;
    CustByCompADDR2: TIBStringField;
    CustByCompCITY: TIBStringField;
    CustByCompSTATE: TIBStringField;
    CustByCompZIP: TIBStringField;
    CustByCompCOUNTRY: TIBStringField;
    CustByCompPHONE: TIBStringField;
    CustByCompFAX: TIBStringField;
    CustByCompTAXRATE: TFloatField;
    CustByCompCONTACT: TIBStringField;
    CustByCompLASTINVOICEDATE: TDateTimeField;
    NextOrdNEWKEY: TFloatField;
    Cust: TIBDataSet;
    OrdByCust: TIBDataSet;
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
    OrdByCustORDERNO: TFloatField;
    OrdByCustCUSTNO: TFloatField;
    OrdByCustSALEDATE: TDateTimeField;
    OrdByCustSHIPDATE: TDateTimeField;
    OrdByCustITEMSTOTAL: TCurrencyField;
    OrdByCustTAXRATE: TFloatField;
    OrdByCustFREIGHT: TCurrencyField;
    OrdByCustAMOUNTPAID: TCurrencyField;
    OrdByCustAMOUNTDUE: TCurrencyField;
    procedure CustOldBeforeOpen(DataSet: TDataSet);
    procedure OrdByCustOldCalcFields(DataSet: TDataSet);
    procedure CustOldBeforePost(DataSet: TDataSet);
    procedure EditUpdateError(DataSet: TIBDataSet; E: EIBInterbaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
    procedure MastDataCreate(Sender: TObject);
    procedure OrdersAfterCancel(DataSet: TDataSet);
    procedure OrdersAfterDelete(DataSet: TDataSet);
    procedure OrdersAfterPost(DataSet: TDataSet);
    procedure OrdersBeforeCancel(DataSet: TDataSet);
    procedure OrdersBeforeClose(DataSet: TDataSet);
    procedure OrdersBeforeDelete(DataSet: TDataSet);
    procedure OrdersBeforeEdit(DataSet: TDataSet);
    procedure OrdersBeforeInsert(DataSet: TDataSet);
    procedure OrdersBeforeOpen(DataSet: TDataSet);
    procedure OrdersCalcFields(DataSet: TDataSet);
    procedure OrdersNewRecord(DataSet: TDataSet);
    procedure OrdersFREIGHTValidate(Sender: TField);
    procedure OrdersSALEDATEValidate(Sender: TField);
    procedure ItemsAfterDelete(DataSet: TDataSet);
    procedure ItemsAfterPost(DataSet: TDataSet);
    procedure ItemsBeforeDelete(DataSet: TDataSet);
    procedure ItemsBeforeEdit(DataSet: TDataSet);
    procedure ItemsBeforeOpen(DataSet: TDataSet);
    procedure ItemsBeforePost(DataSet: TDataSet);
    procedure ItemsCalcFields(DataSet: TDataSet);
    procedure ItemsNewRecord(DataSet: TDataSet);
    procedure PartsBeforeOpen(DataSet: TDataSet);
    procedure PartsCalcFields(DataSet: TDataSet);
    procedure EmpsCalcFields(DataSet: TDataSet);
    procedure EnsureOrdersEdit(DataSet: TDataSet);
    procedure CustBeforeOpen(DataSet: TDataSet);
    procedure CustBeforePost(DataSet: TDataSet);

  private
    PrevPartNo: Double; { remembers Item's previous part# }
    PrevQty: Longint; { remembers Item's previous qty }
    DeletingItems: Boolean; { suppress totals calc. if deleting items }
    FItemNo: Integer;
    // procedure SetDatabaseAlias(AliasName: string);
    procedure UpdateTotals;
    procedure DeleteItems;
  public
    // procedure UseLocalData;
    // procedure UseRemoteData;
    function DataSetApplyUpdates(DataSet: TDataSet; Apply: Boolean): Boolean;
  end;

function Confirm(Msg: string): Boolean;

var
  MastData: TMastData;

implementation

{$R *.dfm}
{ Utility Functions }

function Confirm(Msg: string): Boolean;
begin
  Result := MessageDlg(Msg, mtConfirmation, mbYesNoCancel, 0) = mrYes;
end;

{ Event Handlers }

procedure TMastData.PartsBeforeOpen(DataSet: TDataSet);
begin
  Vendors.Open;
end;

procedure TMastData.PartsCalcFields(DataSet: TDataSet);
begin
  PartsBackOrd.Value := PartsOnOrder.Value > PartsOnHand.Value
end;

{ If user cancels the updates to the orders table, cancel the updates to
  the line items as well }

procedure TMastData.OrdersAfterCancel(DataSet: TDataSet);
begin
  Cust.CancelUpdates;
  Parts.CancelUpdates;
  Items.CancelUpdates;
  Orders.CancelUpdates;
end;

procedure TMastData.OrdersAfterDelete(DataSet: TDataSet);
begin
  Database.ApplyUpdates([Cust, Parts, Items, Orders]);
  Transaction.CommitRetaining;
end;

procedure TMastData.OrdersAfterPost(DataSet: TDataSet);
begin
  if Cust.Locate('CustNo', OrdersCustNo.Value, []) and
    (CustLastInvoiceDate.Value < OrdersShipDate.Value) then
  begin
    Cust.Edit;
    CustLastInvoiceDate.Value := OrdersShipDate.Value;
    Cust.Post;
  end;
  Database.ApplyUpdates([Orders, Items, Parts, Cust]);
  Transaction.CommitRetaining;
end;

procedure TMastData.OrdersBeforeCancel(DataSet: TDataSet);
begin
  if (Orders.State = dsInsert) and not(Items.BOF and Items.EOF) then
    if not Confirm('Cancel order being inserted and delete all line items?')
    then
      Abort;
end;

procedure TMastData.OrdersBeforeClose(DataSet: TDataSet);
begin
  Items.Close;
  Emps.Close;
  CustByOrd.Close;
end;

procedure TMastData.OrdersBeforeDelete(DataSet: TDataSet);
begin
  if not Confirm('Delete order and line items?') then
    Abort
  else
    DeleteItems;
end;

procedure TMastData.OrdersBeforeEdit(DataSet: TDataSet);
begin
  LastItemQuery.Close;
  LastItemQuery.Open;
  { SQL servers return Null for some aggregates if no items are present }
  with LastItemQuery.Fields[0] do
    if IsNull then
      FItemNo := 1
    else
      FItemNo := AsInteger + 1;
end;

procedure TMastData.OrdersBeforeInsert(DataSet: TDataSet);
begin
  if Orders.State in dsEditModes then
  begin
    if Confirm('An order is being processed.  Save changes and start a new one?')
    then
      Orders.Post
    else
      Abort;
  end;
  FItemNo := 1;
end;

procedure TMastData.OrdersBeforeOpen(DataSet: TDataSet);
begin
  CustByComp.Open;
  CustByOrd.Open;
  Cust.Open;
  Emps.Open;
  Items.Open;
end;

procedure TMastData.OrdersCalcFields(DataSet: TDataSet);
begin
  OrdersTAXTOTAL.Value := OrdersITEMSTOTAL.Value * (OrdersTAXRATE.Value / 100);
  OrdersAMOUNTDUE.Value := OrdersITEMSTOTAL.Value + OrdersTAXTOTAL.Value +
    OrdersFREIGHT.Value - OrdersAMOUNTPAID.Value;
end;

procedure TMastData.OrdersFREIGHTValidate(Sender: TField);
begin
  if OrdersFREIGHT.Value < 0 then
    raise Exception.Create('Freight cannot be less than zero');
end;

procedure TMastData.OrdersNewRecord(DataSet: TDataSet);
begin
  { Get the Next Order Value from the NextOrd Table }
  NextOrd.Open;
  try
    NextOrd.Edit;
    OrdersORDERNO.Value := NextOrdNewKey.Value;
    NextOrdNewKey.Value := NextOrdNewKey.Value + 1;
    NextOrd.Post;
  finally
    NextOrd.Close;
  end;
  OrdersSALEDATE.Value := Date;
  OrdersSHIPVIA.Value := 'UPS';
  OrdersTERMS.Value := 'net 30';
  OrdersPAYMENTMETHOD.Value := 'Check';
  OrdersITEMSTOTAL.Value := 0;
  OrdersTAXRATE.Value := 0;
  OrdersFREIGHT.Value := 0;
  OrdersAMOUNTPAID.Value := 0;
end;

procedure TMastData.OrdersSALEDATEValidate(Sender: TField);
begin
  if OrdersSALEDATE.Value > Now then
    raise Exception.Create('Cannot enter a future date');
end;

{ Order Entry }

{ Post new LastInvoiceDate to CUST table. }

procedure TMastData.ItemsAfterDelete(DataSet: TDataSet);
begin
  UpdateTotals;
end;

procedure TMastData.ItemsAfterPost(DataSet: TDataSet);

{ Reduce/increase Parts table's OnOrder field }

  procedure UpdateParts(PartNo: Double; Qty: Longint);
  begin
    if (PartNo > 0) and (Qty <> 0) then
      try
        if not Parts.Locate('PartNo', PartNo, []) then
          Abort;
        Parts.Edit;
        PartsOnOrder.Value := PartsOnOrder.Value + Qty;
        Parts.Post;
      except
        on E: Exception do
          ShowMessage(Format('Error updating parts table for PartNo: %d',
            [PartNo]));
      end;
  end;

begin
  { Maintain next available item number }
  Inc(FItemNo);
  UpdateTotals;
  if not((PrevPartNo = ItemsPartNo.Value) and (PrevQty = ItemsQty.Value)) then
  begin
    { Reduce previous Part#'s OnOrder field by previous Qty }
    UpdateParts(PrevPartNo, -PrevQty);
    { Increase new Part#'s OnOrder field by previous Qty }
    UpdateParts(ItemsPartNo.Value, ItemsQty.Value);
  end;
end;

procedure TMastData.ItemsBeforeDelete(DataSet: TDataSet);
begin
  Orders.Edit;
end;

procedure TMastData.ItemsBeforeEdit(DataSet: TDataSet);
begin
  Orders.Edit;
  PrevPartNo := ItemsPartNo.Value;
  PrevQty := ItemsQty.Value;
end;

procedure TMastData.ItemsBeforeOpen(DataSet: TDataSet);
begin
 Parts.Open;
end;

procedure TMastData.ItemsBeforePost(DataSet: TDataSet);
begin
  ItemsItemNo.Value := FItemNo;
end;

procedure TMastData.ItemsCalcFields(DataSet: TDataSet);
begin
  ItemsExtPrice.Value := ItemsQty.Value * ItemsSellPrice.Value *
    (100 - ItemsDiscount.Value) / 100;
end;

procedure TMastData.ItemsNewRecord(DataSet: TDataSet);
begin
  PrevPartNo := 0;
  PrevQty := 0;
  ItemsOrderNo.Value := OrdersORDERNO.Value;
  ItemsQty.Value := 1;
  ItemsDiscount.Value := 0;
end;

procedure TMastData.DeleteItems;
begin
  DeletingItems := True; { suppress recalc of totals during delete }
  Items.DisableControls; { for faster table traversal }
  try
    Items.First;
    while not Items.EOF do
      Items.Delete;
  finally
    DeletingItems := False;
    Items.EnableControls; { always re-enable controls after disabling }
  end;
end;

{ Steps through Items and gathers sum of ExtPrice. After OrdersItemsTotal
  is calculated, OrdersCalcFields is automatically called (which
  updates other calculated fields. }

procedure TMastData.UpdateTotals;
var
  TempTotal: Extended;
  PrevRecord: TBookmark;
begin
  if DeletingItems then
    Exit; { don't calculate if deleting all items }
  PrevRecord := Items.GetBookmark; { returns nil if table is empty }
  try
    Items.DisableControls;
    Items.First;
    TempTotal := 0; { use temp for efficiency }
    while not Items.EOF do
    begin
      TempTotal := TempTotal + ItemsExtPrice.Value;
      Items.Next;
    end;
    OrdersITEMSTOTAL.Value := TempTotal;
  finally
    Items.EnableControls;
    if PrevRecord <> nil then
    begin
      Items.GoToBookmark(PrevRecord);
      Items.FreeBookmark(PrevRecord);
    end;
  end;
end;

{ Browse Customers }

procedure TMastData.CustBeforeOpen(DataSet: TDataSet);
begin
  OrdByCust.Open;
end;

procedure TMastData.CustBeforePost(DataSet: TDataSet);
begin
  if Cust.State = dsInsert then
    with NextCust do
    begin
      Open;
      try
        Edit;
        CustCustNo.Value := NextCustNewCust.Value;
        NextCustNewCust.Value := NextCustNewCust.Value + 1;
        Post;
      finally
        Close;
      end;
    end;
end;

procedure TMastData.CustOldBeforeOpen(DataSet: TDataSet);
begin
  OrdByCust.Open;
end;

procedure TMastData.OrdByCustOldCalcFields(DataSet: TDataSet);
begin
  OrdByCustAmountDue.Value := OrdByCustItemsTotal.Value +
    OrdByCustItemsTotal.Value * OrdByCustTaxRate.Value / 100 +
    OrdByCustFreight.Value - OrdByCustAmountPaid.Value;
end;

{ Get the next available customer number from the NextCust table }

procedure TMastData.CustOldBeforePost(DataSet: TDataSet);
begin
  if Cust.State = dsInsert then
    with NextCust do
    begin
      Open;
      try
        Edit;
        CustCustNo.Value := NextCustNewCust.Value;
        NextCustNewCust.Value := NextCustNewCust.Value + 1;
        Post;
      finally
        Close;
      end;
    end;
end;

function TMastData.DataSetApplyUpdates(DataSet: TDataSet;
  Apply: Boolean): Boolean;
begin
  Result := True;
  with TIBCustomDataSet(DataSet) do
  begin
    if (State in dsEditModes) or UpdatesPending then
    begin
      if Apply then
      begin
        Database.ApplyUpdates([DataSet as TIBCustomDataSet]);
        Transaction.CommitRetaining;
        { Always call CancelUpdates to remove any discard changes }
        CancelUpdates;
      end
      else
      begin
        if (MessageDlg('Unsaved changes, exit anyway?', mtConfirmation,
          [mbYes, mbCancel], 0) = mrYes) then
          CancelUpdates
        else
          Result := False;
      end;
    end;
  end;
end;

procedure TMastData.EditUpdateError(DataSet: TIBDataSet; E: EIBInterbaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
var
  Key: Variant;
const
  UpdErrMsg = '%s.'#13#10'Discard the edits to %S %S and continue updating?';
begin
  if UpdateKind = ukDelete then
    Key := DataSet.Fields[0].OldValue
  else
    Key := DataSet.Fields[0].NewValue;
  if MessageDlg(Format(UpdErrMsg, [E.Message, DataSet.Fields[0].DisplayLabel,
    Key]), mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
    UpdateAction := uaSkip
  else
    UpdateAction := uaAbort;
end;

procedure TMastData.EmpsCalcFields(DataSet: TDataSet);
begin
  EmpsFullName.Value := Format('%s, %s', [EmpsLastName.Value, EmpsFirstName.Value]);
end;

procedure TMastData.MastDataCreate(Sender: TObject);
begin
  Database.Open;
  Transaction.StartTransaction;
end;

procedure TMastData.EnsureOrdersEdit(DataSet: TDataSet);
begin
  Orders.Edit;
end;

end.
