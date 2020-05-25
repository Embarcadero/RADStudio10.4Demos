//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ClientModuleUnit;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.FMXUI.Wait,
  FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Stan.StorageBin, System.Generics.Collections;

type
  TDataModuleFDClient = class(TDataModule)
    dsOrders: TDataSource;
    mtCustomers: TFDMemTable;
    taCustomers: TFDTableAdapter;
    dsCustomers: TDataSource;
    mtOrders: TFDMemTable;
    FDSchemaAdapter: TFDSchemaAdapter;
    taOrders: TFDTableAdapter;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TEDSFireDACClientError = class(Exception);

var
  DataModuleFDClient: TDataModuleFDClient;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
