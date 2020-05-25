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
    Dialogs, ComCtrls, StdCtrls, DB, Buttons, Grids, DBGrids, ExtCtrls,
  fMainCompBase,
  FireDAC.Stan.Intf, FireDAC.DatS, FireDAC.Stan.Option, FireDAC.Stan.Param,
    FireDAC.Stan.Error, FireDAC.Stan.Async,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove.Text;

type
  TfrmMain = class(TfrmMainCompBase)
    btnTabToASCMove: TButton;
    btnASCToTabMove: TButton;
    btnTabToTabMove: TButton;
    qryMoved: TFDQuery;
    qryLoaded: TFDQuery;
    dsMoved: TDataSource;
    dsLoaded: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdLoaded: TDBGrid;
    Panel3: TPanel;
    Splitter1: TSplitter;
    grdMoved: TDBGrid;
    FDBatchMove: TFDBatchMove;
    procedure btnTabToASCMoveClick(Sender: TObject);
    procedure btnASCToTabMoveClick(Sender: TObject);
    procedure btnTabToTabMoveClick(Sender: TObject);
    procedure cbDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    procedure CloseQueries;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  dmMainComp,
  FireDAC.Stan.Util;

{$R *.dfm}

{ ---------------------------------------------------------------------------- }
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  with FDBatchMove do begin
    // Use "always insert record" mode
    Mode := dmAlwaysInsert;
    // Erase destination dataset before moving data
    Options := [poClearDest];
  end;
end;

{ ---------------------------------------------------------------------------- }
procedure TfrmMain.cbDBClick(Sender: TObject);
begin
  inherited cbDBClick(Sender);
  btnTabToASCMove.Enabled := True;
  btnASCToTabMove.Enabled := True;
  btnTabToTabMove.Enabled := True;
end;

{ ---------------------------------------------------------------------------- }
procedure TfrmMain.CloseQueries;
begin
  qryMoved.Close;
  qryLoaded.Close;
end;

{ ---------------------------------------------------------------------------- }
// Text file -> DB table
procedure TfrmMain.btnASCToTabMoveClick(Sender: TObject);
begin
  CloseQueries;

  // Create text reader and set FDBatchMode as owner. Then
  // FDBatchMove will automatically manage the reader instance.
  with TFDBatchMoveTextReader.Create(FDBatchMove) do begin
    // Set text data file name
    FileName := ExtractFilePath(Application.ExeName) + 'Data.txt';
    // Setup file format
    DataDef.Separator := ';';
    DataDef.WithFieldNames := True;
  end;
  // Create dataset writer and set FDBatchMode as owner. Then
  // FDBatchMove will automatically manage the writer instance.
  with TFDBatchMoveDataSetWriter.Create(FDBatchMove) do begin
    // Set destination dataset
    DataSet := qryLoaded;
    // Do not set Optimise to True, if dataset is attached to UI
    Optimise := False;
  end;
  // Analyze source text file structure
  FDBatchMove.GuessFormat;
  FDBatchMove.Execute;

  // show data in dbgrid
  qryLoaded.Open;
end;

{ ---------------------------------------------------------------------------- }
// DB table -> DB table
procedure TfrmMain.btnTabToTabMoveClick(Sender: TObject);
begin
  CloseQueries;

  with TFDBatchMoveDataSetReader.Create(FDBatchMove) do begin
    DataSet := qryLoaded;
    Optimise := False;
  end;
  with TFDBatchMoveDataSetWriter.Create(FDBatchMove) do begin
    DataSet := qryMoved;
    Optimise := False;
  end;
  FDBatchMove.Execute;

  // show data in dbgrid
  qryLoaded.Open;
  qryMoved.Open;
end;

{ ---------------------------------------------------------------------------- }
// DB table -> text file
procedure TfrmMain.btnTabToASCMoveClick(Sender: TObject);
begin
  CloseQueries;

  with TFDBatchMoveDataSetReader.Create(FDBatchMove) do begin
    DataSet := qryLoaded;
    Optimise := False;
  end;
  with TFDBatchMoveTextWriter.Create(FDBatchMove) do
    FileName := ExtractFilePath(Application.ExeName) + 'DataOut.txt';
  FDBatchMove.Execute;
end;

end.
