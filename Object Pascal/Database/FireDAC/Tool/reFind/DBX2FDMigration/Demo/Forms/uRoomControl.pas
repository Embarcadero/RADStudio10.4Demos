//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uRoomControl;

interface

uses
  Classes, uAbstractControl, uRoomDM;

type
  TRoomControl = class(TAbstractControl)
  strict private
    fRoomDM: TRoomDM;
    class var FInstance: TRoomControl;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CreateDefaultForm; override;
    procedure CreateDefaultDM; override;
    class function GetInstance: TRoomControl;
    function FindRoomName(RoomID: integer; Name: string): boolean;
  end;

implementation

uses
  SqlExpr, SysUtils, Forms, uRoomForm;

{ TRoomControl }

constructor TRoomControl.Create(AOwner: TComponent);
begin
  fRoomDM := nil;
  fRoomForm := nil;
  inherited Create(AOwner);
end;

procedure TRoomControl.CreateDefaultForm;
begin
  inherited;
  if fRoomForm = nil then
  begin
    fRoomForm := TRoomForm.Create(Self);
    fRoomForm.datControl.DataSet := fRoomDM.cdsControl;
    fRoomForm.datControl.DataSet.Open;
  end
  else
    fRoomForm.Show;
end;

procedure TRoomControl.CreateDefaultDM;
begin
  inherited;
  fRoomDM := TRoomDM.Create(Self);
  fRoomDM.DBConnection := DBConnection;
end;

destructor TRoomControl.Destroy;
begin
  inherited;
end;

class function TRoomControl.GetInstance: TRoomControl;
begin
  if FInstance = nil then
  begin
    FInstance := uRoomControl.TRoomControl.Create(Application);
  end;
  Result := FInstance;
end;

function TRoomControl.FindRoomName(RoomID: integer; Name: string): boolean;
var
  sqlFind: TSQLQuery;
begin
  sqlFind := TSQLQuery.Create(nil);
  try
    sqlFind.SQLConnection := DBConnection;

    sqlFind.SQL.Add('SELECT * FROM ROOM');
    sqlFind.SQL.Add(' WHERE NAME = ' + QuotedStr(Name));
    sqlFind.SQL.Add('   AND ROOM_ID <> ' + IntToStr(RoomID));
    sqlFind.Open;

    Result := (sqlFind.RecordCount > 0);
  finally
    sqlFind.Free;
  end;
end;

end.
