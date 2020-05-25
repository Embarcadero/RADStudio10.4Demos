//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMainDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, ComCtrls, Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageXML,
  FireDAC.Stan.StorageBin, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Comp.UI,
  fMainBase, Vcl.ExtCtrls;

type
  TfrmMainDemo = class(TfrmMainBase)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edtAggs: TEdit;
    MT: TFDMemTable;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    lbIndexes: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    edtIndName: TEdit;
    Label5: TLabel;
    edtIndFields: TEdit;
    cbxIndPrimary: TCheckBox;
    cbxIndDesc: TCheckBox;
    cbxIndUnique: TCheckBox;
    cbxIndNoCase: TCheckBox;
    cbxIndNullFirst: TCheckBox;
    btnIndAdd: TButton;
    btnIndDel: TButton;
    btnIndMod: TButton;
    btnIndClearAll: TButton;
    Label6: TLabel;
    Label7: TLabel;
    lbAggregates: TListBox;
    edtAggName: TEdit;
    cbxAggActive: TCheckBox;
    Label8: TLabel;
    edtAggExp: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtAggIndexName: TEdit;
    edtAggGrpLevel: TEdit;
    btnAggAdd: TButton;
    btnAggDel: TButton;
    btnAggMod: TButton;
    btnAggClearAll: TButton;
    Label12: TLabel;
    edtFltExp: TEdit;
    cbxFltNoPartial: TCheckBox;
    cbxFltCaseIns: TCheckBox;
    cbxFltActive: TCheckBox;
    cbxFltFound: TCheckBox;
    btnFltFirst: TButton;
    btnFltPrev: TButton;
    btnFltNext: TButton;
    btnFltLast: TButton;
    Label13: TLabel;
    bntRngSetStart: TButton;
    btnRngEditStart: TButton;
    btnRngSetEnd: TButton;
    btnRngEditEnd: TButton;
    btnRngApply: TButton;
    btnRngClear: TButton;
    TabSheet5: TTabSheet;
    cbxRngStartExclusive: TCheckBox;
    cbxRngEndExclusive: TCheckBox;
    cbxCloneReset: TCheckBox;
    cbxCloneKeepSettings: TCheckBox;
    btnCloneDoit: TButton;
    Label1: TLabel;
    edtIndInsFields: TEdit;
    Label14: TLabel;
    edtIndDescFields: TEdit;
    Label15: TLabel;
    edtIndExpression: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    edtIndFilter: TEdit;
    lblGroupState: TLabel;
    Label9: TLabel;
    TabSheet6: TTabSheet;
    Label18: TLabel;
    lbFields: TListBox;
    Label19: TLabel;
    edtFldName: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    edtFldSize: TEdit;
    Label22: TLabel;
    edtFldPrec: TEdit;
    edtFldDataType: TComboBox;
    btnFldAdd: TButton;
    btnFldDel: TButton;
    btnFldMod: TButton;
    cbxFldRequired: TCheckBox;
    cbxFldReadOnly: TCheckBox;
    TabSheet7: TTabSheet;
    btnLoadFromFile: TButton;
    btnSaveToFile: TButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    OpenDialog1: TOpenDialog;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDTable1: TFDTable;
    btnReset: TButton;
    SaveDialog1: TSaveDialog;
    btnGetCustomers: TButton;
    procedure btnIndAddClick(Sender: TObject);
    procedure btnIndDelClick(Sender: TObject);
    procedure btnIndClearAllClick(Sender: TObject);
    procedure lbIndexesDblClick(Sender: TObject);
    procedure btnAggAddClick(Sender: TObject);
    procedure btnAggDelClick(Sender: TObject);
    procedure btnAggClearAllClick(Sender: TObject);
    procedure lbIndexesClick(Sender: TObject);
    procedure lbAggregatesClick(Sender: TObject);
    procedure btnIndModClick(Sender: TObject);
    procedure btnAggModClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure cbxFltActiveClick(Sender: TObject);
    procedure btnFltFirstClick(Sender: TObject);
    procedure btnFltPrevClick(Sender: TObject);
    procedure btnFltNextClick(Sender: TObject);
    procedure btnFltLastClick(Sender: TObject);
    procedure bntRngSetStartClick(Sender: TObject);
    procedure btnRngEditStartClick(Sender: TObject);
    procedure btnRngSetEndClick(Sender: TObject);
    procedure btnRngEditEndClick(Sender: TObject);
    procedure btnRngApplyClick(Sender: TObject);
    procedure btnRngClearClick(Sender: TObject);
    procedure btnCloneDoitClick(Sender: TObject);
    procedure lbFieldsClick(Sender: TObject);
    procedure btnFldAddClick(Sender: TObject);
    procedure btnFldDelClick(Sender: TObject);
    procedure btnFldModClick(Sender: TObject);
    procedure btnLoadFromFileClick(Sender: TObject);
    procedure btnSaveToFileClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnGetCustomersClick(Sender: TObject);
  private
    procedure LoadField;
    procedure LoadFields;
    procedure LoadIndex;
    procedure LoadIndexes;
    procedure LoadAgg;
    procedure LoadAggs;
    procedure UpdateFilter;
    procedure ContentModified;
  end;

