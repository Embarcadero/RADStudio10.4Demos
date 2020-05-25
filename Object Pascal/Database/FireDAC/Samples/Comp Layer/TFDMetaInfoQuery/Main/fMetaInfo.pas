//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMetaInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Error;

type
  TfrmMetaInfo = class(TfrmMainCompBase)
    pcMain: TPageControl;
    tsData: TTabSheet;
    tsOptions: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    edtCatalog: TEdit;
    edtSchema: TEdit;
    GroupBox1: TGroupBox;
    cbMy: TCheckBox;
    cbOther: TCheckBox;
    cbSystem: TCheckBox;
    GroupBox2: TGroupBox;
    cbSynonym: TCheckBox;
    cbTable: TCheckBox;
    cbView: TCheckBox;
    cbTempTable: TCheckBox;
    cbLocalTable: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    dbgTables: TDBGrid;
    Splitter1: TSplitter;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    dbgFields: TDBGrid;
    dbgIndexes: TDBGrid;
    Splitter2: TSplitter;
    dbgIndexFields: TDBGrid;
    dbgPrimaryKeys: TDBGrid;
    Splitter3: TSplitter;
    dbgPrimaryKeyFields: TDBGrid;
    dbgPackages: TDBGrid;
    Splitter4: TSplitter;
    dbgPackProcs: TDBGrid;
    Splitter5: TSplitter;
    dbgPackProcArgs: TDBGrid;
    dbgProcs: TDBGrid;
    Splitter6: TSplitter;
    DBGrid11: TDBGrid;
    miTables: TFDMetaInfoQuery;
    miFields: TFDMetaInfoQuery;
    miIndexes: TFDMetaInfoQuery;
    miIndexFields: TFDMetaInfoQuery;
    miPrimaryKeys: TFDMetaInfoQuery;
    miPrimaryKeyFields: TFDMetaInfoQuery;
    dsTables: TDataSource;
    dsFields: TDataSource;
    dsIndexes: TDataSource;
    dsIndexFields: TDataSource;
    dsPrimaryKeys: TDataSource;
    dsPrimaryKeyFields: TDataSource;
    miPackages: TFDMetaInfoQuery;
    miPackProcs: TFDMetaInfoQuery;
    miPackProcArgs: TFDMetaInfoQuery;
    miProcs: TFDMetaInfoQuery;
    miProcArgs: TFDMetaInfoQuery;
    dsPackages: TDataSource;
    dsPackProcs: TDataSource;
    dsPackProcArgs: TDataSource;
    dsProcs: TDataSource;
    dsProcArgs: TDataSource;
    mmInfo: TMemo;
    TabSheet7: TTabSheet;
    dbgForeignKeys: TDBGrid;
    Splitter7: TSplitter;
    dbgForeignKeyFields: TDBGrid;
    miForeignKeys: TFDMetaInfoQuery;
    miForeignKeyFields: TFDMetaInfoQuery;
    dsForeignKeys: TDataSource;
    dsForeignKeyFields: TDataSource;
    procedure cbDBClick(Sender: TObject);
    procedure dsTablesDataChange(Sender: TObject; Field: TField);
    procedure dsIndexesDataChange(Sender: TObject; Field: TField);
    procedure dsPrimaryKeysDataChange(Sender: TObject; Field: TField);
    procedure dsPackagesDataChange(Sender: TObject; Field: TField);
    procedure dsPackProcsDataChange(Sender: TObject; Field: TField);
    procedure dsProcsDataChange(Sender: TObject; Field: TField);
    procedure pcMainChange(Sender: TObject);
    procedure miTablesAfterOpen(DataSet: TDataSet);
    procedure dsForeignKeysDataChange(Sender: TObject; Field: TField);
  private
    FInFixColumnWidth: Boolean;
    procedure SetOptions(AMIQ: TFDMetaInfoQuery);
    procedure FixColumnWidth(ADS: TDataSet);
    function FixName(const AName: String): String;
  public
    { Public declarations }
  end;

var
  frmMetaInfo: TfrmMetaInfo;

implementation

uses dmMainComp;

{$R *.dfm}

procedure TfrmMetaInfo.SetOptions(AMIQ: TFDMetaInfoQuery);
var
  os: TFDPhysObjectScopes;
  tk: TFDPhysTableKinds;
