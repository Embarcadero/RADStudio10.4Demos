//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uAbstractForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan;

type
  TAbstractForm = class(TForm)
    XPManifest: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TAbstractForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
    Action := caFree;
end;

procedure TAbstractForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TAbstractForm.FormShow(Sender: TObject);
begin
  if FormStyle = fsMDIChild then
  begin
    Top := 2;
    Left := 2;
  end;
end;

end.
