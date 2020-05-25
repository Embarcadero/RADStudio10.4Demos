//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit OneOfEachForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.Bind.Components, Vcl.ComCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.DBScope, Vcl.Grids,
  Vcl.DBGrids, Data.DB, Datasnap.DBClient, Vcl.DBCtrls, Vcl.Mask, Vcl.Bind.Grid,
  Data.Bind.Grid;

type
  TForm39 = class(TForm)
    PageControl1: TPageControl;
    TabSheetBindExpression: TTabSheet;
    BindingsList1: TBindingsList;
    TabSheetBindExprItems: TTabSheet;
    ListBoxBindExpression: TListBox;
    LabelBindExpression: TLabel;
    BindExpression1: TBindExpression;
    LabelBindExpressio: TLabel;
    LabeledEditBindExprItems: TLabeledEdit;
    ListBoxBindExprItems: TListBox;
    BindExprItems1: TBindExprItems;
    LabelBindExprItemsTip: TLabel;
    TabSheetBindPosition: TTabSheet;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGridBindPosition: TDBGrid;
    ScrollBarBindPosition: TScrollBar;
    BindSourceDB1: TBindSourceDB;
    BindPosition1: TBindPosition;
    LabelDBGridBindPosition: TLabel;
    LabelBindPositionHint: TLabel;
    TabSheetBindLink: TTabSheet;
    DBNavigatorBindLink: TDBNavigator;
    Label1: TLabel;
    LabelBindLink: TLabel;
    LabelBindLinkHint: TLabel;
    BindLink1: TBindLink;
    TabSheetBindList: TTabSheet;
    ListBoxBindList: TListBox;
    BindList1: TBindList;
    TabSheetBindGridList: TTabSheet;
    StringGridBindGridList: TStringGrid;
    BindGridList1: TBindGridList;
    LabelBindGridList: TLabel;
    TabSheetBindGridLink: TTabSheet;
    StringGridBindGridLink: TStringGrid;
    LabelBindGridLink: TLabel;
    DBNavigator1: TDBNavigator;
    LabelBindGridLinkDBEdit: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBNavigatorBindListLink: TDBNavigator;
    Label3: TLabel;
    ListBoxBindListLink: TListBox;
    BindListLink1: TBindListLink;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure ListBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

procedure TForm39.FormCreate(Sender: TObject);
begin
  // Enable Datasource in case it was disabled while designing
  DataSource1.Enabled := True;
end;

procedure TForm39.ListBoxClick(Sender: TObject);
begin
  BindingsList1.Notify(Sender, '');
end;

end.
