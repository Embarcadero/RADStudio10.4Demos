//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fUpdateSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids, DBCtrls,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.VCLUI.ResourceOptions, FireDAC.VCLUI.FetchOptions,
    FireDAC.VCLUI.FormatOptions, FireDAC.VCLUI.UpdateOptions,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Error;

type
  TfrmUpdateSQL = class(TfrmMainCompBase)
    spSel: TFDStoredProc;
    spSelREGIONID: TIntegerField;
    spSelREGIONDESCRIPTION: TStringField;
    dsSel: TDataSource;
    FDUpdateSQL1: TFDUpdateSQL;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdateSQL: TfrmUpdateSQL;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmUpdateSQL.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  cbDB.ItemIndex := cbDB.Items.IndexOf('Oracle_Demo');
  if cbDB.ItemIndex = -1 then
    ShowMessage('This demo requires Oracle_Demo connection definition !'#13#10 +
                'docwiki.embarcadero.com/RADStudio/en/Demo_Databases_(FireDAC)')
  else
    cbDB.OnClick(nil);
end;

procedure TfrmUpdateSQL.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  spSel.Open;
end;

end.
