
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
  Dialogs, ExtCtrls, StdCtrls, jpeg, DBCtrls, Grids, DBGrids, DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLite, FireDAC.Comp.DataSet,
  FireDAC.Comp.UI, FireDAC.Comp.Client, FireDAC.VCLUI.Wait;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Image1: TImage;
    Button1: TButton;
    DataSource1: TDataSource;
    Button2: TButton;
    Memo2: TMemo;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
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
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  FireDAC.Phys.SQLiteIniFile;

procedure TForm1.Button1Click(Sender: TObject);
var
  oIniFile: TFDSQLiteIniFile;
  oStream: TMemoryStream;
begin
  oStream  := TMemoryStream.Create;
  oIniFile := TFDSQLiteIniFile.Create('IniFile.db');
  with oIniFile do
    try
      WriteString('sec1', 'string', 'abcd...');
      WriteInteger('sec1', 'integer', 123);
      WriteFloat('sec1', 'float', 567.89);
      WriteDateTime('sec1', 'datetime', Now);

      oStream.LoadFromFile('.\data\winmacmachine.bmp');
      WriteStream('sec2', 'bmp', oStream);

      oStream.Clear;
      Memo1.Lines.SaveToStream(oStream);
      WriteStream('sec2', 'memo', oStream);

      Memo1.Lines.Clear;
      Memo1.Lines.Add('IniFile.db is created an filled')
    finally
      Free;
      oStream.Free;
    end;

  FDQuery1.Open;    
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  oIniFile: TFDSQLiteIniFile;
  oStream: TMemoryStream;
begin
  oStream  := TMemoryStream.Create;
  oIniFile := TFDSQLiteIniFile.Create('IniFile.db');
  with oIniFile do
    try
      Memo2.Clear;
      Memo2.Lines.Add('string = ' + ReadString('sec1', 'string', ''));
      Memo2.Lines.Add('integer = ' + IntToStr(ReadInteger('sec1', 'integer', 0)));
      Memo2.Lines.Add('float = ' + FloatToStr(ReadFloat('sec1', 'float', 0),
        oIniFile.FormatSettings));
      Memo2.Lines.Add('datetime = ' +
        FormatDateTime('dd.mm.yyyy', ReadDateTime('sec1', 'datetime', 0)));

      ReadStream('sec2', 'memo', oStream);
      Memo1.Lines.LoadFromStream(oStream);

      ReadStream('sec2', 'bmp', oStream);
      Image1.Picture.Bitmap.LoadFromStream(oStream);
    finally
      Free;
      oStream.Free;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('unit1.pas');
end;

end.
