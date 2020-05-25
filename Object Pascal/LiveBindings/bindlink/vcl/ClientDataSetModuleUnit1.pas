//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ClientDataSetModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TClientDataSetModule1 = class(TDataModule)
    ClientDataSet1: TClientDataSet;
    CategoryField: TStringField;
    SpeciesNameField: TStringField;
    LengthCmField: TFloatField;
    LengthInField: TFloatField;
    CommonNameField: TStringField;
    NotesField: TMemoField;
    GraphicField: TBlobField;
    ClientDataSetDataSource1: TDataSource;
    ClientDataSet2: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    MemoField1: TMemoField;
    BlobField1: TBlobField;
    procedure ClientDataSetDataSource1UpdateData(Sender: TObject);
    procedure ClientDataSetDataSource1DataChange(Sender: TObject;
      Field: TField);
    procedure CategoryFieldValidate(Sender: TField);
    procedure CategoryFieldSetText(Sender: TField; const Text: string);
    procedure CategoryFieldChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientDataSetModule1: TClientDataSetModule1;

implementation

{$R *.dfm}

procedure TClientDataSetModule1.CategoryFieldChange(Sender: TField);
begin
//
end;

procedure TClientDataSetModule1.CategoryFieldSetText(Sender: TField;
  const Text: string);
begin
//
  if Text = 'invalid' then
    raise Exception.Create('Invalid text')
  else
    Sender.Value := Text;
end;

procedure TClientDataSetModule1.CategoryFieldValidate(Sender: TField);
begin
//
end;

procedure TClientDataSetModule1.ClientDataSetDataSource1DataChange(
  Sender: TObject; Field: TField);
begin
//
end;

procedure TClientDataSetModule1.ClientDataSetDataSource1UpdateData(
  Sender: TObject);
begin
//
end;

end.
