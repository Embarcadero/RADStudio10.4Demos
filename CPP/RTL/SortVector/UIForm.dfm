object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'C++Builder 64-bit VCL demo - Sort Vector uses auto'
  ClientHeight = 290
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 217
    Height = 25
    Caption = 'Generate Numbers'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 24
    Top = 47
    Width = 217
    Height = 218
    ItemHeight = 13
    TabOrder = 1
  end
  object Button2: TButton
    Left = 264
    Top = 16
    Width = 217
    Height = 25
    Caption = 'Sort'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ListBox2: TListBox
    Left = 264
    Top = 47
    Width = 217
    Height = 218
    ItemHeight = 13
    TabOrder = 3
  end
end
