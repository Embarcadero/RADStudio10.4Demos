//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit GridLinkFormUnit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, System.Rtti, Vcl.ExtCtrls, Vcl.DBCtrls, Data.Bind.Components, Data.Bind.DBScope, Vcl.StdCtrls,
  Vcl.AppEvnts, Vcl.Mask, Data.DB, System.Generics.Collections, Vcl.DBCGrids, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Editors,
  Datasnap.DBClient, System.Bindings.Outputs;

type
  TGridLinkForm1 = class(TForm)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    DBNavigator1: TDBNavigator;
    ApplicationEvents1: TApplicationEvents;
    CheckBoxDataSetActive: TCheckBox;
    Label3: TLabel;
    BindLinkEditHandler: TBindLink;
    EditWithHandler: TEdit;
    ImageWithHandler: TImage;
    BindLinkImageHandler: TBindLink;
    LabelBind: TLabel;
    BindLinkLabel: TBindLink;
    BindColumnsStringGrid: TBindGridLink;
    StringGridWithBindColumns: TStringGrid;
    EditWithHandler2: TEdit;
    BindLinkEditHandler2: TBindLink;
    DataSource1: TDataSource;
    ClientDataSet2: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    MemoField1: TMemoField;
    BlobField1: TBlobField;
    procedure CheckBoxDataSetActiveClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    FChecking: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GridLinkForm1: TGridLinkForm1;

implementation

uses
  System.Bindings.EvalProtocol, System.Bindings.Methods;

{$R *.dfm}

procedure TGridLinkForm1.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  FChecking := True;
  try
    CheckBoxDataSetActive.Checked := DataSource1.Enabled;
  finally
    FChecking := False;
  end;

end;

procedure TGridLinkForm1.CheckBoxDataSetActiveClick(Sender: TObject);
begin
  if not FChecking then
    DataSource1.Enabled := CheckBoxDataSetActive.Checked;
end;

end.
