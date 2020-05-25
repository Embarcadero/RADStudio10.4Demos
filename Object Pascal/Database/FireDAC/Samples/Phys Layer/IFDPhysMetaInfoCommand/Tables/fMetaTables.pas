
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fMetaTables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls,
  fMainLayers,
  FireDAC.DatS, 
  FireDAC.Phys.Intf;

type
  TfrmMetaTables = class(TfrmMainLayers)
    rgMain: TRadioGroup;
    edtWildCard: TLabeledEdit;
    btnFetch: TButton;
    cbTable: TComboBox;
    Label1: TLabel;
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
  frmMetaTables: TfrmMetaTables;

implementation

uses
  uDatSUtils;

{$R *.dfm}

procedure TfrmMetaTables.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FTab := TFDDatSTable.Create('TableOfMetaInfo');
end;

procedure TfrmMetaTables.FormDestroy(Sender: TObject);
begin
  FMetaCommIntf := nil;
  FTab.Free;
  inherited FormDestroy(Sender);
end;

procedure TfrmMetaTables.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  FConnIntf.CreateMetaInfoCommand(FMetaCommIntf);

  btnFetch.Enabled := True;
end;

procedure TfrmMetaTables.btnFetchClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    with FMetaCommIntf do begin
      MetaInfoKind := mkTables;           // setting the meta info kind
      ObjectScopes := [osMy, osSystem];   // setting scope of objects
      TableKinds   := [tkTable, tkView];  // fetch only info about tables and views
      Wildcard     := edtWildCard.Text;   // use wildcard like "LIKE" in SQL

      Prepare;                            // preparing the meta info command interface
      Define(FTab);                       // defining a meta info table structure
      Open;
      Fetch(FTab);                        // fetching meta info
    end
  else
    with FMetaCommIntf do begin
      // Note! You must encapsulate a table name to the specified for RDBMS separators,
      // for ex. in MySQL the name Categories is to be `Categories`, in DB2 "Categories" etc.
      CommandText  := cbTable.Text;       // setting the table name (in commas) to CommandText
      MetaInfoKind := mkTableFields;      // setting the meta info kind
      Wildcard     := '';

      Prepare;                            // preparing the meta info command interface
      Define(FTab);                       // defining a meta info table structure
      Open;
      Fetch(FTab);                        // fetching meta info
    end;

  Console.Clear;
  PrintRows(FTab, Console.Lines, 'Meta info of tables');
end;

procedure TfrmMetaTables.rgMainClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    cbTable.Enabled := False
  else
    cbTable.Enabled := True;
end;

end.
