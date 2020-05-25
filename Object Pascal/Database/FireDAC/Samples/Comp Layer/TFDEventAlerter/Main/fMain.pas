//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, DB, Buttons, Grids, DBGrids, ExtCtrls,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
    FireDAC.Stan.Error, FireDAC.Stan.Async,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMain = class(TfrmMainCompBase)
    qryFireEvents: TFDQuery;
    FDEventAlerter1: TFDEventAlerter;
    Memo1: TMemo;
    btnRegister: TButton;
    btnFire: TButton;
    btnUnregister: TButton;
    rgEventKinds: TRadioGroup;
    procedure cbDBClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnUnregisterClick(Sender: TObject);
    procedure btnFireClick(Sender: TObject);
    procedure rgEventKindsClick(Sender: TObject);
    procedure FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
      const AEventName: string; const AArgument: Variant);
    procedure FDEventAlerter1Timeout(Sender: TObject);
  end;

var
  frmMain: TfrmMain;

implementation

uses
  Variants,
  dmMainComp, dmMainBase,
  FireDAC.Stan.Util;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmMain.cbDBClick(Sender: TObject);
var
  s: String;
  i: Integer;
begin
  btnRegister.Enabled := False;
  btnFire.Enabled := False;
  btnUnregister.Enabled := False;

  inherited cbDBClick(Sender);
  qryFireEvents.SQL.Clear;
  rgEventKinds.Items.Clear;

  if qryFireEvents.Connection.ConnectionMetaDataIntf.EventSupported then begin
    // Fill supported event kinds
    s := qryFireEvents.Connection.ConnectionMetaDataIntf.EventKinds;
    i := 1;
    rgEventKinds.Items.Add('<default>');
    while i <= Length(s) do
      rgEventKinds.Items.Add(ExtractFieldName(s, i));
    rgEventKinds.Columns := rgEventKinds.Items.Count;
    rgEventKinds.ItemIndex := 0;

    // Prepare events firing
    case qryFireEvents.Connection.RDBMSKind of
    TFDRDBMSKinds.MSSQL:
      begin
        // MSSQL and FireDAC support change notification events.
        // Insert single row into table. We will change it.
        qryFireEvents.Connection.ExecSQL('delete from dbo.FDQA_TransTable');
        qryFireEvents.Connection.ExecSQL('insert into dbo.FDQA_TransTable values (1, ''qwe'')');
      end;
    TFDRDBMSKinds.Advantage:
      try
        // Advantage does not allow to call sp_SignalEvent directly from a client.
        // It must be wrapped into a stored procedure. We will call it.
        qryFireEvents.Connection.ExecSQL('create procedure TestEvents() ' +
          'begin ' +
          'EXECUTE PROCEDURE sp_SignalEvent(''EV1'', false, 0, ''event 1.1'');' +
          'EXECUTE PROCEDURE sp_SignalEvent(''EV1'', false, 0, ''event 1.2''); ' +
          'EXECUTE PROCEDURE sp_SignalEvent(''EV2'', false, 0, ''event 2''); ' +
          'end;');
      except
      end;
    end;

    // Ok, now you can press Register button and start to accept events
    btnRegister.Enabled := True;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.rgEventKindsClick(Sender: TObject);
begin
  btnUnregisterClick(nil);
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.btnRegisterClick(Sender: TObject);
begin
  if FDEventAlerter1.Active then
    Exit;

  // Specify event alerter kind
  if rgEventKinds.ItemIndex <= 0 then
    // default kind - empty string
    FDEventAlerter1.Options.Kind := ''
  else
    FDEventAlerter1.Options.Kind := rgEventKinds.Items[rgEventKinds.ItemIndex];

  // Add the event names
  FDEventAlerter1.Names.Clear;
  case qryFireEvents.Connection.RDBMSKind of
  TFDRDBMSKinds.MSSQL:
    begin
      // register EV1 as a change notification of FDQA_TransTable table
      FDEventAlerter1.Names.Add('QUEUE=?');
      FDEventAlerter1.Names.Add('SERVICE=?');
      FDEventAlerter1.Names.Add('CHANGE1=ev1;select id, name from dbo.FDQA_TransTable');
    end;
  TFDRDBMSKinds.Oracle,
  TFDRDBMSKinds.DB2:
    begin
      FDEventAlerter1.Names.Add('EV1');
      // Oracle DBMS_PIPE supports only single event name
      if FDEventAlerter1.Options.Kind <> 'DBMS_PIPE' then
        FDEventAlerter1.Names.Add('EV2');
    end;
  TFDRDBMSKinds.Informix,
  TFDRDBMSKinds.SQLAnywhere,
  TFDRDBMSKinds.PostgreSQL:
    FDEventAlerter1.Names.Add('EV1');
  else
    FDEventAlerter1.Names.Add('EV1');
    FDEventAlerter1.Names.Add('EV2');
  end;

  // Ask event alerter to fire all events in the main thread context
  FDEventAlerter1.Options.Synchronize := True;

  Memo1.Lines.Add('Register');
  FDEventAlerter1.Register;
  Memo1.Lines.Add('Listening');

  btnRegister.Enabled := False;
  btnFire.Enabled := True;
  btnUnregister.Enabled := True;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.btnFireClick(Sender: TObject);
