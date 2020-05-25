//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit BindLinkVCLFormUnit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, System.Rtti, Vcl.ExtCtrls, Vcl.DBCtrls, Data.Bind.Components, Data.Bind.DBScope, Vcl.StdCtrls,
  Vcl.AppEvnts, Vcl.Mask, Data.DB, System.Generics.Collections, Vcl.DBCGrids, Vcl.ComCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Datasnap.DBClient, Vcl.Bind.Editors, System.Bindings.Outputs;

type
  TForm1 = class(TForm)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    DBNavigator1: TDBNavigator;
    ApplicationEvents1: TApplicationEvents;
    CheckBoxDataSetActive: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    CategoryReadOnly: TCheckBox;
    BindLinkEditHandler: TBindLink;
    EditWithHandler: TEdit;
    BindLinkMaskEditHandler: TBindLink;
    MaskEditWithHandler: TMaskEdit;
    MemoWithHandler: TMemo;
    BindLinkMemoHandler: TBindLink;
    ListBoxWithHandler: TListBox;
    BindLinkListBoxHandler: TBindLink;
    ImageWithHandler: TImage;
    BindLinkImageHandler: TBindLink;
    LabelBind: TLabel;
    LabelPosition: TLabel;
    BindLinkPosition: TBindLink;
    BindLinkLabel: TBindLink;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    CategoryField: TStringField;
    SpeciesNameField: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField6: TStringField;
    NotesField: TMemoField;
    BlobField2: TBlobField;
    ComboBoxDropDown: TComboBox;
    BindLinkComboBox: TBindLink;
    ComboBoxEdit: TComboBox;
    BindLinkComboBox2: TBindLink;
    Label1: TLabel;
    Label2: TLabel;
    procedure CheckBoxDataSetActiveClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure CategoryReadOnlyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FChecking: Boolean;
    procedure PopulateListBox;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  FChecking := True;
  try
    CheckBoxDataSetActive.Checked := DataSource1.Enabled;
    CategoryReadOnly.Checked := CategoryField.ReadOnly;
  finally
    FChecking := False;
  end;

end;

procedure TForm1.CategoryReadOnlyClick(Sender: TObject);
begin
  if not FChecking then
  begin
    CategoryField.ReadOnly := not CategoryField.ReadOnly;
    NotesField.ReadOnly := not NotesField.ReadOnly;
  end;
end;

procedure TForm1.CheckBoxDataSetActiveClick(Sender: TObject);
begin
  if not FChecking then
    DataSource1.Enabled := CheckBoxDataSetActive.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PopulateListBox;
end;

procedure TForm1.PopulateListBox;
begin
  with DataSource1.DataSet do
  begin
    // Populate category lists
    First;
    while not EOF do
    begin
      ListBoxWithHandler.Items.Add(FieldByName('Category').AsString);
      ComboBoxDropDown.Items.Add(FieldByName('Category').AsString);
      ComboBoxEdit.Items.Add(FieldByName('Category').AsString);
      Next;
    end;
    First;
  end;

end;



end.
