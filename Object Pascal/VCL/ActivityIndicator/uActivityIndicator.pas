//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uActivityIndicator;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.WinXCtrls,
  Vcl.StdCtrls,
  Vcl.ImgList,
  Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TActivityIndicatorForm = class(TForm)
    chkAnimate: TCheckBox;
    trkFrameDelay: TTrackBar;
    lblFrameDelay: TLabel;
    grpIndicatorType: TRadioGroup;
    grpIndicatorSize: TRadioGroup;
    grpIndicatorColor: TRadioGroup;
    cbxVclStyles: TComboBox;
    lblVclStyle: TLabel;
    AI: TActivityIndicator;
    cbxFormColor: TColorBox;
    lblFormColor: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure chkAnimateClick(Sender: TObject);
    procedure trkFrameDelayChange(Sender: TObject);
    procedure grpIndicatorTypeClick(Sender: TObject);
    procedure grpIndicatorSizeClick(Sender: TObject);
    procedure grpIndicatorColorClick(Sender: TObject);
    procedure cbxVclStylesChange(Sender: TObject);
    procedure cbxFormColorChange(Sender: TObject);
  private
  public
  end;

var
  ActivityIndicatorForm: TActivityIndicatorForm;

implementation

{$R *.dfm}

uses
  Vcl.Themes;

procedure TActivityIndicatorForm.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);

  cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

procedure TActivityIndicatorForm.cbxFormColorChange(Sender: TObject);
begin
  Color := cbxFormColor.Selected;
end;

procedure TActivityIndicatorForm.cbxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbxVclStyles.Text);
  lblFormColor.Enabled := StyleServices.IsSystemStyle;
  cbxFormColor.Enabled := StyleServices.IsSystemStyle;
end;

procedure TActivityIndicatorForm.grpIndicatorColorClick(Sender: TObject);
begin
  AI.IndicatorColor := TActivityIndicatorColor(grpIndicatorColor.ItemIndex);
end;

procedure TActivityIndicatorForm.grpIndicatorSizeClick(Sender: TObject);
begin
  AI.IndicatorSize := TActivityIndicatorSize(grpIndicatorSize.ItemIndex);
end;

procedure TActivityIndicatorForm.grpIndicatorTypeClick(Sender: TObject);
begin
  AI.IndicatorType := TActivityIndicatorType(grpIndicatorType.ItemIndex);
end;

procedure TActivityIndicatorForm.trkFrameDelayChange(Sender: TObject);
begin
  AI.FrameDelay := trkFrameDelay.Position * 10;
  lblFrameDelay.Caption := 'Frame Delay (' + IntToStr(AI.FrameDelay) + ')';
end;

procedure TActivityIndicatorForm.chkAnimateClick(Sender: TObject);
begin
  AI.Animate := chkAnimate.Checked;
end;


end.
