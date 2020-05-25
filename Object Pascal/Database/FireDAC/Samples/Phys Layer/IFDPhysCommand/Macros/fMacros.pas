//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMacros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ComCtrls, Grids, ValEdit,
  fMainLayers,
  FireDAC.DatS, FireDAC.Stan.Intf, FireDAC.Phys.Intf;

type
  TfrmMacros = class(TfrmMainLayers)
    btnFetch: TButton;
    mmComment: TMemo;
    lstMacros: TValueListEditor;
    mmSQL: TMemo;
    lblDataType: TLabel;
    cbDataType: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnFetchClick(Sender: TObject);
    procedure lstMacrosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbDataTypeChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure lstMacrosSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
  private
    { Private declarations }
    FTab: TFDDatSTable;
    FCommIntf: IFDPhysCommand;
  public
    { Public declarations }
  end;

var
  frmMacros: TfrmMacros;

implementation

uses
  uDatSUtils,
  FireDAC.Stan.Param;

{$R *.dfm}

procedure TfrmMacros.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create;
  mmSQL.Lines.Text := 'select !column from !tab where (!id !Sign !idValue)';
end;

procedure TfrmMacros.FormDestroy(Sender: TObject);
begin
  FTab.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmMacros.cbDBClick(Sender: TObject);
var
  i: Integer;
  l: Boolean;
begin
  inherited cbDBClick(Sender);
  FTab.Clear;

  FConnIntf.CreateCommand(FCommIntf);
  with FCommIntf do begin
    CommandText := mmSQL.Lines.Text;
    // Setting up the Macros
    with Macros.Items[0] do begin
      Value := 'ADDRESS';
      Name := 'COLUMN';
      DataType := mdIdentifier;
    end;
    with Macros.Items[1] do begin
      Value := 'Employees';
      Name := 'TAB';
      DataType := mdIdentifier;
    end;
    with Macros.Items[2] do begin
      Value := 'BIRTHDATE';
      Name := 'ID';
      DataType := mdIdentifier;
    end;
    with Macros.Items[3] do begin
      Value := '>';
      Name := 'Sign';
      DataType := mdRaw;
    end;
    with Macros.Items[4] do begin
      Value := '1948-10-01';
      Name := 'IDVALUE';
      DataType := mdDate;
    end;

  // filling ValueListEditor
  lstMacros.Strings.Clear;
  for i := 0 to Macros.Count - 1 do
    lstMacros.InsertRow(Macros[i].Name, Macros[i].Value, True);
  end;
  lstMacrosSelectCell(nil, 0, 1, l);

  btnFetch.Enabled := True;
  lstMacros.Enabled := True;
  cbDataType.Enabled := True;
end;

procedure TfrmMacros.btnFetchClick(Sender: TObject);
begin
  with FCommIntf do begin
    Prepare;
    Define(FTab);
    Open;
    Fetch(FTab, True);
  end;

  PrintRows(FTab, Console.Lines);
end;

procedure TfrmMacros.lstMacrosSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  cbDataType.ItemIndex := Ord(FCommIntf.Macros[ARow - 1].DataType);
end;

procedure TfrmMacros.cbDataTypeChange(Sender: TObject);
begin
  FCommIntf.Macros[lstMacros.Row - 1].DataType := TFDMacroDataType(cbDataType.ItemIndex);
end;

procedure TfrmMacros.lstMacrosSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  FCommIntf.Macros[ARow - 1].Value := Value;
end;

end.
