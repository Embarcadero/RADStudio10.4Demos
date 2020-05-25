
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fGetChanges;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  fMainLayers,
  FireDAC.DatS, FireDAC.Phys.Intf;

type
  TfrmGetChanges = class(TfrmMainLayers)
    btnSelect: TButton;
    cbFilter: TComboBox;
    Label3: TLabel;
    cbSort: TComboBox;
    Label1: TLabel;
    mmInfo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
    FTab, FChanges: TFDDatSTable;
    FDataView: TFDDatSView;
    FCommIntf: IFDPhysCommand;
  public
    { Public declarations }
  end;

var
  frmGetChanges: TfrmGetChanges;

implementation

uses
  uDatSUtils;

{$R *.dfm}

procedure TfrmGetChanges.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create('Tab');
end;

procedure TfrmGetChanges.FormDestroy(Sender: TObject);
begin
  FTab.Free;
  FChanges.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmGetChanges.cbDBClick(Sender: TObject);
var
  i: Integer;
begin
  inherited cbDBClick(Sender);
  FConnIntf.CreateCommand(FCommIntf);

  // 1) Fetch table
  FTab.Clear;
  with FCommIntf do begin
    Prepare('select * from {id Shippers}');
    Define(FTab);
    Open;
    Fetch(FTab);
  end;
  PrintRows(FTab, Console.Lines, 'The table...');
  Console.Lines.Add('');

  // 2) Modify table rows
  for i := 0 to FTab.Rows.Count - 2 do
    with FTab.Rows[i] do begin
      BeginEdit;
      SetValues([Unassigned, Format('%s - #%d', [FTab.Rows[i].GetData(1), i]), Unassigned]);
      EndEdit;
    end;
  PrintRows(FTab, Console.Lines, 'The changed table...');
  Console.Lines.Add('');

  // 3) Get table with changed rows
  FChanges := FTab.GetChanges();
  PrintRows(FChanges, Console.Lines, 'This is a table of changes...');
  Console.Lines.Add('');

  // 4) Add new rows
  for i := 0 to 5 do
    FTab.Rows.Add([Unassigned, 'String' + IntToStr(5 - i), i * 10]);
  PrintRows(FTab, Console.Lines, 'The table...');
  Console.Lines.Add('');

  // 5) Get view with changed rows
  FDataView := FTab.GetChangesView();
  PrintRows(FDataView, Console.Lines, 'This is a view of changes...');
  Console.Lines.Add('');

  btnSelect.Enabled := True;
end;

procedure TfrmGetChanges.btnSelectClick(Sender: TObject);
begin
  // select view
  FDataView := FTab.Select(cbFilter.Text, cbSort.Text);
  PrintRows(FDataView, Console.Lines, 'Selected view...');
  Console.Lines.Add('');
end;

end.
