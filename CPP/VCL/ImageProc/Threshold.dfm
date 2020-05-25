object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Monochromatic '
  ClientHeight = 90
  ClientWidth = 200
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Treshold:'
  end
  object ScrollBar1: TScrollBar
    Left = 8
    Top = 32
    Width = 186
    Height = 17
    Max = 256
    PageSize = 0
    Position = 127
    TabOrder = 0
    OnChange = ScrollBar1Change
  end
  object Button1: TButton
    Left = 104
    Top = 55
    Width = 90
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 55
    Width = 90
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = Button2Click
  end
end
