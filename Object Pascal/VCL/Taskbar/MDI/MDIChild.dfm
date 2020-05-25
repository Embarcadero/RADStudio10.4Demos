object FrMDIChild: TFrMDIChild
  Left = 0
  Top = 0
  Caption = 'FrMDIChild'
  ClientHeight = 525
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 819
    Height = 525
    Align = alClient
    Stretch = True
    ExplicitLeft = 368
    ExplicitTop = 232
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object Taskbar1: TTaskbar
    TaskBarButtons = <>
    TabProperties = [CustomizedPreview]
    ToolTip = 'MDI Form'
    Left = 72
    Top = 416
  end
end
