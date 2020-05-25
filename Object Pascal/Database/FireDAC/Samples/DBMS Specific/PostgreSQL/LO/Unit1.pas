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
  Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Def, FireDAC.Phys.Intf, FireDAC.UI.Intf,
  FireDAC.DatS, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DApt.Intf, FireDAC.Comp.Client,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.VCLUI.Wait, FireDAC.Comp.DataSet, pngimage, jpeg, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Phys.PGDef, FireDAC.Comp.UI;

type
  TfrmMain = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button4: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.DataSource1DataChange(Sender: TObject; Field: TField);
var
  oStr: TStream;
  oImg: TPngImage;
begin
  oStr := FDQuery1.CreateBlobStream(FDQuery1.FieldByName('val'), bmRead);
  try
    if oStr.Size > 0 then begin
      oImg := TPngImage.Create;
      oImg.LoadFromStream(oStr);
      Image1.Picture.Graphic := oImg;
    end
    else
      Image1.Picture.Graphic := nil;
  finally
    oStr.Free;
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then
    Exit;
  if not (FDQuery1.State in dsEditModes) then
    FDQuery1.Edit;
  TBLOBField(FDQuery1.FieldByName('val')).LoadFromFile(OpenDialog1.FileName);
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  FDConnection1.StartTransaction;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  FDConnection1.Commit;
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  FDQuery1.Active := not FDQuery1.Active;
end;

end.
