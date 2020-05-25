//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Phys.Intf,
  FireDAC.UI.Intf, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, DB,
  FireDAC.Comp.Client, FireDAC.Stan.Consts, FireDAC.Stan.Error, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.MySQLDef;

type
  TMainForm = class(TForm)
    mmInfo: TMemo;
    Button1: TButton;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Button2: TButton;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // Output FireDAC build number into form caption
  Caption := Caption + ' - Build with FireDAC v ' + C_FD_Version;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  // Output complete connection status report
  FDConnection1.GetInfoReport(mmInfo.Lines);
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
  oMetaIntf: IFDPhysConnectionMetadata;
begin
  // Get client and server versions
  oMetaIntf := FDConnection1.ConnectionMetaDataIntf;
  ShowMessage(Format('Client version: %.10d; Server version: %.10d',
    [oMetaIntf.ClientVersion, oMetaIntf.ServerVersion]));
end;

end.
