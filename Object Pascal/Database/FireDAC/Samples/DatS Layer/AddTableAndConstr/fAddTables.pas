
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fAddTables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fDatSLayerBase,
  FireDAC.DatS, FireDAC.Stan.Intf;

type
  TfrmAddTables = class(TfrmDatSLayerBase)
    btnCreateTables: TButton;
    btnAddConstr: TButton;
    Memo1: TMemo;
    procedure FormDestroy(Sender: TObject);
    procedure btnCreateTablesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddConstrClick(Sender: TObject);
  private
    { Private declarations }
    FTab1, FTab2, FTab3: TFDDatSTable;
    FDatSManager: TFDDatSManager;
  public
    { Public declarations }
  end;

var
  frmAddTables: TfrmAddTables;

implementation

uses
  uDatSUtils;

{$R *.dfm}

procedure TfrmAddTables.FormCreate(Sender: TObject);
begin
  FDatSManager := TFDDatSManager.Create;
  Console.Lines.Add('DatSManager created');

  btnAddConstr.Enabled := False;
end;

procedure TfrmAddTables.btnCreateTablesClick(Sender: TObject);
begin
  // 1) first way of adding table to DatS Manager
  FTab1 := TFDDatSTable.Create('Table1');
  FDatSManager.Tables.Add(FTab1);
  with FTab1.Columns.Add('pkey1', dtInt32) do begin
    AutoIncrement := True;                                            // autoincremental field
    AutoIncrementSeed := -1;                                          // starting value of autoinc. field
    AutoIncrementStep := -1;                                          // step of increment
    Attributes := Attributes - [caAllowNull];                         // allways will have a value
  end;
  FTab1.Columns.Add('name', dtAnsiString).Size := 15;
  Console.Lines.Add('DatSTable ''Table1'' created');

  // 2) second way
  FTab2 := FDatSManager.Tables.Add('Table2');
  with FTab2.Columns.Add('pkey2', dtInt32) do begin
    AutoIncrement := True;
    AutoIncrementSeed := 1;
    AutoIncrementStep := 2;
    Attributes := Attributes - [caAllowNull];
  end;
  FTab2.Columns.Add('fkey12', dtInt32);
  Console.Lines.Add('DatSTable ''Table2'' created');

  // 3) the table with primary key containing more than one field
  FTab3 := FDatSManager.Tables.Add('Table3');
  FTab3.Columns.Add('pkey31', dtInt32);
  FTab3.Columns.Add('pkey32', dtInt32);
  FTab3.Columns.Add('name').Size := 15;
  Console.Lines.Add('DatSTable ''Table3'' created');

  {
  // 4) the table with foreign key containing more than one field
  FTab4 := FDatSManager.Tables.Add('Table3');
  FTab4.Columns.Add('pkey4', dtInt32);
  FTab4.Columns.Add('fkey31', dtInt32);
  FTab4.Columns.Add('fkey32', dtInt32);
  }

  btnCreateTables.Enabled := False;
  btnAddConstr.Enabled := True;
end;

procedure TfrmAddTables.btnAddConstrClick(Sender: TObject);
var
  oPK1, oPK2, oPK3: TFDDatSUniqueConstraint;
  oFK1: TFDDatSForeignKeyConstraint;
  i, j: Integer;
begin
  // 1) unique constraints
  // first way
  oPK1 := FTab1.Constraints.AddUK('PK1', 'pkey1', True);
  Console.Lines.Add('Unique key on ''Table1''.''pkey1'' created');
  // second way
  oPK2 := FTab2.Constraints.AddUK('PK2', FTab2.Columns[0], True);
  Console.Lines.Add('Unique key on ''Table2''.''pkey2'' created');
  // third way
  oPK3 := FTab3.Constraints.AddUK('PK3', 'pkey31;pkey32', True);
  Console.Lines.Add('Unique key on ''Table3''.''pkey31;pkey32'' created');
  // fourth way
  { oPK3 := FTab2.Constraints.AddUK('PK3', [FTab3.Columns[0], FTab3.Columns[1]], True); }

  // 2) foreign constraints
  // first way
  oFK1 := FTab2.Constraints.AddFK('FK1', 'Table1', 'pkey1', 'fkey12');
  Console.Lines.Add('Unique key on ''Table3''.''pkey31;pkey32'' created');

  // second way
  { oFK1 := FTab2.Constraints.AddFK('FK1', FTab1.Columns[0], FTab2.Columns[1]); }

  // third way
  { oFK2 := FTab4.Constraints.AddFK('FK2', [FTab3.Columns[0], FTab3.Columns[1]],
                                  [FTab4.Columns[1], FTab4.Columns[2]]); }

  // 3) populate the tables
  Console.Lines.Add('Add data ...');
  for i := 0 to 2 do begin
    FTab1.Rows.Add([Unassigned, 'parent row #' + IntToStr(i)]);
    for j := 0 to 2 do begin
      FTab2.Rows.Add([Unassigned, FTab1.Rows[i].GetData('pkey1')]);
      FTab3.Rows.Add([FTab1.Rows[i].GetData('pkey1'), FTab2.Rows[i * 3 + j].GetData('pkey2'),
                      'child row #' + IntToStr(i * 3 + j)]);
    end;
  end;

  // 4) print rows
  PrintRows(FTab1, Console.Lines, 'FTab1');
  PrintRows(FTab2, Console.Lines, 'FTab2');
  PrintRows(FTab3, Console.Lines, 'FTab3');

  btnAddConstr.Enabled := False;
end;

procedure TfrmAddTables.FormDestroy(Sender: TObject);
begin
  FDatSManager.Free;
end;

end.
