object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Brightness'
  ClientHeight = 147
  ClientWidth = 203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Brightness: TLabel
    Left = 8
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Brightness'
  end
  object Contrast: TLabel
    Left = 8
    Top = 56
    Width = 42
    Height = 13
    Caption = 'Contrast'
  end
  object ScrollBar1: TScrollBar
    Left = 8
    Top = 27
    Width = 185
    Height = 17
    Max = 255
    Min = -255
    PageSize = 0
    TabOrder = 0
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 8
    Top = 75
    Width = 185
    Height = 17
    Max = 800
    PageSize = 0
    Position = 400
    TabOrder = 1
    OnChange = ScrollBar2Change
  end
  object Button1: TButton
    Left = 104
    Top = 114
    Width = 90
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 114
    Width = 90
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button2Click
  end
end
