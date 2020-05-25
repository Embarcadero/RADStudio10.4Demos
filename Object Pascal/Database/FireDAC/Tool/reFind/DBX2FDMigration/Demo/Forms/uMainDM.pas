//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uMainDM;

interface

uses
  SysUtils, Classes, DB, SqlExpr, WideStrings, DBXDynalink, Data.DBXInterBase;

type
  TMainDM = class(TDataModule)
    SQLConnection: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDM: TMainDM;

implementation

uses
  Forms, uMainForm;

{$R *.dfm}

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
  if not SQLConnection.Connected then
    SQLConnection.Open;
  TMainForm(Application.MainForm).DBConnection := SQLConnection;
end;

procedure TMainDM.SQLConnectionBeforeConnect(Sender: TObject);
begin
  SQLConnection.LoadParamsFromIniFile
    (IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
    'dbxconnections.ini');
end;

end.