begin
  os := [];
  if cbMy.Checked then
    Include(os, osMy);
  if cbOther.Checked then
    Include(os, osOther);
  if cbSystem.Checked then
    Include(os, osSystem);

  tk := [];
  if cbSynonym.Checked then
    Include(tk, tkSynonym);
  if cbTable.Checked then
    Include(tk, tkTable);
  if cbView.Checked then
    Include(tk, tkView);
  if cbLocalTable.Checked then
    Include(tk, tkLocalTable);
  if cbTempTable.Checked then
    Include(tk, tkTempTable);

  AMIQ.CatalogName := edtCatalog.Text;
  AMIQ.SchemaName := edtSchema.Text;
  AMIQ.ObjectScopes := os;
  AMIQ.TableKinds := tk;
end;

procedure TfrmMetaInfo.FixColumnWidth(ADS: TDataSet);
var
  i: Integer;
begin
  FInFixColumnWidth := True;
  try
    for i := 0 to ADS.Fields.Count - 1 do
      ADS.Fields[i].DisplayWidth := Length(ADS.Fields[i].DisplayLabel);
  finally
    FInFixColumnWidth := False;
  end;
end;

function TfrmMetaInfo.FixName(const AName: String): String;
begin
  // Borland's dbExpress drivers return '<null>' in string
  // columns as NULL value.
  if CompareText(AName, '<null>') = 0 then
    Result := ''
  else
    Result := dmlMainComp.dbMain.EncodeObjectName('', '', '', AName);
end;

procedure TfrmMetaInfo.cbDBClick(Sender: TObject);
begin
  miTables.Close;
  miPackages.Close;
  miProcs.Close;
  inherited cbDBClick(Sender);
  pcMain.ActivePage := tsData;
  pcMainChange(nil);
end;

procedure TfrmMetaInfo.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePage = tsData then begin
    miTables.Close;
    SetOptions(miTables);
    miFields.Close;
    SetOptions(miFields);
    miIndexes.Close;
    SetOptions(miIndexes);
    miIndexFields.Close;
    SetOptions(miIndexFields);
    miPrimaryKeys.Close;
    SetOptions(miPrimaryKeys);
    miPrimaryKeyFields.Close;
    SetOptions(miPrimaryKeyFields);
    miForeignKeys.Close;
    SetOptions(miForeignKeys);
    miForeignKeyFields.Close;
    SetOptions(miForeignKeyFields);
    miPackages.Close;
    SetOptions(miPackages);
    miPackProcs.Close;
    SetOptions(miPackProcs);
    miPackProcArgs.Close;
    SetOptions(miPackProcArgs);
    miProcs.Close;
    SetOptions(miProcs);
    miProcArgs.Close;
    SetOptions(miProcArgs);

    miTables.Open;
    try
      miPackages.Open;
    except
    end;
    try
      miProcs.Open;
    except
    end;
  end;
end;

procedure TfrmMetaInfo.dsTablesDataChange(Sender: TObject; Field: TField);
begin
  if FInFixColumnWidth or (Field <> nil) then
    Exit;
  miFields.Close;
  miIndexes.Close;
  miPrimaryKeys.Close;
  miForeignKeys.Close;
  if not miTables.Active or miTables.IsEmpty then
    Exit;

  miFields.CatalogName := FixName(miTables.FieldByName('CATALOG_NAME').AsString);
  miFields.SchemaName := FixName(miTables.FieldByName('SCHEMA_NAME').AsString);
  miFields.ObjectName := FixName(miTables.FieldByName('TABLE_NAME').AsString);
  miFields.Open;

  miIndexes.CatalogName := FixName(miTables.FieldByName('CATALOG_NAME').AsString);
  miIndexes.SchemaName := FixName(miTables.FieldByName('SCHEMA_NAME').AsString);
  miIndexes.ObjectName := FixName(miTables.FieldByName('TABLE_NAME').AsString);
  miIndexes.Open;

  miPrimaryKeys.CatalogName := FixName(miTables.FieldByName('CATALOG_NAME').AsString);
  miPrimaryKeys.SchemaName := FixName(miTables.FieldByName('SCHEMA_NAME').AsString);
  miPrimaryKeys.ObjectName := FixName(miTables.FieldByName('TABLE_NAME').AsString);
  miPrimaryKeys.Open;

  miForeignKeys.CatalogName := FixName(miTables.FieldByName('CATALOG_NAME').AsString);
  miForeignKeys.SchemaName := FixName(miTables.FieldByName('SCHEMA_NAME').AsString);
  miForeignKeys.ObjectName := FixName(miTables.FieldByName('TABLE_NAME').AsString);
  miForeignKeys.Open;
end;

