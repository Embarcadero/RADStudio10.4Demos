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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Phys.Intf,
  FireDAC.DatS, FireDAC.Stan.Param, FireDAC.DApt.Intf, StdCtrls, Grids, DBGrids,
  DB, FireDAC.Phys, FireDAC.Phys.MSAcc, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.DApt,
  FireDAC.Phys.MSAccDef, FireDAC.Phys.ODBCBase;

type
  TShowDataProc = procedure (ACliHandle: Pointer); stdcall;
  TShutdownProc = procedure; stdcall;

  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FhDll: THandle;
    FpShowData: TShowDataProc;
    FpShutdown: TShutdownProc;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  FireDAC.Stan.Util;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FhDll := LoadLibrary(PChar('Project2.dll'));
  if FhDll = 0 then
    raise Exception.Create(FDLastSystemErrorMsg);
  @FpShowData := GetProcAddress(FhDll, PChar('ShowData'));
  if not Assigned(FpShowData) then
    raise Exception.Create(FDLastSystemErrorMsg);
  @FpShutdown := GetProcAddress(FhDll, PChar('Shutdown'));
  if not Assigned(FpShutdown) then
    raise Exception.Create(FDLastSystemErrorMsg);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FpShowData(FDConnection1.CliHandle);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FpShutdown();
  FreeLibrary(FhDll);
  FhDll := 0;
  @FpShowData := nil;
  @FpShutdown := nil;
end;

end.
