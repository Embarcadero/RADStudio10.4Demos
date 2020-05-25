
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fAutoInc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  fMainLayers,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMain = class(TfrmMainLayers)
    procedure cbDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Factory,
  uDatSUtils;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  Randomize;
end;

procedure TfrmMain.cbDBClick(Sender: TObject);
var
  oComm:      IFDPhysCommand;
  oSchAdapt:  IFDDAptSchemaAdapter;
  oMastAdapt,
  oDetAdapt:  IFDDAptTableAdapter;
  oMastRow:   TFDDatSRow;
begin
  inherited cbDBClick(Sender);

  // 1. create schema adapter
  FDCreateInterface(IFDDAptSchemaAdapter, oSchAdapt);

  // 2. add master table adapter
  oMastAdapt := oSchAdapt.TableAdapters.Add(EncodeName('FDQA_master_autoinc'), 'master');
  with oMastAdapt do begin
    ColumnMappings.Add('id1',   'parent_id');
    ColumnMappings.Add('name1', 'title1');
    FConnIntf.CreateCommand(oComm);
    SelectCommand := oComm;
    SelectCommand.Prepare('select * from {id FDQA_master_autoinc} order by id1');
    Define;
    with DatSTable.Columns[0] do
      ServerAutoIncrement := True;   // Set this property if a table in RDBMS has identity field
                                     // Setting this property automatically assign
                                     //   AutoIncrementSeed := -1;
                                     //   AutoIncrementStep := -1;
                                     // in order duplicate key error doesn't arise
    Fetch;
    PrintRows(DatSTable, Console.Lines, 'Fetched master rows --------------');
  end;

  // 3. add detail table adapter
  oDetAdapt := oSchAdapt.TableAdapters.Add(EncodeName('FDQA_details_autoinc'), 'details');
  with oDetAdapt do begin
    ColumnMappings.Add('id2',    'child_id');
    ColumnMappings.Add('fk_id1', 'fk_parent_id');
    ColumnMappings.Add('name2',  'title2');
    FConnIntf.CreateCommand(oComm);
    SelectCommand := oComm;
    SelectCommand.Prepare('select * from {id FDQA_details_autoinc} order by id2');
    Define;
    with DatSTable.Columns[0] do
      ServerAutoIncrement := True;
    Fetch;
    PrintRows(DatSTable, Console.Lines, 'Fetched detail rows --------------');
  end;

  // 4. add constraints to our DatSManager
  with oSchAdapt.DatSManager.Tables.ItemsS['master'] do
    Constraints.AddUK('master_pk',  'parent_id', True);
  with oSchAdapt.DatSManager.Tables.ItemsS['details'] do begin
    Constraints.AddUK('details_pk', 'child_id',  True);
    with Constraints.AddFK('details_fk_master', 'master', 'parent_id', 'fk_parent_id') do begin
      UpdateRule := crCascade;
      DeleteRule := crCascade;
      AcceptRejectRule := arCascade;
    end;
  end;

  // 5. add new row to the master table
  oMastRow := oMastAdapt.DatSTable.Rows.Add([Unassigned, 'Master ' + IntToStr(Random(1000000000))]); // Set Unassigned for identity fields
  PrintRows(oMastAdapt.DatSTable, Console.Lines, 'Master rows after addition --------------');

  // 6. add new rows to the detail table
  oDetAdapt.DatSTable.Rows.Add([Unassigned, oMastRow.GetData('parent_id'), 'Detail1 ' + IntToStr(Random(1000000000))]);
  oDetAdapt.DatSTable.Rows.Add([Unassigned, oMastRow.GetData('parent_id'), 'Detail2 ' + IntToStr(Random(1000000000))]);
  PrintRows(oDetAdapt.DatSTable, Console.Lines, 'Detail rows after addition --------------');

  // 7. Post changes to RDBMS and reconcile errors
  oSchAdapt.Update;
  oSchAdapt.Reconcile;
  PrintRows(oMastAdapt.DatSTable, Console.Lines, 'Master rows after posting updates --------------');
  PrintRows(oDetAdapt.DatSTable, Console.Lines, 'Detail rows after posting updates --------------');
end;

end.

