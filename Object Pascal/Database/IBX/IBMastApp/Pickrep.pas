//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Pickrep;

interface

uses Windows, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls;

type
  TPickRpt = class(TForm)
    OKBtn: TButton;
    CloseBtn: TButton;
    ViewBtn: TButton;
    ReportType: TRadioGroup;
    procedure OKBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
  public  
    Preview : Boolean;
  end;

var
  PickRpt: TPickRpt;

implementation

{$R *.dfm}

procedure TPickRpt.OKBtnClick(Sender: TObject);
begin
  Preview := False;
end;

procedure TPickRpt.ViewBtnClick(Sender: TObject);
begin
  Preview := True;
end;

end.
