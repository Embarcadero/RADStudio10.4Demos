//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fNested;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBClient, Grids, DBGrids, ExtCtrls, fMainBase,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageXML, FireDAC.Stan.StorageBin, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmNested = class(TfrmMainBase)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    FDMemTable2: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNested: TfrmNested;

implementation

{$R *.dfm}

uses
  fNestedCopy;

procedure TfrmNested.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with FDMemTable1.FieldDefs.AddFieldDef do begin
    Name := 'f1';
    DataType := ftInteger;
  end;
  with FDMemTable1.FieldDefs.AddFieldDef do begin
    Name := 'f2';
    DataType := ftString;
    Size := 20;
  end;
  with FDMemTable1.FieldDefs.AddFieldDef do begin
    Name := 'f3';
    DataType := ftDataSet;
    with ChildDefs.AddFieldDef do begin
      Name := 'f31';
      DataType := ftInteger;
    end;
    with ChildDefs.AddFieldDef do begin
      Name := 'f32';
      DataType := ftString;
      Size := 20;
    end;
  end;

  with FDMemTable1 do begin
    Open;
    for i := 1 to 100 do begin
      Append;
      Fields[0].AsInteger := i;
      Fields[1].AsString := 'qqq' + IntToStr(i);
      with (Fields[2] as TDataSetField).NestedDataSet do begin
        Append;
        Fields[0].AsInteger := i * 10 + 1;
        Fields[1].AsString := 'www' + IntToStr(i * 10 + 1);
        Post;
        Append;
        Fields[0].AsInteger := i * 10 + 2;
        Fields[1].AsString := 'eee' + IntToStr(i * 10 + 2);
        Post;
      end;
      Post;
    end;
    First;
  end;
end;

procedure TfrmNested.Button1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    FDMemTable1.SaveToFile(SaveDialog1.FileName);
end;

procedure TfrmNested.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    FDMemTable1.LoadFromFile(OpenDialog1.FileName);
end;

procedure TfrmNested.Button3Click(Sender: TObject);
var
  oFrm: TfrmNestedCopy;
begin
  oFrm := TfrmNestedCopy.Create(nil);
  try
    FDMemTable2.Data := FDMemTable1.Data;
    oFrm.DataSource1.DataSet := FDMemTable2;
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

end.
