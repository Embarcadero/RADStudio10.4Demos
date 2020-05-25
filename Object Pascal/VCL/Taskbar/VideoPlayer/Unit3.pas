//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.TaskbarCore, Vcl.Taskbar,
  Vcl.MPlayer, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    MediaPlayer1: TMediaPlayer;
    OpenDialog1: TOpenDialog;
    Taskbar1: TTaskbar;
procedure Panel1DblClick(Sender: TObject);
    procedure Taskbar1ThumbButtonClick(Sender: TObject; AButtonID: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Panel1DblClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    MediaPlayer1.FileName := OpenDialog1.FileName;
    MediaPlayer1.Open;
  end;
end;

procedure TForm3.Taskbar1ThumbButtonClick(Sender: TObject; AButtonID: Integer);
begin
  case  AButtonID of
    0: MediaPlayer1.Play;
    1: MediaPlayer1.Pause;
  end;
end;

end.
