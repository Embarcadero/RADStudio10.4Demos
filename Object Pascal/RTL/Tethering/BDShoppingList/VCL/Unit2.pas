//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Rtti,
  Vcl.Grids, Data.DB, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Tether.AppProfile, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtDlgs, System.Actions, Vcl.ActnList,
  Datasnap.DBClient;

type
  TForm2 = class(TForm)
    CDSProducts: TClientDataSet;
    TetherBDTest: TTetheringManager;
    TetherBDTestProfile: TTetheringAppProfile;
    DBGrid1: TDBGrid;
    DsProducts: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBNavigator1: TDBNavigator;
    CDSProductsCode: TAutoIncField;
    CDSProductsProductName: TStringField;
    CDSProductsStock: TIntegerField;
    CDSProductsMinimalStock: TIntegerField;
    ActionList1: TActionList;
    actGetList: TAction;
    procedure CDSProductsAfterPost(DataSet: TDataSet);
    procedure TetherBDTestProfileResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actGetListExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CreateShoppingList;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.actGetListExecute(Sender: TObject);
begin
  CreateShoppingList;
end;

procedure TForm2.CDSProductsAfterPost(DataSet: TDataSet);
begin
  CreateShoppingList;
end;

procedure TForm2.CreateShoppingList;
var
  LShoppingList: TStringList;
begin
  LShoppingList := TStringList.Create;
  LShoppingList.Delimiter := ':';
  CDSProducts.DisableControls;
  try
    CDSProducts.First;
    While not CDSProducts.Eof do
    begin
      if not CDSProductsMinimalStock.IsNull and not CDSProductsStock.IsNull then
        if CDSProductsMinimalStock.Value > CDSProductsStock.Value then
        begin
          LShoppingList.Add(CDSProductsProductName.Value + '-' + CDSProductsCode.AsString + '-'
              + InttoStr(CDSProductsMinimalStock.Value - CDSProductsStock.Value));
        end;
      CDSProducts.Next;
    end;
  finally
    CDSProducts.EnableControls;
  end;
  if LShoppingList.Count > 0 then
    TetherBDTestProfile.Resources.Items[0].Value := LShoppingList.DelimitedText
  else
    TetherBDTestProfile.Resources.Items[0].Value := 'NONE';
  LShoppingList.Free;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CDSProducts.SaveToFile('products.cds');
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  if FileExists('products.cds') then
    CDSProducts.LoadFromFile('products.cds');
end;

procedure TForm2.TetherBDTestProfileResourceReceived(const Sender: TObject;
  const AResource: TRemoteResource);
var
  PID: Integer;
begin
  if AResource.ResType = TRemoteResourceType.Data then
  begin
    PID := StrToInt(AResource.Value.AsString);
    CDSProducts.First;
    while not CDSProducts.Eof do
    begin
      if CDSProductsCode.Value = PID then
      begin
        CDSProducts.Edit;
        CDSProductsStock.Value := CDSProductsStock.Value + 100;
        CDSProducts.Post;
        Break;
      end;
      CDSProducts.Next
    end;
  end;
end;

end.
