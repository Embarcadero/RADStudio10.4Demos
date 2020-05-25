
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fMasterDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fMainLayers,
  FireDAC.DatS, FireDAC.Stan.Intf, 
  FireDAC.Phys.Intf;

type
  TfrmMasterDetails = class(TfrmMainLayers)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
    FDatSManager: TFDDatSManager;
    FTabCat: TFDDatSTable;
    FTabProd: TFDDatSTable;
  public
    { Public declarations }
  end;

var
  frmMasterDetails: TfrmMasterDetails;

implementation

uses
  uDatSUtils;

{$R *.dfm}


procedure TfrmMasterDetails.FormCreate(Sender: TObject);
var
  oCatPK, oProdPK: TFDDatSUniqueConstraint;
  oProdFK: TFDDatSForeignKeyConstraint;
begin
  inherited FormCreate(Sender);

  // 1) create DatSManager object
  FDatSManager := TFDDatSManager.Create;

  // 2) create Categories table
  FTabCat := FDatSManager.Tables.Add('Categories');
  with FTabCat.Columns do begin
    with Add('CategoryID', dtInt32) do begin
      SourceID := 1;
      AutoIncrement := True;
      AllowDBNull := False;
    end;
    with Add('CategoryName', dtAnsiString) do begin
      SourceID := 2;
      Size := 15;
      AllowDBNull := False;
    end;
    Add('Description', dtMemo).SourceID := 3;
    Add('Picture', dtBlob).SourceID := 4;
  end;

  // 3) define Categories table primary key
  oCatPK := FTabCat.Constraints.AddUK('CAT_PK', 'CategoryID', True);

  // 4) create Products table
  FTabProd := FDatSManager.Tables.Add('Products');
  with FTabProd.Columns do begin
    with Add('ProductID', dtInt32) do begin
      SourceID := 1;
      AutoIncrement := True;
      AllowDBNull := False;
    end;
    with Add('ProductName', dtAnsiString) do begin
      SourceID := 2;
      Size := 40;
      AllowDBNull := False;
    end;
    with Add('SupplierID', dtInt32) do begin
      SourceID := 3;
      AllowDBNull := False;
    end;
    Add('CategoryID', dtInt32).SourceID := 4;
    with Add('QuantityPerUnit', dtAnsiString) do begin
      SourceID := 5;
      Size := 20;
    end;
    Add('UnitPrice', dtCurrency).SourceID := 6;
    Add('UnitsInStock', dtInt16).SourceID := 7;
    Add('UnitsOnOrder', dtInt16).SourceID := 8;
    Add('ReorderLevel', dtInt16).SourceID := 9;
    Add('Discontinued', dtBoolean).SourceID := 10;
  end;

  // 5) define Products table primary key
  oProdPK := FTabProd.Constraints.AddUK('PROD_PK', 'ProductID', True);

  // 6) define Products table foreign key
  oProdFK := FTabProd.Constraints.AddFK('PROD_FK', 'Categories', 'CategoryID', 'CategoryID');

  // 7) define relations based on FK and PK
  FDatSManager.Relations.Add('CAT_PROD_REL', oCatPK, oProdFK);
end;

procedure TfrmMasterDetails.FormDestroy(Sender: TObject);
begin
  FDatSManager.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmMasterDetails.cbDBClick(Sender: TObject);
var
  j: Integer;
  myRow: TFDDatSRow;
  childView: TFDDatSView;

  procedure FetchTable(ATable: TFDDatSTable; const ATabName: String);
  var
    oCmdIntf: IFDPhysCommand;
  begin
    ATable.Clear;
    FConnIntf.CreateCommand(oCmdIntf);
    oCmdIntf.Prepare('select * from ' + ATabName);
    oCmdIntf.Open;
    oCmdIntf.Fetch(ATable, True);
  end;

begin
  inherited cbDBClick(Sender);
  // 1) Fetch tables
  FetchTable(FTabCat, '{id Categories}');
  FetchTable(FTabProd, '{id Products}');

  // 2) For each master Categories row
  Console.Clear;
  for j := 0 to FTabCat.Rows.Count - 1 do begin
    myRow := FTabCat.Rows[j];
    PrintRow(myRow, Console.Lines, '------ Parent Row' );

    // 3) Get child rows view, specifing child table
    childView := myRow.GetChildRows(FTabProd);
    try
      PrintRows(childView, Console.Lines, '------ Child Rows' );
    finally
      childView.Free;
    end
  end
end;

end.
