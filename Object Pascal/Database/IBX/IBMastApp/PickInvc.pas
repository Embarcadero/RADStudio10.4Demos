//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit PickInvc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Vcl.Buttons;

type
  TPickOrderNoDlg = class(TForm)
    DBLookupListBox1: TDBLookupListBox;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PickOrderNoDlg: TPickOrderNoDlg;

implementation

uses DataMod;

{$R *.dfm}

procedure TPickOrderNoDlg.FormShow(Sender: TObject);
begin
  MastData.Orders.Open;
end;

end.
