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
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo;

type
  TfrmMain = class(TForm)
    FDConnection1: TFDConnection;
    FDStoredProc1: TFDStoredProc;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    Button1: TButton;
    Memo1: TMemo;
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

uses
  Data.FmtBCD;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  FDStoredProc1.ParamByName('P_ORD_DATA$ORD_ID').AsFMTBCD := IntegerToBcd(229955);
  FDStoredProc1.ParamByName('P_ORD_DATA$CLIENT_DATA$CLIENT_ID').AsFMTBCD := IntegerToBcd(1234);
  FDStoredProc1.ParamByName('P_ORD_DATA$CLIENT_DATA$NAME').AsString := 'AcmeSys';
  FDStoredProc1.ParamByName('P_ORD_DATA$CLIENT_DATA$ACT').AsInteger := 1;
  FDStoredProc1.ParamByName('P_ORD_DATA$SUMMA').AsFMTBCD := DoubleToBcd(4999.00);

  FDStoredProc1.ExecProc;

  Memo1.Lines.Add('RATE = ' + FDStoredProc1.ParamByName('RESULT$RATE').AsString);
  Memo1.Lines.Add('DISCOUNT = ' + FDStoredProc1.ParamByName('RESULT$DISCOUNT').AsString);
end;

end.
