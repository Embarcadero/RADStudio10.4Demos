
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fMappingColumns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  fMainLayers,
  FireDAC.DatS, 
  FireDAC.DApt.Intf, 
  FireDAC.Phys.Intf;

type
  TfrmMappingColumns = class(TfrmMainLayers)
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMappingColumns: TfrmMappingColumns;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Factory,
  uDatSUtils;

procedure TfrmMappingColumns.cbDBClick(Sender: TObject);
var
  oComm:  IFDPhysCommand;
  oAdapt: IFDDAptTableAdapter;
  i:      Integer;
begin
  inherited cbDBClick(Sender);
  // 1. create table adapter
  FDCreateInterface(IFDDAptTableAdapter, oAdapt);
  with oAdapt do begin

    // 2. assign command
    FConnIntf.CreateCommand(oComm);
    SelectCommand := oComm;
    SelectCommand.Prepare('select * from {id FDQA_map1}');

    // 3. set source result set name
    SourceRecordSetName := EncodeName('FDQA_map1');

    // 4. set DatSTable name, where rows will be fetched
    DatSTableName := 'mapper';

    // 5. set update table name
    UpdateTableName := EncodeName('FDQA_map2');

    // 6. setup column mappings, seting the same 3 names
    ColumnMappings.Add('id1', 'num', 'id2');
    ColumnMappings.Add('name1', 'title', 'name2');

    // 7. fetch rows
    Define;
    Fetch;
    PrintRows(DatSTable, Console.Lines, 'Fetched rows ------------------');

    // 8. append rows and post changes to RDBMS
    // Note! New rows will be added to FDQA_map2(id2, name2) table
    for i := 0 to 9 do
      DatSTable.Rows.Add([i, 'first' + IntToStr(i)]);
    Update;
    PrintRows(DatSTable, Console.Lines, 'Rows after posting changes ------------------');
  end;
end;

end.

