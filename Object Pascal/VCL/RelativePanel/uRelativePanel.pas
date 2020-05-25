//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uRelativePanel;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons;

type
  TRelativePanelForm = class(TForm)
    Label2: TLabel;
    cbxVclStyles: TComboBox;
    RelativePanel1: TRelativePanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    cb1AlignLeftWithPanel: TCheckBox;
    cb1AlignHorizontalCenterWithPanel: TCheckBox;
    cb1AlignRightWithPanel: TCheckBox;
    cb1AlignTopWithPanel: TCheckBox;
    cb1AlignVerticalCenterWithPanel: TCheckBox;
    cb1AlignBottomWithPanel: TCheckBox;
    cbx1LeftOf: TComboBox;
    cbx1AlignLeftWith: TComboBox;
    cbx1AlignHorizontalCenterWith: TComboBox;
    cbx1AlignRightWith: TComboBox;
    cbx1RightOf: TComboBox;
    cbx1Above: TComboBox;
    cbx1AlignTopWith: TComboBox;
    cbx1AlignVerticalCenterWith: TComboBox;
    cbx1AlignBottomWith: TComboBox;
    cbx1Below: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Bevel2: TBevel;
    cb2AlignLeftWithPanel: TCheckBox;
    cb2AlignHorizontalCenterWithPanel: TCheckBox;
    cb2AlignRightWithPanel: TCheckBox;
    cb2AlignTopWithPanel: TCheckBox;
    cb2AlignVerticalCenterWithPanel: TCheckBox;
    cb2AlignBottomWithPanel: TCheckBox;
    cbx2LeftOf: TComboBox;
    cbx2AlignLeftWith: TComboBox;
    cbx2AlignHorizontalCenterWith: TComboBox;
    cbx2AlignRightWith: TComboBox;
    cbx2RightOf: TComboBox;
    cbx2Above: TComboBox;
    cbx2AlignTopWith: TComboBox;
    cbx2AlignVerticalCenterWith: TComboBox;
    cbx2AlignBottomWith: TComboBox;
    cbx2Below: TComboBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Bevel3: TBevel;
    cb3AlignLeftWithPanel: TCheckBox;
    cb3AlignHorizontalCenterWithPanel: TCheckBox;
    cb3AlignRightWithPanel: TCheckBox;
    cb3AlignTopWithPanel: TCheckBox;
    cb3AlignVerticalCenterWithPanel: TCheckBox;
    cb3AlignBottomWithPanel: TCheckBox;
    cbx3LeftOf: TComboBox;
    cbx3AlignLeftWith: TComboBox;
    cbx3AlignHorizontalCenterWith: TComboBox;
    cbx3AlignRightWith: TComboBox;
    cbx3RightOf: TComboBox;
    cbx3Above: TComboBox;
    cbx3AlignTopWith: TComboBox;
    cbx3AlignVerticalCenterWith: TComboBox;
    cbx3AlignBottomWith: TComboBox;
    cbx3Below: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Shape1: TShape;
    Label32: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbxVclStylesChange(Sender: TObject);
    procedure cbAlignLeftWithPanelClick(Sender: TObject);
    procedure cbAlignHorizontalCenterWithPanelClick(Sender: TObject);
    procedure cbAlignRightWithPanelClick(Sender: TObject);
    procedure cbAlignTopWithPanelClick(Sender: TObject);
    procedure cbAlignVerticalCenterWithPanelClick(Sender: TObject);
    procedure cbAlignBottomWithPanelClick(Sender: TObject);
    procedure cbxLeftOfChange(Sender: TObject);
    procedure cbxAlignLeftWithChange(Sender: TObject);
    procedure cbxAlignHorizontalCenterWithChange(Sender: TObject);
    procedure cbxAlignRightWithChange(Sender: TObject);
    procedure cbxRightOfChange(Sender: TObject);
    procedure cbxAboveChange(Sender: TObject);
    procedure cbxAlignTopWithChange(Sender: TObject);
    procedure cbxAlignVerticalCenterWithChange(Sender: TObject);
    procedure cbxAlignBottomWithChange(Sender: TObject);
    procedure cbxBelowChange(Sender: TObject);
    procedure RelativePanel1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure RelativePanel1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SampleControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FStartDragPosOffset: TPoint;
  public
    { Public declarations }
    function SelectedControl(aComboBox: TComboBox): TControl;
  end;

