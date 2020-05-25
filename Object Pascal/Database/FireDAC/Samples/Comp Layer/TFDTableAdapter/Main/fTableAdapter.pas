//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fTableAdapter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids, DBCtrls, DB,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmTableAdapter = class(TfrmMainCompBase)
    adOrders: TFDTableAdapter;
    cmSelect: TFDCommand;
    cmDelete: TFDCommand;
    cmUpdate: TFDCommand;
    cmInsert: TFDCommand;
    cdsOrders: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTableAdapter: TfrmTableAdapter;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmTableAdapter.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  // Following settings you can make at design time
  // Select command
  cmSelect.CommandText.Text := 'select * from {id Orders}';
  // Delete command
  cmDelete.CommandText.Text := 'delete from {id Orders} where OrderID=:OLD_OrderID';
  // Insert command
  cmInsert.CommandText.Text := 'insert into {id Orders}(OrderID, CustomerID, EmployeeID, OrderDate, ' +
                               'RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ' +
                               'ShipRegion, ShipPostalCode, ShipCountry) values(:NEW_OrderID, :NEW_CustomerID, ' +
                               ':NEW_EmployeeID, :NEW_OrderDate, :NEW_RequiredDate, :NEW_ShippedDate, :NEW_ShipVia, ' +
                               ':NEW_reight, :NEW_ShipName, :NEW_ShipAddress, :NEW_ShipCity, ' +
                               ':NEW_ShipRegion, :NEW_ShipPostalCode, :NEW_ShipCountry)';
  // Update commandt
  cmUpdate.CommandText.Text := 'update {id Orders} set OrderID = :NEW_OrderID, CustomerID = :NEW_CustomerID, ' +
                               'EmployeeID = :NEW_EmployeeID, OrderDate = :NEW_OrderDate, RequiredDate = :NEW_RequiredDate, ' +
                               'ShippedDate = :NEW_ShippedDate, ShipVia = :NEW_ShipVia, ' +
                               'Freight = :NEW_Freight, ShipName = :NEW_ShipName, ShipAddress = :NEW_ShipAddress, ' +
                               'ShipCity = :NEW_ShipCity, ShipRegion = :NEW_ShipRegion, ShipPostalCode = :NEW_ShipRegion, ' +
                               'ShipCountry = :NEW_ShipCountry where OrderID = :OLD_OrderID';
end;

procedure TfrmTableAdapter.cbDBClick(Sender: TObject);
begin
  cmSelect.Close;
  cmDelete.Close;
  cmUpdate.Close;
  cmInsert.Close;
  cdsOrders.Active := False;
  inherited cbDBClick(Sender);
  cdsOrders.Active := True;
end;

end.

