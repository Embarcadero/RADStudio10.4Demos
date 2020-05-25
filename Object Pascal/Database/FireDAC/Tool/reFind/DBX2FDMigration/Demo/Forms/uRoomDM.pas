//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uRoomDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAbstractDataModule, FMTBcd, DBClient, Provider, DB, SqlExpr,
  uMainDM;

type
  TRoomDM = class(TAbstractDataModule)
    sqlControlCAPACITY: TIntegerField;
    sqlControlLOCATION: TStringField;
    sqlControlNAME: TStringField;
    sqlControlROOM_ID: TIntegerField;
    cdsControlCAPACITY: TIntegerField;
    cdsControlLOCATION: TStringField;
    cdsControlNAME: TStringField;
    cdsControlROOM_ID: TIntegerField;
    procedure cdsControlBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uRoomControl;

{$R *.dfm}

procedure TRoomDM.cdsControlBeforePost(DataSet: TDataSet);
begin
  inherited;
  CheckRequiredFields(DataSet);

  if TRoomControl.GetInstance.FindRoomName(DataSet.FieldByName('ROOM_ID')
    .AsInteger, DataSet.FieldByName('NAME').AsString) then
    raise Exception.Create('Duplicated room name!');

  if DataSet.State = dsInsert then
    DataSet.FieldByName('ROOM_ID').AsInteger := GenerateID('GEN_ROOM_ID');
end;

end.
