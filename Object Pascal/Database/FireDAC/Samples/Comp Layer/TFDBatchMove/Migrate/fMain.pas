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
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FireDAC.Comp.BatchMove.SQL,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.DataSet, FireDAC.FMXUI.Wait,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI, FMX.ScrollBox, FMX.Memo,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TfrmMain = class(TForm)
    conSrc: TFDConnection;
    conDest: TFDConnection;
    Label1: TLabel;
    edtSrcFile: TEdit;
    Label2: TLabel;
    edtDestFile: TEdit;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button3: TButton;
    ProgressBar1: TProgressBar;
    bmTransfer: TFDBatchMove;
    bmWriter: TFDBatchMoveSQLWriter;
    Label3: TLabel;
    mmLog: TMemo;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    mqSrcTables: TFDMetaInfoQuery;
    bmReader: TFDBatchMoveDataSetReader;
    tblSrc: TFDTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  OpenDialog1.FileName := edtSrcFile.Text;
  if OpenDialog1.Execute then
    edtSrcFile.Text := OpenDialog1.FileName;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  if (edtDestFile.Text = '') and (edtSrcFile.Text <> '') then
    SaveDialog1.FileName := ChangeFileExt(edtSrcFile.Text, '.sdb')
  else
    SaveDialog1.FileName := edtDestFile.Text;
  if SaveDialog1.Execute then
    edtDestFile.Text := SaveDialog1.FileName;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  sTab: string;
begin
  mmLog.Lines.Clear;
  try
    try
      if edtSrcFile.Text = '' then
        raise Exception.Create('Source MDB file name must be specified !');
      if edtDestFile.Text = '' then
        raise Exception.Create('Destination SDB file name must be specified !');
      mmLog.Lines.Add(Format('Migrating database [%s] into [%s]', [edtSrcFile.Text, edtDestFile.Text]));

      if FileExists(edtDestFile.Text) then begin
        mmLog.Lines.Add(Format('Destination file [%s] exists. Deleting', [edtDestFile.Text]));
        DeleteFile(edtDestFile.Text);
      end;

      conSrc.Params.Clear;
      conSrc.Params.DriverID := 'MSAcc';
      conSrc.Params.Database := edtSrcFile.Text;
      conSrc.Connected := True;

      conDest.Params.Clear;
      conDest.Params.DriverID := 'SQLite';
      conDest.Params.Database := edtDestFile.Text;
      TFDPhysSQLiteConnectionDefParams(conDest.Params).OpenMode := omCreateUTF8;
      conDest.Connected := True;

      mqSrcTables.Active := True;
//      mqSrcTables.Wildcard := 'Categories';
      mqSrcTables.FetchAll;
      ProgressBar1.Value := 0;
      ProgressBar1.Max := mqSrcTables.RecordCount;

      while not mqSrcTables.Eof do begin
        mqSrcTables.Next;
        sTab := mqSrcTables.FieldByName('TABLE_NAME').AsString;

        mmLog.Lines.Add(Format('Migrating table [%s]', [sTab]));
        tblSrc.TableName := conSrc.EncodeObjectName('', '', '', sTab);
        bmWriter.TableName := conDest.EncodeObjectName('', '', '', sTab);
        bmTransfer.Execute;

        ProgressBar1.Value := ProgressBar1.Value + 1;
        Application.ProcessMessages;
      end;

    except
      on E: Exception do begin
        mmLog.Lines.Add(E.Message);
        raise;
      end;
    end;
  finally
    conSrc.Connected := False;
    conDest.Connected := False;
  end;
end;

end.
