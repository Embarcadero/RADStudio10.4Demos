unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmMain = class(TForm)
    CheckBoxCustomTitleBar: TCheckBox;
    PanelMain: TPanel;
    CheckBoxCustomColors: TCheckBox;
    CheckBoxShowCaption: TCheckBox;
    CheckBoxShowIcon: TCheckBox;
    ColorBoxActive: TColorBox;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    CheckBoxHeight: TCheckBox;
    ColorBoxInActive: TColorBox;
    Label2: TLabel;
    RadioButtonLeft: TRadioButton;
    Label3: TLabel;
    RadioButtonCenter: TRadioButton;
    RadioButtonRight: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxShowCaptionClick(Sender: TObject);
    procedure CheckBoxCustomTitleBarClick(Sender: TObject);
    procedure CheckBoxCustomColorsClick(Sender: TObject);
    procedure ColorBoxActiveSelect(Sender: TObject);
    procedure ColorBoxInActiveSelect(Sender: TObject);
    procedure CheckBoxShowIconClick(Sender: TObject);
    procedure CheckBoxHeightClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure RadioButtonCenterClick(Sender: TObject);
    procedure RadioButtonLeftClick(Sender: TObject);
    procedure RadioButtonRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.CheckBoxHeightClick(Sender: TObject);
begin
  CustomTitleBar.SystemHeight := not CheckBoxHeight.Checked;
  if not CustomTitleBar.SystemHeight then
    CustomTitleBar.Height := TrackBar1.Position;
end;

procedure TFrmMain.CheckBoxCustomColorsClick(Sender: TObject);
begin
  CustomTitleBar.SystemColors := not CheckBoxCustomColors.Checked;
  if not CustomTitleBar.SystemColors then
  begin
    CustomTitleBar.ForegroundColor := ColorBoxActive.Selected;
    CustomTitleBar.InactiveForegroundColor := ColorBoxInActive.Selected;
  end;
end;

procedure TFrmMain.CheckBoxCustomTitleBarClick(Sender: TObject);
begin
  CustomTitleBar.Enabled := CheckBoxCustomTitleBar.Checked;
end;

procedure TFrmMain.CheckBoxShowCaptionClick(Sender: TObject);
begin
  CustomTitleBar.ShowCaption := CheckBoxShowCaption.Checked;
end;

procedure TFrmMain.CheckBoxShowIconClick(Sender: TObject);
begin
  CustomTitleBar.ShowIcon := CheckBoxShowIcon.Checked;
end;

procedure TFrmMain.ColorBoxActiveSelect(Sender: TObject);
begin
  CustomTitleBar.ForegroundColor := ColorBoxActive.Selected;
end;

procedure TFrmMain.ColorBoxInActiveSelect(Sender: TObject);
begin
  CustomTitleBar.InactiveForegroundColor := ColorBoxInActive.Selected;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  CustomTitleBar.Enabled := True;

  CheckBoxCustomTitleBar.Checked := CustomTitleBar.Enabled;
  CheckBoxShowCaption.Checked := CustomTitleBar.ShowCaption;
  CheckBoxShowIcon.Checked := CustomTitleBar.ShowIcon;
  CheckBoxCustomColors.Checked := not CustomTitleBar.SystemColors;

  ColorBoxActive.Selected := CustomTitleBar.ForegroundColor;
  ColorBoxInActive.Selected := CustomTitleBar.InactiveForegroundColor;

  TrackBar1.Position := CustomTitleBar.Height;

  RadioButtonLeft.Checked := CustomTitleBar.CaptionAlignment = taLeftJustify;
  RadioButtonRight.Checked := CustomTitleBar.CaptionAlignment = taRightJustify;
  RadioButtonCenter.Checked := CustomTitleBar.CaptionAlignment = taCenter;
end;

procedure TFrmMain.RadioButtonCenterClick(Sender: TObject);
begin
  CustomTitleBar.CaptionAlignment := taCenter;
end;

procedure TFrmMain.RadioButtonLeftClick(Sender: TObject);
begin
  CustomTitleBar.CaptionAlignment := taLeftJustify;
end;

procedure TFrmMain.RadioButtonRightClick(Sender: TObject);
begin
  CustomTitleBar.CaptionAlignment := taRightJustify;
end;

procedure TFrmMain.TrackBar1Change(Sender: TObject);
begin
  CustomTitleBar.Height := TrackBar1.Position;
end;

end.
