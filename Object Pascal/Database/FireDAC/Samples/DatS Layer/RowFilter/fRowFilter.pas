
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fRowFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fMainLayers,
  FireDAC.DatS, FireDAC.Stan.Intf, 
  FireDAC.Phys.Intf;

type
  TfrmRowFilter = class(TfrmMainLayers)
    cbRowStates: TComboBox;
    cbRowFilter: TComboBox;
    Label3: TLabel;
    Label1: TLabel;
    btnChange: TButton;
    btnAccept: TButton;
    btnResetFilters: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbRowFilterChange(Sender: TObject);
    procedure cbRowStatesChange(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure btnResetFiltersClick(Sender: TObject);
  private
    { Private declarations }
    FTab: TFDDatSTable;
    FDataView: TFDDatSView;
    FCommIntf: IFDPhysCommand;
  public
    { Public declarations }
  end;

var
  frmRowFilter: TfrmRowFilter;

implementation

uses
  uDatSUtils;

{$R *.dfm}


procedure TfrmRowFilter.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create;
end;

procedure TfrmRowFilter.FormDestroy(Sender: TObject);
begin
  FTab.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmRowFilter.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  // fetching table
  FConnIntf.CreateCommand(FCommIntf);
  with FCommIntf do begin
    Prepare('select * from {id Shippers}');
    Define(FTab);
    Open;
    Fetch(FTab);
  end;
  FDataView := FTab.DefaultView;
  PrintRows(FTab, Console.Lines, 'The table...', True);

  cbRowStates.Enabled := True;
  cbRowFilter.Enabled := True;
  btnChange.Enabled := True;
  btnAccept.Enabled := True;
  btnResetFilters.Enabled := True;
end;

procedure TfrmRowFilter.cbRowFilterChange(Sender: TObject);
begin
  with FDataView do begin
    RowFilter := cbRowFilter.Text;
    PrintRows(FDataView, Console.Lines, 'View with RowFilter = ' + cbRowFilter.Text, True);
  end
end;

procedure TfrmRowFilter.cbRowStatesChange(Sender: TObject);
begin
  with FDataView do begin
    RowStateFilter := [TFDDatSRowState(cbRowStates.ItemIndex)];
    PrintRows(FDataView, Console.Lines, 'View with RowStateFilter = ' + cbRowStates.Text, True);
  end
end;

procedure TfrmRowFilter.btnResetFiltersClick(Sender: TObject);
begin
  cbRowStates.ItemIndex := -1;
  cbRowFilter.ItemIndex := -1;
  with FDataView do begin
    RowFilter := '';
    RowStateFilter := [];
  end;
end;

procedure TfrmRowFilter.btnChangeClick(Sender: TObject);
begin
  with FTab.Rows[0] do begin
    BeginEdit;
    SetValues([Unassigned, 'String', 10]);
    EndEdit;
  end;
  FTab.Rows[2].Delete;
  PrintRows(FDataView, Console.Lines, 'View after rows editing...', True);
end;

procedure TfrmRowFilter.btnAcceptClick(Sender: TObject);
begin
  FTab.AcceptChanges;
  PrintRows(FTab, Console.Lines, 'View after accepting row changes...', True);
end;

end.