var
  RelativePanelForm: TRelativePanelForm;

implementation

{$R *.dfm}

uses
  Vcl.Themes;

procedure TRelativePanelForm.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);

  cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

procedure TRelativePanelForm.cbxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbxVclStyles.Text);
end;

function TRelativePanelForm.SelectedControl(aComboBox: TComboBox): TControl;
begin
  Result := nil;
  if aComboBox.Items[aComboBox.ItemIndex] = 'Edit1' then
    Result := Edit1
  else if aComboBox.Items[aComboBox.ItemIndex] = 'Button1' then
    Result := Button1
  else if aComboBox.Items[aComboBox.ItemIndex] = 'Shape1' then
    Result := Shape1;
end;

procedure TRelativePanelForm.cbAlignBottomWithPanelClick(Sender: TObject);
var
  CheckBox: TCheckBox;
begin
  CheckBox := TCheckBox(Sender);
  RelativePanel1.ControlCollection[CheckBox.Tag].AlignBottomWithPanel := CheckBox.Checked;
end;

procedure TRelativePanelForm.cbAlignHorizontalCenterWithPanelClick(Sender: TObject);
var
  CheckBox: TCheckBox;
begin
  CheckBox := TCheckBox(Sender);
  RelativePanel1.ControlCollection[CheckBox.Tag].AlignHorizontalCenterWithPanel := CheckBox.Checked;
end;

procedure TRelativePanelForm.cbAlignLeftWithPanelClick(Sender: TObject);
var
  CheckBox: TCheckBox;
begin
  CheckBox := TCheckBox(Sender);
  RelativePanel1.ControlCollection[CheckBox.Tag].AlignLeftWithPanel := CheckBox.Checked;
end;

procedure TRelativePanelForm.cbAlignRightWithPanelClick(Sender: TObject);
var
  CheckBox: TCheckBox;
begin
  CheckBox := TCheckBox(Sender);
  RelativePanel1.ControlCollection[CheckBox.Tag].AlignRightWithPanel := CheckBox.Checked;
end;

procedure TRelativePanelForm.cbAlignTopWithPanelClick(Sender: TObject);
var
  CheckBox: TCheckBox;
begin
  CheckBox := TCheckBox(Sender);
  RelativePanel1.ControlCollection[CheckBox.Tag].AlignTopWithPanel := CheckBox.Checked;
end;

procedure TRelativePanelForm.cbAlignVerticalCenterWithPanelClick(Sender: TObject);
var
  CheckBox: TCheckBox;
begin
  CheckBox := TCheckBox(Sender);
  RelativePanel1.ControlCollection[CheckBox.Tag].AlignVerticalCenterWithPanel := CheckBox.Checked;
end;

procedure TRelativePanelForm.cbxAboveChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].Above := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxAlignBottomWithChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].AlignBottomWith := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxAlignHorizontalCenterWithChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].AlignHorizontalCenterWith := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxAlignLeftWithChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].AlignLeftWith := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxAlignRightWithChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].AlignRightWith := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxAlignTopWithChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].AlignTopWith := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxAlignVerticalCenterWithChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].AlignVerticalCenterWith := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxBelowChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].Below := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxRightOfChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].RightOf := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.cbxLeftOfChange(Sender: TObject);
var
  ComboBox: TComboBox;
begin
  ComboBox := TComboBox(Sender);
  RelativePanel1.ControlCollection[ComboBox.Tag].LeftOf := SelectedControl(ComboBox);
end;

procedure TRelativePanelForm.SampleControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    TControl(Sender).BeginDrag(True);
    FStartDragPosOffset.SetLocation(X, Y);

    PageControl1.ActivePageIndex := TControl(Sender).Tag;
  end;
end;

procedure TRelativePanelForm.RelativePanel1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  TControl(Source).Left := X - FStartDragPosOffset.X;
  TControl(Source).Top := Y - FStartDragPosOffset.Y;
end;

procedure TRelativePanelForm.RelativePanel1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  Accept := true;
end;

end.