var
  frmMainDemo: TfrmMainDemo;

implementation

Uses
  Variants, FireDAC.Stan.ResStrs;

{$R *.DFM}

procedure TfrmMainDemo.FormCreate(Sender: TObject);
var
  i: TFieldType;
begin
  MT.IndexesActive := True;
  MT.AggregatesActive := True;

  edtFldDataType.Items.Clear;
  for i := Low(TFieldType) to High(TFieldType) do
    edtFldDataType.Items.Add(FieldTypeNames[i]);

  OpenDialog1.DefaultExt := S_FD_RegBinDefExt;
  OpenDialog1.Filter := S_FD_RegFDSFilter;
  OpenDialog1.InitialDir := 'C:\Users\Public\Documents\Embarcadero\Studio\19.0\Samples\Data';
  OpenDialog1.FilterIndex := 2;

  SaveDialog1.DefaultExt := S_FD_RegBinDefExt;
  SaveDialog1.Filter := S_FD_RegFDSFilter;
  SaveDialog1.InitialDir := 'C:\Users\Public\Documents\Embarcadero\Studio\19.0\Samples\Data';
  SaveDialog1.FilterIndex := 2;
end;

procedure TfrmMainDemo.ContentModified;
begin
  LoadFields;
  lbFields.ItemIndex := 0;
  lbFieldsClick(nil);

  LoadIndexes;
  lbIndexes.ItemIndex := 1;
  lbIndexesClick(nil);

  LoadAggs;
  lbAggregates.ItemIndex := 0;
  lbAggregatesClick(nil);
end;

{------------------------------------------------------------------------------}
{ Content                                                                      }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.btnLoadFromFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    btnResetClick(nil);
    MT.LoadFromFile(OpenDialog1.FileName);
    ContentModified;
  end;
end;

procedure TfrmMainDemo.btnSaveToFileClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    MT.SaveToFile(SaveDialog1.FileName);
end;

procedure TfrmMainDemo.btnResetClick(Sender: TObject);
begin
  MT.Active := False;
  MT.FieldDefs.Clear;
  MT.Indexes.Clear;
  MT.IndexDefs.Clear;
  MT.IndexFieldNames := '';
  MT.IndexName := '';
  MT.Aggregates.Clear;
  MT.Filter := '';
  MT.FilterOptions := [];
  MT.Filtered := False;
  ContentModified;
end;

procedure TfrmMainDemo.btnGetCustomersClick(Sender: TObject);
begin
  try
    FDTable1.Open();
    MT.CopyDataSet(FDTable1, [coStructure, coIndexesCopy,
      coIndexesReset, coConstraintsReset, coAggregatesReset,
      coRestart, coAppend]);
  except
    MT.FieldDefs.Add('ID', ftAutoInc);
    MT.FieldDefs.Add('Name', ftString, 20);
    MT.Open;
  end;

  ContentModified;
end;

{------------------------------------------------------------------------------}
{ Fields                                                                       }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.btnFldAddClick(Sender: TObject);
var
  oTempDS: TFDMemTable;
