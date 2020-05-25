
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fChildRelations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls,
  fDatSLayerBase,
  FireDAC.DatS, FireDAC.Stan.Intf;

type
  TfrmChildRelations = class(TfrmDatSLayerBase)
    btnSelect: TButton;
    btnChildRels: TButton;
    btnCompute: TButton;
    procedure btnSelectClick(Sender: TObject);
    procedure btnChildRelsClick(Sender: TObject);
    procedure btnComputeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChildRelations: TfrmChildRelations;

implementation

uses
  uDatSUtils;

{$R *.dfm}


procedure TfrmChildRelations.btnChildRelsClick(Sender: TObject);
var
  myDatSManager: TFDDatSManager;
  t: TFDDatSTable;
  orderId: Integer;
  customerId: Integer;
  i: Integer;
  myTable: TFDDatSTable;
  myRelations: TFDDatSRelationArray;
  myRelation: TFDDatSRelation;
  myRow: TFDDatSRow;
  childView: TFDDatSView;
begin
  // 1) create a DatSManager with one table, two columns
  myDatSManager := TFDDatSManager.Create;
  try

    // 2) create Customer table
    t := TFDDatSTable.Create('Customers');
    myDatSManager.Tables.Add(t);
    t.Columns.Add('customerId', dtInt32 ).AutoIncrement := True;
    t.Columns.Add('name', dtAnsiString );
    t.PrimaryKey := 'customerId';

    // 3) create Orders table
    t := TFDDatSTable.Create('Orders');
    myDatSManager.Tables.Add(t);
    t.Columns.Add('orderId', dtInt32).AutoIncrement := true;
    t.Columns.Add('customerId', dtInt32);
    t.Columns.Add('amount', dtDouble);
    t.PrimaryKey := 'orderId';

    // 4) create relation
    myDatSManager.Relations.Add(
      myDatSManager.Tables.ItemsS[ 'Customers' ].Columns.ItemsS[ 'customerId' ],
      myDatSManager.Tables.ItemsS[ 'Orders' ].Columns.ItemsS[ 'customerId' ], False );

    // 5) populate the tables
    orderId := 1;
    for customerId := 1 to 10 do begin
      // add customer record
      myDatSManager.Tables.ItemsS['Customers'].Rows.Add([customerId, Format('customer%d', [customerId])]);

      // add 5 order records for each customer
      for i := 1 to 5 do begin
        myDatSManager.Tables.ItemsS[ 'Orders' ].Rows.Add([Unassigned, customerId, orderId * 10]);
        Inc(orderId);
      end;
    end;

    // 6) get array of child relations for Customers table.
    // We know there is only one element.
    myTable := myDatSManager.Tables.ItemsS[ 'Customers' ];
    myRelations := myTable.ChildRelations;
    myRelation := myRelations[0];

    // 7) For each Customer master row print Orders detail rows.
    for i := 0 to myTable.Rows.Count - 1 do begin
      myRow := myTable.Rows[i];
      PrintRow(myRow, Console.Lines, '------ Parent Row');

      childView := myRow.GetChildRows(myRelation);
      try
        PrintRows(childView, Console.Lines, 'child rows');
      finally
        childView.Free;
      end;
    end;

  finally
    myDatSManager.Free;
  end;
end;

procedure TfrmChildRelations.btnComputeClick(Sender: TObject);
var
  t: TFDDatSTable;
  customerId: Integer;
  i: Integer;
  v: Variant;
begin
  // 1) create Orders table
  t := TFDDatSTable.Create( 'Orders' );
  try
    t.Columns.Add( 'orderId', dtInt32 ).AutoIncrement := true;
    t.Columns.Add( 'customerId', dtInt32 );
    t.Columns.Add( 'amount', dtDouble );
    t.Columns.Add( 'items', dtInt32 );
    t.PrimaryKey := 'orderId';

    // 2) populate the table
    for customerId := 1 to 10 do
      // add 5 order records for each customer
      for i := 1 to 5 do
        t.Rows.Add([Unassigned, customerId, Random(10000), Random(10) + 1]);

    // 3) get average item price for customer # 5
    v := t.Compute('avg(amount / items)', 'customerId = 5');
    Console.Lines.Add('Average item price for customer 5 = ' + VarToStr(v));
  finally
    t.Free;
  end;
end;

procedure TfrmChildRelations.btnSelectClick(Sender: TObject);
var
  oCustTab: TFDDatSTable;
  iId: Integer;
  oFoundRows: TFDDatSView;
begin
  // 1) Create table
  oCustTab := TFDDatSTable.Create('Customers');
  try
    oCustTab.Columns.Add('id', dtInt32);
    oCustTab.Columns.Add('name', dtAnsiString);

    // 2) Add ten rows and accept changes -> rsUnchanged
    for iId := 1 to 10 do
      oCustTab.Rows.Add([iId, Format('customer%d', [iId])]);
    oCustTab.AcceptChanges();
    // Add another ten rows               -> rsInserted
    for iId := 11 to 20 do
      oCustTab.Rows.Add([iId, Format('customer%d', [iId])]);

    // 3) Use the Select method to find all rows matching the filter.
    oFoundRows := oCustTab.Select('id > 5', 'name', [rsInserted]);
    try
      PrintRows(oFoundRows, Console.Lines, 'filtered rows');
    finally
      oFoundRows.Free;
    end;

    // 4) Use the Select method to find all rows in table.
    oFoundRows := oCustTab.DefaultView;
    try
      PrintRows(oFoundRows, Console.Lines, 'all rows');
    finally
      oFoundRows.Free;
    end;

  finally
    oCustTab.Free
  end;
end;

end.
