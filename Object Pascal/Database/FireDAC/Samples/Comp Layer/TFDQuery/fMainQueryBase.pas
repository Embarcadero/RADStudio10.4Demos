
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fMainQueryBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Grids, DBGrids, DB, StdCtrls, FMTBcd, ComCtrls, ExtCtrls, Buttons,
  fMainBase, fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.UpdateOptions, 
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.FetchOptions, FireDAC.VCLUI.Controls,
  FireDAC.Comp.Client;

type
  TfrmMainQueryBase = class(TfrmMainCompBase)
    pnlSubPageControl: TPanel;
    pcMain: TPageControl;
    tsData: TTabSheet;
    tsOptions: TTabSheet;
    FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree;
    frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions;
    frmResourceOptions: TfrmFDGUIxFormsResourceOptions;
    frmFormatOptions: TfrmFDGUIxFormsFormatOptions;
    frmFetchOptions: TfrmFDGUIxFormsFetchOptions;
    pnlDataSet: TPanel;
    btnSave: TSpeedButton;
    lblDataSet: TLabel;
    cbDataSet: TComboBox;
    pnlMainSep: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure cbDataSetClick(Sender: TObject);
  private
    FDataSets: TList;
  protected
    procedure RegisterDS(ADataSet: TFDRdbmsDataSet);
  public
    procedure GetConnectionDefs(AList: TStrings); override;
    procedure SetConnDefName(AConnDefName: String); override;
    procedure ConnectionActive(AValue: Boolean); override;
    function GetFormatOptions: TFDFormatOptions; override;
    function GetRDBMSKind: TFDRDBMSKind; override;
  end;

  TFDHackDataSet = class(TFDRdbmsDataSet)
  public
    property UpdateOptions;
    property FormatOptions;
    property FetchOptions;
    property ResourceOptions;
  end;

var
  frmMainQueryBase: TfrmMainQueryBase;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmMainQueryBase.FormCreate(Sender: TObject);
begin
  FDataSets := TList.Create;
  inherited FormCreate(Sender);
end;

procedure TfrmMainQueryBase.FormDestroy(Sender: TObject);
begin
  FDataSets.Free;
  FDataSets := nil;
end;

procedure TfrmMainQueryBase.RegisterDS(ADataSet: TFDRdbmsDataSet);
begin
  FDataSets.Add(ADataSet);
  cbDataSet.Items.Add(ADataSet.Name);
end;

procedure TfrmMainQueryBase.cbDataSetClick(Sender: TObject);
var
  oDS: TFDHackDataSet;
begin
  if FDataSets.Count = 0 then
    Exit;
  oDS := TFDHackDataSet(FDataSets[cbDataSet.ItemIndex]);
  frmUpdateOptions.LoadFrom(oDS.UpdateOptions);
  frmFormatOptions.LoadFrom(oDS.FormatOptions);
  frmFetchOptions.LoadFrom(oDS.FetchOptions);
  frmResourceOptions.LoadFrom(oDS.ResourceOptions);
end;

procedure TfrmMainQueryBase.btnSaveClick(Sender: TObject);
var
  oDS: TFDHackDataSet;
begin
  oDS := TFDHackDataSet(FDataSets[cbDataSet.ItemIndex]);
  frmUpdateOptions.SaveTo(oDS.UpdateOptions);
  frmFormatOptions.SaveTo(oDS.FormatOptions);
  frmFetchOptions.SaveTo(oDS.FetchOptions);
  frmResourceOptions.SaveTo(oDS.ResourceOptions);
end;

procedure TfrmMainQueryBase.pcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pcMain.ActivePage = tsData then begin
    if cbDataSet.ItemIndex = -1 then
      cbDataSet.ItemIndex := 0;
    cbDataSetClick(nil);
  end;
  AllowChange := True;
end;

procedure TfrmMainQueryBase.GetConnectionDefs(AList: TStrings);
begin
  FDManager.GetConnectionDefNames(AList);
end;

procedure TfrmMainQueryBase.ConnectionActive(AValue: Boolean);
begin
  if AValue then
    dmlMainComp.dbMain.Open
  else
    dmlMainComp.dbMain.Close;
end;

procedure TfrmMainQueryBase.SetConnDefName(AConnDefName: String);
begin
  dmlMainComp.dbMain.ConnectionDefName := AConnDefName;
end;

function TfrmMainQueryBase.GetFormatOptions: TFDFormatOptions;
begin
  Result := dmlMainComp.dbMain.FormatOptions;
end;

function TfrmMainQueryBase.GetRDBMSKind: TFDRDBMSKind;
begin
  Result := dmlMainComp.dbMain.RDBMSKind;
end;

end.
