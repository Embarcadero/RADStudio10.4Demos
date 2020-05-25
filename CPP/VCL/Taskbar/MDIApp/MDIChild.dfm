object FrMDIChild: TFrMDIChild
  Left = 0
  Top = 0
  Caption = 'FrMDIChild'
  ClientHeight = 480
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 664
    Height = 480
    Align = alClient
    Stretch = True
    ExplicitLeft = -8
    ExplicitTop = -104
    ExplicitWidth = 635
    ExplicitHeight = 300
  end
  object Taskbar1: TTaskbar
    TaskBarButtons = <>
    TabProperties = [CustomizedPreview]
    ToolTip = 'MDI Form'
    Left = 40
    Top = 104
  end
end