begin
  oTempDS := TFDMemTable.Create(nil);
  try
    oTempDS.Data := MT.Data;
    MT.Close;
    with MT.FieldDefs.AddFieldDef do begin
      Name := edtFldName.Text;
      if edtFldDataType.ItemIndex <> -1 then
        DataType := TFieldType(edtFldDataType.ItemIndex);
      if edtFldSize.Text <> '' then
        Size := StrToInt(edtFldSize.Text);
      if edtFldPrec.Text <> '' then
        Precision := StrToInt(edtFldPrec.Text);
      if cbxFldRequired.Checked then
        Attributes := Attributes + [faRequired];
      if cbxFldReadOnly.Checked then
        Attributes := Attributes + [faReadOnly];
    end;
    MT.Open;
    MT.MergeDataSet(oTempDS, dmDataSet, mmNone);
    LoadFields;
  finally
    oTempDS.Free;
  end;
end;

procedure TfrmMainDemo.btnFldDelClick(Sender: TObject);
var
  oTempDS: TFDMemTable;
begin
  if lbFields.ItemIndex >= 0 then begin
    oTempDS := TFDMemTable.Create(nil);
    try
      oTempDS.Data := MT.Data;
      MT.Close;
      MT.FieldDefs[lbFields.ItemIndex].Free;
      MT.Open;
      MT.MergeDataSet(oTempDS, dmDataSet, mmNone);
      LoadFields;
    finally
      oTempDS.Free;
    end;
  end;
end;

procedure TfrmMainDemo.btnFldModClick(Sender: TObject);
var
  oTempDS: TFDMemTable;
begin
  if lbFields.ItemIndex >= 0 then begin
    oTempDS := TFDMemTable.Create(nil);
    try
      oTempDS.Data := MT.Data;
      MT.Close;
      with MT.FieldDefs[lbFields.ItemIndex] do begin
        Name := edtFldName.Text;
        if edtFldDataType.ItemIndex <> -1 then
          DataType := TFieldType(edtFldDataType.ItemIndex);
        if edtFldSize.Text <> '' then
          Size := StrToInt(edtFldSize.Text);
        if edtFldPrec.Text <> '' then
          Precision := StrToInt(edtFldPrec.Text);
        if cbxFldRequired.Checked then
          Attributes := Attributes + [faRequired]
        else
          Attributes := Attributes - [faRequired];
        if cbxFldReadOnly.Checked then
          Attributes := Attributes + [faReadOnly]
        else
          Attributes := Attributes - [faReadOnly];
      end;
      MT.Open;
      MT.MergeDataSet(oTempDS, dmDataSet, mmNone);
      LoadFields;
    finally
      oTempDS.Free;
    end;
  end;
end;

procedure TfrmMainDemo.lbFieldsClick(Sender: TObject);
begin
  LoadField;
end;

procedure TfrmMainDemo.LoadFields;
var
  i, j: Integer;
begin
  j := lbFields.ItemIndex;
  lbFields.Items.Clear;
  if MT.Active then begin
    if not MT.FieldDefs.Updated then
      MT.FieldDefs.Update;
    for i := 0 to MT.FieldDefs.Count - 1 do
      lbFields.Items.Add(MT.FieldDefs[i].Name);
  end;
  if j >= lbFields.Items.Count then
    j := lbFields.Items.Count - 1;
  lbFields.ItemIndex := j;
  LoadField;
end;

procedure TfrmMainDemo.LoadField;
begin
  if lbFields.ItemIndex >= 0 then
    with MT.FieldDefs[lbFields.ItemIndex] do begin
      edtFldName.Text := Name;
      edtFldDataType.ItemIndex := Integer(DataType);
      edtFldSize.Text := IntToStr(Size);
      edtFldPrec.Text := IntToStr(Precision);
      cbxFldRequired.Checked := faRequired in Attributes;
      cbxFldReadOnly.Checked := faReadonly in Attributes;
    end
  else begin
    edtFldName.Text := '';
    edtFldDataType.ItemIndex := -1;
    edtFldSize.Text := '';
    edtFldPrec.Text := '';
    cbxFldRequired.State := cbGrayed;
    cbxFldReadOnly.State := cbGrayed;
  end;
