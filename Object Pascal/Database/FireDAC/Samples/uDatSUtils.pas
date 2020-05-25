
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{              FireDAC console functions                }
{                                                       }
{ Copyright(c) 2004-2013 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}

unit uDatSUtils;

interface

uses
  SysUtils, Classes, Controls, Variants, StdCtrls, 
  FireDAC.DatS, FireDAC.Stan.Intf;

  procedure PrintHeader(ATab: TFDDatSTable; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False);
  procedure PrintRow(ARow: TFDDatSRow; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False); overload;
  procedure PrintRow(ARow: TFDDatSRow; AConsole: TStrings;
    ARowVer: TFDDatSRowVersion; const ALabel: String = '';
    AWithState: Boolean = False); overload;
  procedure PrintRows(ATab: TFDDatSTable; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False); overload;
  procedure PrintRows(AView: TFDDatSView; AConsole: TStrings;
    const ALabel: String = ''; AWithState: Boolean = False); overload;
  procedure PrintRowVersion(ARow: TFDDatSRow; AConsole: TStrings);
  procedure PrintRowStates(ATab: TFDDatSTable; AConsole: TStrings; const ALabel: String = '');

const
  RowStates: array [TFDDatSRowState] of String = (
    'rsInitializing', 'rsDetached', 'rsInserted', 'rsDeleted', 'rsModified',
    'rsUnchanged', 'rsEditing', 'rsCalculating', 'rsChecking', 'rsDestroying',
    'rsForceWrite', 'rsImportingCurent', 'rsImportingOriginal', 'rsImportingProposed');

  RowVersions: array [TFDDatSRowVersion] of String = ('rvDefault', 'rvCurrent',
    'rvOriginal', 'rvPrevious', 'rvProposed');

implementation

{-------------------------------------------------------------------------------}
function PadVal(AColumn: TFDDatSColumn; const AVal: String): String;
var
  iDispWidth: Integer;
begin
  iDispWidth := AColumn.DisplayWidth;
  if iDispWidth < Length(AColumn.Caption) then
    iDispWidth := Length(AColumn.Caption)
  else if iDispWidth > 25 then
    iDispWidth := 25;
  if Length(AVal) > iDispWidth then
    Result := Copy(AVal, 1, iDispWidth - 4) + ' ...'
  else
    Result := AVal;
  if AColumn.DataType in [dtAnsiString, dtWideString, dtByteString,
                          dtBlob, dtMemo, dtWideMemo, dtXML,
                          dtHBlob, dtHMemo, dtWideHMemo,
                          dtHBFile] then
    Result := Result + StringOfChar(' ', iDispWidth - Length(Result))
  else
    Result := StringOfChar(' ', iDispWidth - Length(Result)) + Result;
end;

{-------------------------------------------------------------------------------}
procedure PrintHeader(ATab: TFDDatSTable; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  i: Integer;
  s: String;
begin
  if ALabel <> '' then
    AConsole.Add(ALabel);
  with ATab do begin
    if AWithState then
      s := 'State      '
    else
      s := '';
    for i := 0 to Columns.Count - 1 do
      s := s + '  ' + PadVal(Columns[i], Columns[i].Name);
    AConsole.Add(s);
  end;
end;

{-------------------------------------------------------------------------------}
procedure PrintRow(ARow: TFDDatSRow; AConsole: TStrings; ARowVer: TFDDatSRowVersion;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  c: Integer;
  s: String;
begin
  if ALabel <> '' then
    AConsole.Add(ALabel);
  if AWithState then begin
    s := RowStates[ARow.RowState];
    if Length(s) < 11 then
      s := s + StringOfChar(' ', 11 - Length(s));
  end
  else
    s := '';
  for c := 0 to ARow.Table.Columns.Count - 1 do
    if ARow.Table.Columns[c].DataType <> dtTime then
      s := s + '  ' + PadVal(ARow.Table.Columns[c], VarToStr(ARow.GetData(c, ARowVer)))
    else
      s := s + '  ' + PadVal(ARow.Table.Columns[c], TimeToStr(VarAsType(ARow.GetData(c, ARowVer), varDate)));
  AConsole.Add(s);
end;

{-------------------------------------------------------------------------------}
procedure PrintRow(ARow: TFDDatSRow; AConsole: TStrings; const ALabel: String = '';
  AWithState: Boolean = False);
begin
  PrintRow(ARow, AConsole, rvDefault, ALabel, AWithState);
end;

{-------------------------------------------------------------------------------}
procedure PrintRows(ATab: TFDDatSTable; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  i: Integer;
begin
  PrintHeader(ATab, AConsole, ALabel, AWithState);
  with ATab do
    for i := 0 to Rows.Count - 1 do
      PrintRow(Rows[i], AConsole, '', AWithState);
  AConsole.Add('');
end;

{-------------------------------------------------------------------------------}
procedure PrintRows(AView: TFDDatSView; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  i: Integer;
begin
  PrintHeader(AView.Table, AConsole, ALabel, AWithState);
  with AView.Table do
    for i := 0 to AView.Rows.Count - 1 do
      PrintRow(AView.Rows[i], AConsole, '', AWithState);
  AConsole.Add('');
end;

{-------------------------------------------------------------------------------}
procedure PrintRowVersion(ARow: TFDDatSRow; AConsole: TStrings);
var
  i: Integer;
  sVer: String;
begin
  for i := 0 to 4 do
    if ARow.HasVersion(TFDDatSRowVersion(i)) then begin
      case i of
      0: sVer := 'rvDefault';
      1: sVer := 'rvCurrent';
      2: sVer := 'rvOriginal';
      3: sVer := 'rvPrevious';
      4: sVer := 'rvProposed';
      end;
      PrintRow(ARow, AConsole, TFDDatSRowVersion(i), 'Row version is ' + sVer);
    end
end;

{-------------------------------------------------------------------------------}
procedure PrintRowStates(ATab: TFDDatSTable; AConsole: TStrings; const ALabel: String = '');
var
  i: Integer;
begin
  if ALabel = '' then
    AConsole.Add('Row states...')
  else
    AConsole.Add(ALabel);
  for i := 0 to ATab.Rows.Count - 1 do
    AConsole.Add(RowStates[ATab.Rows[i].RowState]);
end;

end.
