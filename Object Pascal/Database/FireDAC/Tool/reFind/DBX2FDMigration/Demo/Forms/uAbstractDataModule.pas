//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uAbstractDataModule;

interface

uses
  System.UITypes, SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TAbstractDataModule = class(TDataModule)
    sqlControl: TSQLDataSet;
    dspControl: TDataSetProvider;
    cdsControl: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsControlBeforeDelete(DataSet: TDataSet);
    procedure cdsControlBeforeRefresh(DataSet: TDataSet);
    { published section explicit here for didactic purpose only }
  published
    procedure cdsApplyUpdates(DataSet: TDataSet);
    procedure cdsCancelUpdates(DataSet: TDataSet);
    procedure cdsReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  strict private
    fDBConnection: TSQLConnection;
    function GetDBConnection: TSQLConnection;
    procedure SetDBConnection(value: TSQLConnection);
    { Private declarations }
  public
    { Public declarations }
    property DBConnection: TSQLConnection read GetDBConnection
      write SetDBConnection;
    procedure CheckRequiredFields(DataSet: TDataSet);
    function GenerateID(Gen: string): Integer;
  end;

implementation

uses
  Dialogs, Controls, uRecError, uMainDM, uMainForm, Forms, Variants;

{$R *.dfm}
{ TDMAbstract }

procedure TAbstractDataModule.cdsApplyUpdates(DataSet: TDataSet);
begin
  if TClientDataSet(DataSet).ChangeCount > 0 then
    TClientDataSet(DataSet).ApplyUpdates(0);
end;

procedure TAbstractDataModule.cdsCancelUpdates(DataSet: TDataSet);
begin
  if TClientDataSet(DataSet).ChangeCount > 0 then
    TClientDataSet(DataSet).CancelUpdates;
end;

procedure TAbstractDataModule.cdsControlBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Delete record?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrNo
  then
    raise Exception.Create('Canceled!');
end;

procedure TAbstractDataModule.cdsControlBeforeRefresh(DataSet: TDataSet);
begin
  if TClientDataSet(DataSet).ChangeCount > 0 then
    TClientDataSet(DataSet).CancelUpdates;
end;

procedure TAbstractDataModule.cdsReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TAbstractDataModule.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).OnReconcileError := cdsReconcileError;
end;

procedure TAbstractDataModule.CheckRequiredFields(DataSet: TDataSet);
var
  i: Integer;
begin
  for i := 0 To DataSet.FieldCount - 1 do
    if DataSet.Fields[i].Required then
      if Trim(VarToSTr(DataSet.Fields[i].value)) = '' then
        raise Exception.Create('Field ''' + DataSet.Fields[i].DisplayLabel +
          ''' is required!');
end;

function TAbstractDataModule.GenerateID(Gen: string): Integer;
var
  sqlID: TSQLQuery;
begin
  sqlID := TSQLQuery.Create(nil);
  sqlID.SQLConnection := TMainForm(Application.MainForm).DBConnection;
  try
    sqlID.SQL.Add('SELECT GEN_ID(' + Gen + ', 1) AS ID');
    sqlID.SQL.Add('  FROM RDB$DATABASE');
    sqlID.Open;

    if sqlID.RecordCount > 0 then
      Result := sqlID.FieldByName('ID').AsInteger
    else
      Result := -1;
  finally
    sqlID.Free;
  end;
end;

function TAbstractDataModule.GetDBConnection: TSQLConnection;
begin
  Result := fDBConnection;
end;

procedure TAbstractDataModule.SetDBConnection(value: TSQLConnection);
var
  i: Integer;
begin
  fDBConnection := value;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TSQLDataSet then
      if not TSQLDataSet(Components[i]).Active then
        TSQLDataSet(Components[i]).SQLConnection := fDBConnection;
end;

end.
