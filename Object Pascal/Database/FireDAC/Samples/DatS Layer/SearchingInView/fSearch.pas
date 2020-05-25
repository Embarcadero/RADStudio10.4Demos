
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fMainLayers,
  FireDAC.DatS, FireDAC.Stan.Intf, 
  FireDAC.Phys.Intf;

type
  TfrmSearch = class(TfrmMainLayers)
    edtShipperId: TLabeledEdit;
    edtCompanyName: TEdit;
    edtPhone: TEdit;
    Label3: TLabel;
    btnFindSorted: TButton;
    btnLocate: TButton;
    cbLocate: TComboBox;
    Label4: TLabel;
    btnFindUnSorted: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFindSortedClick(Sender: TObject);
    procedure btnLocateClick(Sender: TObject);
    procedure btnFindUnSortedClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
    FTab: TFDDatSTable;
    FDataView: TFDDatSView;
    FCommIntf: IFDPhysCommand;
  public
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

uses
  uDatSUtils;

{$R *.dfm}


procedure TfrmSearch.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create('Tab');
end;

procedure TfrmSearch.FormDestroy(Sender: TObject);
begin
  FTab.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmSearch.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  FConnIntf.CreateCommand(FCommIntf);
  with FCommIntf do begin
    Prepare('select * from {id Shippers}');
    Define(FTab);
    Open;
    Fetch(FTab);
  end;
  PrintRows(FTab, Console.Lines, 'The table...');
  FDataView := FTab.DefaultView;

  btnFindSorted.Enabled := True;
  btnFindUnSorted.Enabled := True;
  btnLocate.Enabled := True;
end;

procedure TfrmSearch.btnFindSortedClick(Sender: TObject);
var
  i: Integer;
begin
  // Add sort to the view and find row using sorted column values
  FDataView.Mechanisms.AddSort('ShipperID;CompanyName');
  i := FDataView.Find([StrToInt(edtShipperId.Text), edtCompanyName.Text]);

  if i <> -1 then
    PrintRow(FDataView.Rows[i], Console.Lines, 'Found row')
  else
    Console.Lines.Add('Row don''t found');
  FDataView.Mechanisms.Clear;
end;

procedure TfrmSearch.btnFindUnSortedClick(Sender: TObject);
var
  i: Integer;
begin
  // Find row specifing column names and values
  i := FDataView.Find([edtShipperId.Text, edtCompanyName.Text, edtPhone.Text],
    'ShipperID;CompanyName;Phone');

  if i <> -1 then
    PrintRow(FDataView.Rows[i], Console.Lines, 'Found row')
  else
    Console.Lines.Add('Row don''t found');
end;

procedure TfrmSearch.btnLocateClick(Sender: TObject);
var
  oMech: TFDDatSMechFilter;
  i: Integer;
begin
  // Locate row using locating mechanism
  oMech := TFDDatSMechFilter.Create(cbLocate.Text);
  oMech.Locator := True;
  FDataView.Mechanisms.Add(oMech);
  FDataView.Locate(i, True, True);

  if i <> -1 then
    PrintRow(FDataView.Rows[i], Console.Lines, 'Found row')
  else
    Console.Lines.Add('Row don''t found');
  FDataView.Mechanisms.Clear;
end;

end.
