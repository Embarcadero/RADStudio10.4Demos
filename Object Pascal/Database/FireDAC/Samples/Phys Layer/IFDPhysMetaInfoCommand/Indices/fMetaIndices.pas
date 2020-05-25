//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMetaIndices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls,
  fMainLayers,
  FireDAC.DatS, FireDAC.Phys.Intf;

type
  TfrmMetaIndices = class(TfrmMainLayers)
    rgMain: TRadioGroup;
    edtWildCard: TLabeledEdit;
    btnFetch: TButton;
    edtIndexName: TLabeledEdit;
    edtTableName: TLabeledEdit;
    mmInfo: TMemo;
    procedure btnFetchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgMainClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    FMetaCommIntf: IFDPhysMetaInfoCommand;
    FTab: TFDDatSTable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMetaIndices: TfrmMetaIndices;

implementation

uses
  uDatSUtils;

{$R *.dfm}

procedure TfrmMetaIndices.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create('TableOfMetaInfo');
end;

procedure TfrmMetaIndices.FormDestroy(Sender: TObject);
begin
  FMetaCommIntf := nil;
  FTab.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmMetaIndices.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  btnFetch.Enabled := True;

  FConnIntf.CreateMetaInfoCommand(FMetaCommIntf);

  edtTableName.Text := EncodeName('Customers');
  edtIndexName.Text := EncodeName('');
end;

procedure TfrmMetaIndices.btnFetchClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    with FMetaCommIntf do begin
      CommandText  := edtTableName.Text;
      MetaInfoKind := mkIndexes;          // setting the meta info kind
      {
        if you'd like fetch info only of primary keys in the base, you should
        set MetaInfoKind := mkPrimaryKey
      }
      ObjectScopes := [osMy, osSystem];   // setting scope of objects
      Wildcard     := edtWildCard.Text;   // use wildcard like "LIKE" in SQL

      Prepare;                            // preparing the meta info command interface
      Define(FTab);                       // defining a meta info table structure
      Open;
      Fetch(FTab);                        // fetching meta info
    end
  else
    with FMetaCommIntf do begin
      // Note: Non-standard table name (and/or index name) must be quoted.
      // For example for MySQL the Categories must be set as `Categories`.
      BaseObjectName := edtTableName.Text;  // setting the table name to BaseObjectName
      CommandText    := edtIndexName.Text;  // setting the index name to CommandText
      MetaInfoKind   := mkIndexFields;      // setting the meta info kind
      Wildcard       := '';
      {
        if you'd like fetch info only of primary key fields, you should
        set MetaInfoKind := mkPrimaryKeyFields
      }

      Prepare;                            // preparing the meta info command interface
      Define(FTab);                       // defining a meta info table structure
      Open;
      Fetch(FTab);                        // fetching meta info
    end;

  Console.Clear;
  PrintRows(FTab, Console.Lines, 'Meta info about indices');
end;

procedure TfrmMetaIndices.rgMainClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    edtIndexName.Enabled := False
  else
    edtIndexName.Enabled := True;
end;

end.
