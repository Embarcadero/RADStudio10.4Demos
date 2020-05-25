//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit SimpleFormApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.TaskbarCore, Vcl.Taskbar,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls, System.ImageList;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Panel3: TPanel;
    Label3: TLabel;
    Button1: TButton;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    cb1Visible: TCheckBox;
    EdBtn1: TEdit;
    Panel6: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    cb2Visible: TCheckBox;
    EdBtn2: TEdit;
    Panel7: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    cb3Visible: TCheckBox;
    EdBtn3: TEdit;
    Panel4: TPanel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Button2: TButton;
    Button3: TButton;
    EdLeft: TSpinEdit;
    EdHeight: TSpinEdit;
    EdTop: TSpinEdit;
    EdWidth: TSpinEdit;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    TrackBar1: TTrackBar;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    ImageList1: TImageList;
    Taskbar1: TTaskbar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Action1Execute(Sender: TObject);
begin
  if EdBtn1.Text <> '' then
    showmessage('Message from button:' + EdBtn1.Text);
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  if EdBtn2.Text <> '' then
    showmessage('Message from button:' + EdBtn2.Text);
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  if EdBtn3.Text <> '' then
    showmessage('Message from button:' + EdBtn3.Text);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Action1.Visible := cb1Visible.Checked;
  Action2.Visible := cb2Visible.Checked;
  Action3.Visible := cb3Visible.Checked;
  Taskbar1.ApplyButtonsChanges;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Taskbar1.PreviewClipRegion.Left := EdLeft.Value;
  Taskbar1.PreviewClipRegion.Top := EdTop.Value;
  Taskbar1.PreviewClipRegion.Height := EdHeight.Value;
  Taskbar1.PreviewClipRegion.Width := EdWidth.Value;
  Taskbar1.ApplyClipAreaChanges;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Taskbar1.ClearClipArea;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.itemindex of
    0: Taskbar1.ProgressState := TTaskBarProgressState.None;
    1: Taskbar1.ProgressState := TTaskBarProgressState.Normal;
    2: Taskbar1.ProgressState := TTaskBarProgressState.Indeterminate;
    3: Taskbar1.ProgressState := TTaskBarProgressState.Error;
    4: Taskbar1.ProgressState := TTaskBarProgressState.Paused;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  Taskbar1.OverlayIcon := Timage(sender).Picture.Icon;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Taskbar1.ProgressMaxValue := TrackBar1.Max;
  Taskbar1.ProgressValue := TrackBar1.Position;
end;

end.
