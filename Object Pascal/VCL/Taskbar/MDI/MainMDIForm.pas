//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit MainMDIForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.StdActns, MDIChild;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    FileOpen1: TFileOpen;
    Open1: TMenuItem;
    procedure FileOpen1Accept(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FileOpen1Accept(Sender: TObject);
begin
  with TFrMDIChild.Create(Self) do
  begin
    Visible := true;
    Image1.Picture.LoadFromFile(FileOpen1.Dialog.FileName);
  end;
end;

end.
