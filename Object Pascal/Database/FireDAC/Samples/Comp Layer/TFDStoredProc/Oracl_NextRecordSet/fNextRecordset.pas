//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit fNextRecordset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, FmtBCD, ComCtrls,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmNextRecordset = class(TfrmMainCompBase)
    spRefCrs: TFDStoredProc;
    dsRefCrs: TDataSource;
    DBGrid1: TDBGrid;
    spInOutPars: TFDStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    edtPin1: TEdit;
    edtPin2: TEdit;
    Label3: TLabel;
    edtPout1: TEdit;
    Label4: TLabel;
    edtPout2: TEdit;
    btnExecProc: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    btnReopen: TButton;
    btnNextRS: TButton;
    Memo1: TMemo;
    Label7: TLabel;
    procedure btnExecProcClick(Sender: TObject);
    procedure btnReopenClick(Sender: TObject);
    procedure btnNextRSClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNextRecordset: TfrmNextRecordset;

implementation

uses
  dmMainComp;

{$R *.dfm}

procedure TfrmNextRecordset.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  cbDB.ItemIndex := cbDB.Items.IndexOf('Oracle_Demo');
  if cbDB.ItemIndex = -1 then
    ShowMessage('This demo requires Oracle_Demo connection definition !'#13#10 +
                'docwiki.embarcadero.com/RADStudio/en/Demo_Databases_(FireDAC)')
  else
    cbDBClick(nil);
end;

procedure TfrmNextRecordset.cbDBClick(Sender: TObject);
begin
  spRefCrs.Close;
  inherited cbDBClick(Sender);
  spRefCrs.Open;
end;

procedure TfrmNextRecordset.btnExecProcClick(Sender: TObject);
begin
  spInOutPars.Prepare;
  spInOutPars.Params[0].AsFloat := StrToFloat(edtPin1.Text);
  spInOutPars.Params[1].AsString := edtPin2.Text;
  spInOutPars.ExecProc;
  edtPout1.Text := spInOutPars.Params[2].AsString;
  edtPout2.Text := spInOutPars.Params[3].AsString;
end;

procedure TfrmNextRecordset.btnReopenClick(Sender: TObject);
begin
  spRefCrs.Close;
  spRefCrs.Open;
end;

procedure TfrmNextRecordset.btnNextRSClick(Sender: TObject);
begin
  spRefCrs.NextRecordSet;
end;

end.