end;

{------------------------------------------------------------------------------}
{ Indexes                                                                      }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.DBGrid1TitleClick(Column: TColumn);
var
  S: String;
  ind: TFDIndex;
begin
  S := 'By_' + Column.FieldName;
  with MT.Indexes do begin
    ind := FindIndex(S);
    if ind = nil then begin
      ind := Add;
      ind.Name := S;
      ind.Fields := Column.FieldName;
      ind.Active := True;
    end
    else begin
      if soDescending in ind.Options then
        ind.Options := ind.Options - [soDescending]
      else
        ind.Options := ind.Options + [soDescending];
    end;
    MT.IndexName := S;
  end;
  LoadIndexes;
end;

procedure TfrmMainDemo.btnIndAddClick(Sender: TObject);
var
  opts: TFDSortOptions;
begin
  with MT.Indexes.Add do begin
    Name := edtIndName.Text;
    if edtIndName.Text <> '' then begin
      Fields := edtIndName.Text;
      CaseInsFields := edtIndInsFields.Text;
      DescFields := edtIndDescFields.Text;
    end
    else if edtIndExpression.Text <> '' then
      Expression := edtIndExpression.Text;
    opts := [];
    if cbxIndPrimary.Checked then
      Include(opts, soPrimary);
    if cbxIndUnique.Checked then
      Include(opts, soUnique);
    if cbxIndDesc.Checked then
      Include(opts, soDescending);
    if cbxIndNoCase.Checked then
      Include(opts, soNoCase);
    if cbxIndNullFirst.Checked then
      Include(opts, soNullFirst);
    Options := opts;
    Filter := edtIndFilter.Text;
    Active := True;
  end;
  LoadIndexes;
end;

procedure TfrmMainDemo.btnIndModClick(Sender: TObject);
var
  opts: TFDSortOptions;
  oInd: TFDIndex;
begin
  if lbIndexes.ItemIndex > 0 then begin
    oInd := MT.Indexes.FindIndex(lbIndexes.Items[lbIndexes.ItemIndex]);
    with oInd do begin
      BeginUpdate;
      Name := edtIndName.Text;
      if edtIndName.Text <> '' then begin
        Fields := edtIndName.Text;
        CaseInsFields := edtIndInsFields.Text;
        DescFields := edtIndDescFields.Text;
      end
      else if edtIndExpression.Text <> '' then
        Expression := edtIndExpression.Text;
      opts := [];
      if cbxIndPrimary.Checked then
        Include(opts, soPrimary);
      if cbxIndUnique.Checked then
        Include(opts, soUnique);
      if cbxIndDesc.Checked then
        Include(opts, soDescending);
      if cbxIndNoCase.Checked then
        Include(opts, soNoCase);
      if cbxIndNullFirst.Checked then
        Include(opts, soNullFirst);
      Options := opts;
      Filter := edtIndFilter.Text;
      EndUpdate;
    end;
    LoadIndexes;
  end;
end;

procedure TfrmMainDemo.btnIndDelClick(Sender: TObject);
begin
  if lbIndexes.ItemIndex > 0 then
    MT.Indexes.IndexByName(lbIndexes.Items[lbIndexes.ItemIndex]).Free;
  LoadIndexes;
end;

procedure TfrmMainDemo.btnIndClearAllClick(Sender: TObject);
begin
  MT.Indexes.Clear;
  LoadIndexes;
end;

procedure TfrmMainDemo.lbIndexesDblClick(Sender: TObject);
begin
  if lbIndexes.ItemIndex > 0 then
    MT.IndexName := lbIndexes.Items[lbIndexes.ItemIndex]
  else begin
    MT.IndexName := '';
    MT.IndexFieldNames := '';
  end;
end;

procedure TfrmMainDemo.lbIndexesClick(Sender: TObject);
begin
  LoadIndex;
end;

procedure TfrmMainDemo.LoadIndexes;
var
  i, j: Integer;
begin
  j := lbIndexes.ItemIndex;
  lbIndexes.Items.Clear;
  lbIndexes.Items.Add('<as is>');
  for i := 0 to MT.Indexes.Count - 1 do
    lbIndexes.Items.Add(MT.Indexes[i].Name);
  if j >= lbIndexes.Items.Count then
    j := lbIndexes.Items.Count - 1;
  lbIndexes.ItemIndex := j;
  LoadIndex;
