
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fCommands;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  fMainLayers,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
  TfrmCommands = class(TfrmMainLayers)
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCommands: TfrmCommands;

implementation

{$R *.dfm}

uses
  dmMainBase,
  uDatSUtils,
  FireDAC.Stan.Factory;

procedure TfrmCommands.cbDBClick(Sender: TObject);
var
  oComm:  IFDPhysCommand;
  oAdapt: IFDDAptTableAdapter;
  i:      Integer;
begin
  inherited cbDBClick(Sender);
  // 1. Create table adapter and setup it
  FDCreateInterface(IFDDAptTableAdapter, oAdapt);
  with oAdapt do begin
    FConnIntf.CreateCommand(oComm);
    SelectCommand := oComm;
    SelectCommand.Prepare('select * from {id FDQA_map1}');
    Define;
    Fetch;
    PrintRows(DatSTable, Console.Lines, 'Fetched rows ----------------');

    // 2. Redirect all record inserts into FDQA_map2 table instead FDQA_map1
    FConnIntf.CreateCommand(oComm);
    InsertCommand := oComm;
    InsertCommand.CommandText := 'insert into {id FDQA_map2}(id2, name2) values(:NEW_id1, :NEW_name1)';

    // 3. Redirect all record deletes into FDQA_map3 table instead FDQA_map1
    FConnIntf.CreateCommand(oComm);
    DeleteCommand := oComm;
    DeleteCommand.CommandText := 'delete from {id FDQA_map3} where id3 = :OLD_id1';

    // 4. Redirect all record updates into FDQA_map4 table instead FDQA_map1
    FConnIntf.CreateCommand(oComm);
    UpdateCommand := oComm;
    UpdateCommand.CommandText := 'update {id FDQA_map4} set id4 = :NEW_id1, name4 = :NEW_name1 where id4 = :OLD_id1';

    // 5. Add new rows
    for i := 0 to 4 do
      DatSTable.Rows.Add([i, 'string' + IntToStr(i)]);
    PrintRows(DatSTable, Console.Lines, 'Rows after addition ----------------');

    // 6. Post changes to RDBMS
    // In this example 5 new records will be inserted into FDQA_map2 table
    Update;
    PrintRows(DatSTable, Console.Lines, 'Rows after posting updates ----------------');
  end;
end;

end.

