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
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQLDef;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qSelect: TFDQuery;
    btnDelete: TButton;
    btnUpload: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnDownloadExt: TButton;
    FDUpdateSQL1: TFDUpdateSQL;
    qSelectid: TFDAutoIncField;
    qSelectname: TStringField;
    qSelectpath: TWideStringField;
    qSelectrowguid: TGuidField;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    qFileStream: TFDQuery;
    btnDownloadInt: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure btnDownloadExtClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDownloadIntClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Before running the demo review / adjust and run create.sql SQL script.
// The demo uses FSTab table:
//
// create table FSTab (
//   id int IDENTITY(1,1) NOT NULL Primary Key,
//   name varchar(100) NOT NULL,
//   data varbinary(max) filestream NULL,
//   rowguid uniqueidentifier NOT NULL rowguidcol unique DEFAULT (newid())
// )
//
// there "data" is a FILESTREAM column. Each table with a FILESTREAM column
// must have rowguidcol column, so there "rowguid" is rowguidcol column.
// Other columns are optional.
//
// Do not include "data" column into SELECT list. Because that will transfer
// the FILESTREAM content "by a value", instead of using FILESTREAM API.
// Instead include data.PathName().
//
// To use FILESTREAM API use a SQL command with a parameter, which value
// will be set to data.PathName() on the server side. This parameter must
// be setup on the client side as ParamType=ptOutput, StreamMode=smOpenWrite
// or smOpenRead, DataType=ftBlob, FDDataType=dtHBFile. See more details below.

{-------------------------------------------------------------------------------}
procedure TForm1.FormCreate(Sender: TObject);
begin
  FDConnection1.Connected := True;
  qSelect.Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnUploadClick(Sender: TObject);
begin
  if not OpenDialog1.Execute then
    Exit;

  qSelect.Append;
  qSelect.FieldByName('name').AsString := OpenDialog1.FileName + ' at ' + DateTimeToStr(Now());
  qSelect.Post;

  // All FILESTREAM IO operations must be inside of explicit transaction
  FDConnection1.StartTransaction;
  try
    try
      qFileStream.Disconnect;
      // The FILESTREAM parameter must be set on the server side to <FS column>.PathName() value.
      // The FILESTREAM INPUT parameter must have properties:
      // * DataType = ftBlob
      // * FDDataType = dtHBFile
      // * ParamType = ptOutput
      // * StreamMode = smOpenWrite
      qFileStream.Params[0].DataType := ftBlob;
      qFileStream.Params[0].FDDataType := dtHBFile;
      qFileStream.Params[0].ParamType := ptOutput;
      qFileStream.Params[0].StreamMode := smOpenWrite;
      qFileStream.Params[0].AsStream := TFileStream.Create(OpenDialog1.FileName, fmOpenRead or fmShareDenyWrite);
      qFileStream.Params[1].AsInteger := qSelect.FieldByName('id').AsInteger;
      // Here an hidden exception will be raised - just ignore it
      qFileStream.OpenOrExecute;
    finally
      // Set AsStream to nil to release TFileStream
      qFileStream.Params[0].AsStream := nil;
    end;
    FDConnection1.Commit;
  except
    FDConnection1.Rollback;
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnDownloadExtClick(Sender: TObject);
begin
  if (qSelect.FieldByName('path').AsString = '') or
     (qSelect.FieldByName('id').AsInteger = 0) or
     not SaveDialog1.Execute then
    Exit;

  DeleteFile(SaveDialog1.FileName);
  // All FILESTREAM IO operations must be inside of explicit transaction
  FDConnection1.StartTransaction;
  try
    try
      qFileStream.Disconnect;
      // The FILESTREAM parameter must be set on the server side to <FS column>.PathName() value.
      // The FILESTREAM OUTPUT parameter must have properties:
      // * DataType = ftBlob
      // * FDDataType = dtHBFile
      // * ParamType = ptOutput
      // * StreamMode = smOpenRead
      qFileStream.Params[0].DataType := ftBlob;
      qFileStream.Params[0].FDDataType := dtHBFile;
      qFileStream.Params[0].ParamType := ptOutput;
      qFileStream.Params[0].StreamMode := smOpenRead;
      qFileStream.Params[0].AsStream := TFileStream.Create(SaveDialog1.FileName, fmCreate);
      qFileStream.Params[1].AsInteger := qSelect.FieldByName('id').AsInteger;
      // Here an hidden exception will be raised - just ignore it
      qFileStream.OpenOrExecute;
    finally
      // Set AsStream to nil to release TFileStream
      qFileStream.Params[0].AsStream := nil;
    end;
    FDConnection1.Commit;
  except
    FDConnection1.Rollback;
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnDownloadIntClick(Sender: TObject);
var
  oFS: TFileStream;
begin
  if (qSelect.FieldByName('path').AsString = '') or
     (qSelect.FieldByName('id').AsInteger = 0) or
     not SaveDialog1.Execute then
    Exit;

  DeleteFile(SaveDialog1.FileName);
  // All FILESTREAM IO operations must be inside of explicit transaction
  FDConnection1.StartTransaction;
  try
    qFileStream.Disconnect;
    // The FILESTREAM parameter must be set on the server side to <FS column>.PathName() value.
    // The FILESTREAM OUTPUT parameter must have properties:
    // * DataType = ftStream
    // * FDDataType = dtHBFile
    // * ParamType = ptOutput
    // * StreamMode = smOpenRead
    qFileStream.Params[0].DataType := ftStream;
    qFileStream.Params[0].FDDataType := dtHBFile;
    qFileStream.Params[0].ParamType := ptOutput;
    qFileStream.Params[0].StreamMode := smOpenRead;
    qFileStream.Params[1].AsInteger := qSelect.FieldByName('id').AsInteger;
    // Here an hidden exception will be raised - just ignore it
    qFileStream.OpenOrExecute;
    oFS := TFileStream.Create(SaveDialog1.FileName, fmCreate);
    try
      oFS.CopyFrom(qFileStream.Params[0].AsStream, -1);
    finally
      oFS.Free;
    end;
    FDConnection1.Commit;
  except
    FDConnection1.Rollback;
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TForm1.btnDeleteClick(Sender: TObject);
begin
  qSelect.Delete;
end;

end.
