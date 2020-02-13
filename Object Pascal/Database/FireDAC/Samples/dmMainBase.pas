
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
{$I FireDAC.inc}

unit dmMainBase;

interface

uses
  SysUtils, Classes, DB, Forms,
  FireDAC.Stan.Intf, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Async, FireDAC.Stan.Def, 
    FireDAC.Stan.Pool, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageXML, 
    FireDAC.Stan.StorageJSON,
  FireDAC.DApt,
{$IFDEF FireDAC_MONITOR}
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile, FireDAC.Moni.RemoteClient,
{$ENDIF}
  FireDAC.Phys.MSAcc, FireDAC.Phys.MySQL, FireDAC.Phys, FireDAC.Phys.ASA, FireDAC.Phys.ADS, 
    FireDAC.Phys.IB, FireDAC.Phys.FB, FireDAC.Phys.PG, FireDAC.Phys.SQLite, FireDAC.Phys.ODBC,
    FireDAC.Phys.Oracle, FireDAC.Phys.DB2, FireDAC.Phys.MSSQL, FireDAC.Phys.Infx, 
    FireDAC.Phys.TDBX, FireDAC.Phys.TData,
  FireDAC.VCLUI.Error, FireDAC.VCLUI.Login, FireDAC.VCLUI.Async, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.UI.Intf, FireDAC.Stan.Error;

type
  TdmlMainBase = class(TDataModule)
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmlMainBase: TdmlMainBase;

implementation

{$R *.dfm}

end.