procedure TfrmMetaInfo.dsIndexesDataChange(Sender: TObject; Field: TField);
begin
  if FInFixColumnWidth or (Field <> nil) then
    Exit;
  miIndexFields.Close;
  if not miIndexes.Active or miIndexes.IsEmpty then
    Exit;

  miIndexFields.CatalogName := FixName(miIndexes.FieldByName('CATALOG_NAME').AsString);
  miIndexFields.SchemaName := FixName(miIndexes.FieldByName('SCHEMA_NAME').AsString);
  miIndexFields.BaseObjectName := FixName(miIndexes.FieldByName('TABLE_NAME').AsString);
  miIndexFields.ObjectName := FixName(miIndexes.FieldByName('INDEX_NAME').AsString);
  miIndexFields.Open;
end;

procedure TfrmMetaInfo.dsPrimaryKeysDataChange(Sender: TObject; Field: TField);
begin
  if FInFixColumnWidth or (Field <> nil) then
    Exit;
  miPrimaryKeyFields.Close;
  if not miPrimaryKeys.Active or miPrimaryKeys.IsEmpty then
    Exit;

  miPrimaryKeyFields.CatalogName := FixName(miPrimaryKeys.FieldByName('CATALOG_NAME').AsString);
  miPrimaryKeyFields.SchemaName := FixName(miPrimaryKeys.FieldByName('SCHEMA_NAME').AsString);
  miPrimaryKeyFields.BaseObjectName := FixName(miPrimaryKeys.FieldByName('TABLE_NAME').AsString);
  miPrimaryKeyFields.ObjectName := FixName(miPrimaryKeys.FieldByName('INDEX_NAME').AsString);
  miPrimaryKeyFields.Open;
end;

procedure TfrmMetaInfo.dsForeignKeysDataChange(Sender: TObject;
  Field: TField);
begin
  if FInFixColumnWidth or (Field <> nil) then
    Exit;
  miForeignKeyFields.Close;
  if not miForeignKeys.Active or miForeignKeys.IsEmpty then
    Exit;

  miForeignKeyFields.CatalogName := FixName(miForeignKeys.FieldByName('CATALOG_NAME').AsString);
  miForeignKeyFields.SchemaName := FixName(miForeignKeys.FieldByName('SCHEMA_NAME').AsString);
  miForeignKeyFields.BaseObjectName := FixName(miForeignKeys.FieldByName('TABLE_NAME').AsString);
  miForeignKeyFields.ObjectName := FixName(miForeignKeys.FieldByName('FKEY_NAME').AsString);
  miForeignKeyFields.Open;
end;

procedure TfrmMetaInfo.dsPackagesDataChange(Sender: TObject; Field: TField);
begin
  if FInFixColumnWidth or (Field <> nil) then
    Exit;
  miPackProcs.Close;
  if not miPackages.Active or miPackages.IsEmpty then
    Exit;

  miPackProcs.CatalogName := FixName(miPackages.FieldByName('CATALOG_NAME').AsString);
  miPackProcs.SchemaName := FixName(miPackages.FieldByName('SCHEMA_NAME').AsString);
  miPackProcs.BaseObjectName := FixName(miPackages.FieldByName('PACKAGE_NAME').AsString);
  miPackProcs.Open;
end;

procedure TfrmMetaInfo.dsPackProcsDataChange(Sender: TObject; Field: TField);
begin
  if FInFixColumnWidth or (Field <> nil) then
    Exit;
  miPackProcArgs.Close;
  if not miPackProcs.Active or miPackProcs.IsEmpty then
    Exit;

  miPackProcArgs.CatalogName := FixName(miPackProcs.FieldByName('CATALOG_NAME').AsString);
  miPackProcArgs.SchemaName := FixName(miPackProcs.FieldByName('SCHEMA_NAME').AsString);
  miPackProcArgs.BaseObjectName := FixName(miPackages.FieldByName('PACKAGE_NAME').AsString);
  miPackProcArgs.ObjectName := FixName(miPackProcs.FieldByName('PROC_NAME').AsString);
  miPackProcArgs.Overload := miPackProcs.FieldByName('OVERLOAD').AsInteger;
  miPackProcArgs.Open;
end;

procedure TfrmMetaInfo.dsProcsDataChange(Sender: TObject; Field: TField);
begin
  if FInFixColumnWidth or (Field <> nil) then
    Exit;
  miProcArgs.Close;
  if not miProcs.Active or miProcs.IsEmpty then
    Exit;

  miProcArgs.CatalogName := FixName(miProcs.FieldByName('CATALOG_NAME').AsString);
  miProcArgs.SchemaName := FixName(miProcs.FieldByName('SCHEMA_NAME').AsString);
  miProcArgs.ObjectName := FixName(miProcs.FieldByName('PROC_NAME').AsString);
  miProcArgs.Open;
end;

procedure TfrmMetaInfo.miTablesAfterOpen(DataSet: TDataSet);
begin
  FixColumnWidth(DataSet);
end;

end.