begin
  // Specify the SQL command firing the events. The TFDEventAlerter has the
  // Signal method, but it allows to fire only a single event. Here we are
  // showing how to fire few events and how the alerter will handle them.
  if qryFireEvents.SQL.Count = 0 then
    with qryFireEvents.SQL do begin
      Clear;
      case qryFireEvents.Connection.RDBMSKind of
      TFDRDBMSKinds.Firebird:
        begin
          Add('execute block as');
          Add('begin');
          Add('  post_event ''EV1'';');
          Add('  post_event ''EV1'';');
          Add('  post_event ''EV2'';');
          Add('end');
        end;
      TFDRDBMSKinds.Oracle:
        if SameText(FDEventAlerter1.Options.Kind, 'DBMS_PIPE') then begin
          Add('declare');
          Add('  i integer;');
          Add('begin');
          Add('  sys.dbms_pipe.pack_message(''qwe'');');
          Add('  sys.dbms_pipe.pack_message(123);');
          Add('  sys.dbms_pipe.pack_message(sysdate());');
          Add('  i := sys.dbms_pipe.send_message(''ev1'');');
          Add('end;');
        end
        else begin
          Add('begin');
          Add('  sys.dbms_alert.signal(''ev1'', ''event 1'');');
          Add('  sys.dbms_alert.signal(''ev1'', ''event 11'');');
          Add('  sys.dbms_alert.signal(''ev2'', ''event 2'');');
          Add('end;');
        end;
      TFDRDBMSKinds.SQLAnywhere:
        Add('MESSAGE ''_FD_$$EV1$$hello world !'' TYPE INFO TO CLIENT FOR ALL');
      TFDRDBMSKinds.PostgreSQL:
        Add('NOTIFY EV1');
      TFDRDBMSKinds.SQLite:
        begin
          Add('SELECT POST_EVENT(''EV1'');');
          Add('SELECT POST_EVENT(''EV1'');');
          Add('SELECT POST_EVENT(''EV2'')');
          // For FireDAC these commands are returning result sets.
          // To avoid "command does not return a result set" error
          // explicitly specify command kind as non-SELECT.
          qryFireEvents.Command.CommandKind := skOther;
        end;
      TFDRDBMSKinds.MSSQL:
        // to fire the event we have to change table data
        Add('update dbo.FDQA_TransTable set id = id + 1');
      TFDRDBMSKinds.Advantage:
        // call the custom SP, which will fire the events
        Add('execute procedure TestEvents()');
      TFDRDBMSKinds.DB2:
        if SameText(FDEventAlerter1.Options.Kind, 'DBMS_PIPE') then begin
          Add('declare');
          Add('  i integer;');
          Add('begin');
          Add('  call dbms_pipe.pack_message(''qwe'');');
          Add('  call dbms_pipe.pack_message(123);');
          Add('  call dbms_pipe.pack_message(sysdate());');
          Add('  i := dbms_pipe.send_message(''ev1'');');
          Add('end;');
        end
        else begin
          Add('begin');
          Add('  call dbms_alert.signal(''ev1'', ''event 1'');');
          Add('  call dbms_alert.signal(''ev1'', ''event 11'');');
          Add('  call dbms_alert.signal(''ev2'', ''event 2'');');
          Add('end;');
        end;
      TFDRDBMSKinds.Informix:
        Add('execute procedure dbms_alert_signal(''ev1'', ''event 1'')');
      else
        raise Exception.Create('The selected DBMS does not allow to raise an event from client !');
      end;
    end;

  qryFireEvents.Connection.StartTransaction;

  qryFireEvents.ExecSQL;
  // execute all commands in batch SQL
  qryFireEvents.GetResults;

  // some DBMS's (FB, IB) fire the events only at a transaction COMMIT
  qryFireEvents.Connection.Commit;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.btnUnregisterClick(Sender: TObject);
begin
  if not FDEventAlerter1.Active then
    Exit;
  Memo1.Lines.Add('Unregister');
  FDEventAlerter1.Unregister;
  Memo1.Lines.Add('Inactive');

  btnRegister.Enabled := True;
  btnFire.Enabled := False;
  btnUnregister.Enabled := False;
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
  const AEventName: string; const AArgument: Variant);
var
  i: Integer;
  sArgs: String;
begin
  if VarIsArray(AArgument) then begin
    sArgs := '';
    for i := VarArrayLowBound(AArgument, 1) to VarArrayHighBound(AArgument, 1) do begin
      if sArgs <> '' then
        sArgs := sArgs + ', ';
      sArgs := sArgs + VarToStr(AArgument[i]);
    end;
  end
  else if VarIsNull(AArgument) then
    sArgs := '<NULL>'
  else if VarIsEmpty(AArgument) then
    sArgs := '<UNASSIGNED>'
  else
    sArgs := VarToStr(AArgument);
  Memo1.Lines.Add('Event - [' + AEventName + '] - [' + sArgs + ']');
end;

{-------------------------------------------------------------------------------}
procedure TfrmMain.FDEventAlerter1Timeout(Sender: TObject);
begin
  Memo1.Lines.Add('Timeout');
end;

end.
