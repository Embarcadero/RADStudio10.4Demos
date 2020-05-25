//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uMsgControl;

interface

uses uAbstractControl, Classes;

type
  TMsgControl = class(TAbstractControl)
  public
    procedure PostNotification(email: string; Text: string);
    class function GetInstance: TMsgControl;
    procedure CreateDefaultForm; override;
    procedure CreateDefaultDM; override;
  strict private
    class var FInstance: TMsgControl;
  end;

implementation

uses
  Forms, SqlExpr, SysUtils;

procedure TMsgControl.PostNotification(email: string; Text: string);
var
  sqlPost: TSQLQuery;
  bLocalTrans: boolean;
begin
  sqlPost := TSQLQuery.Create(nil);
  try
    sqlPost.SQLConnection := DBConnection;

    sqlPost.SQL.Add('INSERT INTO MSGLOG (');
    sqlPost.SQL.Add('    MSGLOG_ID,');
    sqlPost.SQL.Add('    EMAIL,');
    sqlPost.SQL.Add('    MSG,');
    sqlPost.SQL.Add('    SENT');
    sqlPost.SQL.Add('    ) VALUES (');
    sqlPost.SQL.Add('    0, ');
    sqlPost.SQL.Add(QuotedSTR(email) + ', ');
    sqlPost.SQL.Add(QuotedSTR(Text) + ', ');
    sqlPost.SQL.Add(QuotedSTR('N') + ')');

    bLocalTrans := False;
    if not DBConnection.InTransaction then
    begin
      bLocalTrans := True;
      DBConnection.StartTransaction(TD);
    end;

    try
      sqlPost.ExecSQL(True);
      if (bLocalTrans) then
        DBConnection.Commit(TD);
    except
      on E: Exception do
      begin
        if (bLocalTrans) then
          DBConnection.Rollback(TD);
        raise Exception.Create(MO_ExceptionMsg + E.Message);
      end;
    end;

  finally
    sqlPost.Free;
  end;
end;

class function TMsgControl.GetInstance: TMsgControl;
begin
  if FInstance = nil then
  begin
    FInstance := uMsgControl.TMsgControl.Create(Application);
  end;
  Result := FInstance;
end;

procedure TMsgControl.CreateDefaultForm;
begin
  inherited;
end;

procedure TMsgControl.CreateDefaultDM;
begin
  inherited;
end;

end.