end;

procedure TfrmMainDemo.LoadIndex;
begin
  if lbIndexes.ItemIndex > 0 then
    with MT.Indexes.FindIndex(lbIndexes.Items[lbIndexes.ItemIndex]) do begin
      edtIndName.Text := Name;
      edtIndName.Text := Fields;
      edtIndInsFields.Text := CaseInsFields;
      edtIndDescFields.Text := DescFields;
      edtIndExpression.Text := Expression;
      edtIndFilter.Text := Filter;
      cbxIndPrimary.Checked := soPrimary in Options;
      cbxIndUnique.Checked := soUnique in Options;
      cbxIndDesc.Checked := soDescending in Options;
      cbxIndNoCase.Checked := soNoCase in Options;
      cbxIndNullFirst.Checked := soNullFirst in Options;
    end
  else begin
    edtIndName.Text := '';
    edtIndName.Text := '';
    edtIndInsFields.Text := '';
    edtIndDescFields.Text := '';
    edtIndExpression.Text := '';
    edtIndFilter.Text := '';
    cbxIndPrimary.State := cbGrayed;
    cbxIndUnique.State := cbGrayed;
    cbxIndDesc.State := cbGrayed;
    cbxIndNoCase.State := cbGrayed;
    cbxIndNullFirst.State := cbGrayed;
  end;
end;

{------------------------------------------------------------------------------}
{ Aggregates                                                                   }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.btnAggAddClick(Sender: TObject);
begin
  with MT.Aggregates.Add do begin
    Name := edtAggName.Text;
    Expression := edtAggExp.Text;
    IndexName := edtAggIndexName.Text;
    GroupingLevel := StrToInt(edtAggGrpLevel.Text);
    Active := cbxAggActive.Checked;
  end;
  LoadAggs;
end;

procedure TfrmMainDemo.btnAggModClick(Sender: TObject);
begin
  if lbAggregates.ItemIndex <> -1 then
    with MT.Aggregates.AggregateByName(lbAggregates.Items[lbAggregates.ItemIndex]) do begin
      Name := edtAggName.Text;
      Expression := edtAggExp.Text;
      IndexName := edtAggIndexName.Text;
      GroupingLevel := StrToInt(edtAggGrpLevel.Text);
      Active := cbxAggActive.Checked;
      LoadAggs;
    end;
end;

procedure TfrmMainDemo.btnAggDelClick(Sender: TObject);
begin
  if lbAggregates.ItemIndex <> -1 then
    MT.Aggregates.AggregateByName(lbAggregates.Items[lbAggregates.ItemIndex]).Free;
  LoadAggs;
end;

procedure TfrmMainDemo.btnAggClearAllClick(Sender: TObject);
begin
  MT.Aggregates.Clear;
  LoadAggs;
end;

procedure TfrmMainDemo.lbAggregatesClick(Sender: TObject);
begin
  LoadAgg;
end;

procedure TfrmMainDemo.LoadAggs;
var
  i, j: Integer;
begin
  j := lbAggregates.ItemIndex;
  lbAggregates.Items.Clear;
  for i := 0 to MT.Aggregates.Count - 1 do
    lbAggregates.Items.Add(MT.Aggregates[i].Name);
  DataSource1DataChange(nil, nil);
  if j >= lbAggregates.Items.Count then
    j := lbAggregates.Items.Count - 1;
  lbAggregates.ItemIndex := j;
  LoadAgg;
end;

procedure TfrmMainDemo.LoadAgg;
begin
  if lbAggregates.ItemIndex <> -1 then
    with MT.Aggregates.AggregateByName(lbAggregates.Items[lbAggregates.ItemIndex]) do begin
      edtAggName.Text := Name;
      edtAggExp.Text := Expression;
      edtAggIndexName.Text := IndexName;
      edtAggGrpLevel.Text := IntToStr(GroupingLevel);
      cbxAggActive.Checked := Active;
    end
  else begin
    edtAggName.Text := '';
    edtAggExp.Text := '';
    edtAggIndexName.Text := '';
    edtAggGrpLevel.Text := '0';
    cbxAggActive.State := cbGrayed;
  end;
