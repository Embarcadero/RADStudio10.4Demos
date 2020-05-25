//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MainFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    System.Rtti, System.Bindings.Outputs,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Fmx.Bind.Editors,
    Fmx.Bind.DBEngExt, FMX.Layouts, Fmx.Bind.Navigator, FMX.Grid, FMX.StdCtrls,
  Data.Bind.EngExt, Data.Bind.Components, Data.Bind.DBLinks, Fmx.Bind.DBLinks,
    Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.UI, FireDAC.UI.Intf, FireDAC.FMXUI.Login, FireDAC.FMXUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
    FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
    FireDAC.Phys.SQLite;

type
  TfrmMain = class(TForm)
    FDConnection1: TFDConnection;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    Button1: TButton;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    BindScopeDB1: TBindScopeDB;
    BindingsList1: TBindingsList;
    BindDBGridLink1: TBindDBGridLink;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  FDConnection1.Connected := True;
  FDQuery1.Active := not FDQuery1.Active;
end;

end.
