//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    conChanges: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qChanges: TFDQuery;
    eaChanges: TFDEventAlerter;
    conOriginal: TFDConnection;
    qOriginal: TFDQuery;
    dsOriginal: TDataSource;
    dsChanges: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Upper grid, conOriginal, qOriginal - allow to modify the data.
// Lower grid, conChanges, qChanges, eaChanges - tracking the changes and display
// changed dataset in lower grid.
//
// Before running the demo review / adjust this form:
//  - conOriginal, conChanges - both are using ConnectionDefName=MSSQL_Demo.
//    Use your own connection definition or specify connection params in Params.
//  - qOriginal, qChanges - both are quering FDQA_TransTable table.
//    Use any one table.
//  - set
//
// Additional requirements:
//  - activate SQL Server service broker before running the project, eg:
//    ALTER DATABASE Northwind SET ENABLE_BROKER
//  - optionally execute:
//    ALTER AUTHORIZATION ON DATABASE::Northwind TO sa
//    More: https://stackoverflow.com/questions/2928836/service-broker-not-working-after-database-restore
//  - use OS authentication for your SQL Server connection.
//  - set TFDEventAlerter.SubscriptionName to any non empty value.
//  - special requirements to the query (qChanges) connected to event alerter:
//    - SELECT list must contain column names, not just '*'
//    - this must be a simple / plain SELECT, no GROUP BY, DISTINCT, etc
//    - table name in FROM must be a full name, which includes schema name
//    More: http://msdn.microsoft.com/en-us/library/ms181122(v=sql.105).aspx

procedure TForm1.Button1Click(Sender: TObject);
begin
  eaChanges.Active := True;
  qChanges.Active := True;

  qOriginal.Active := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  eaChanges.Active := False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  eaChanges.Refresh(qChanges, True);
end;

end.