end;

procedure TfrmMainDemo.DataSource1DataChange(Sender: TObject; Field: TField);
var
  i: Integer;
  S, S1: String;
  V: Variant;
  esGrpPos: TGroupPosInds;
begin
  for i := 0 to MT.Aggregates.Count - 1 do begin
    if S <> '' then
      S := S + '|';
    S := S + ' ' + MT.Aggregates[i].Name + ' = ';
    V := MT.Aggregates[i].Value;
    if VarIsNull(V) then
      S := S + 'Null'
    else begin
      S1 := V;
      S := S + S1;
    end;
  end;
  edtAggs.Text := S;
  esGrpPos := MT.GetGroupState(MT.GroupingLevel);
  S := '[';
  if gbFirst in esGrpPos then
    S := S + 'S'
  else
    S := S + ' ';
  if gbMiddle in esGrpPos then
    S := S + 'M'
  else
    S := S + ' ';
  if gbLast in esGrpPos then
    S := S + 'L'
  else
    S := S + ' ';
  S := S + ']';
  lblGroupState.Caption := S;
end;

{------------------------------------------------------------------------------}
{ Filtering                                                                    }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.UpdateFilter;
var
  opts: TFilterOptions;
begin
  opts := [];
  if cbxFltNoPartial.Checked then
    opts := opts + [foNoPartialCompare];
  if cbxFltCaseIns.Checked then
    opts := opts + [foCaseInsensitive];
  MT.Filter := edtFltExp.Text;
  MT.FilterOptions := opts;
end;

procedure TfrmMainDemo.cbxFltActiveClick(Sender: TObject);
begin
  UpdateFilter;
  MT.Filtered := cbxFltActive.Checked;
end;

procedure TfrmMainDemo.btnFltFirstClick(Sender: TObject);
begin
  UpdateFilter;
  cbxFltFound.Checked := MT.FindFirst;
end;

procedure TfrmMainDemo.btnFltPrevClick(Sender: TObject);
begin
  UpdateFilter;
  cbxFltFound.Checked := MT.FindPrior;
end;

procedure TfrmMainDemo.btnFltNextClick(Sender: TObject);
begin
  UpdateFilter;
  cbxFltFound.Checked := MT.FindNext;
end;

procedure TfrmMainDemo.btnFltLastClick(Sender: TObject);
begin
  UpdateFilter;
  cbxFltFound.Checked := MT.FindLast;
end;

{------------------------------------------------------------------------------}
{ Ranges                                                                       }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.bntRngSetStartClick(Sender: TObject);
begin
  MT.SetRangeStart;
  MT.KeyExclusive := cbxRngStartExclusive.Checked;
end;

procedure TfrmMainDemo.btnRngEditStartClick(Sender: TObject);
begin
  MT.EditRangeStart;
  MT.KeyExclusive := cbxRngStartExclusive.Checked;
end;

procedure TfrmMainDemo.btnRngSetEndClick(Sender: TObject);
begin
  MT.SetRangeEnd;
  MT.KeyExclusive := cbxRngEndExclusive.Checked;
end;

procedure TfrmMainDemo.btnRngEditEndClick(Sender: TObject);
begin
  MT.EditRangeEnd;
  MT.KeyExclusive := cbxRngEndExclusive.Checked;
end;

procedure TfrmMainDemo.btnRngApplyClick(Sender: TObject);
begin
  MT.ApplyRange;
end;

procedure TfrmMainDemo.btnRngClearClick(Sender: TObject);
begin
  MT.CancelRange;
end;

{------------------------------------------------------------------------------}
{ Cloning                                                                      }
{------------------------------------------------------------------------------}
procedure TfrmMainDemo.btnCloneDoitClick(Sender: TObject);
begin
  with TfrmMainDemo.Create(Application) do begin
    MT.CloneCursor(Self.MT, cbxCloneReset.Checked, cbxCloneKeepSettings.Checked);
    btnGetCustomers.Visible := False;
    Show;
  end;
end;

end.
