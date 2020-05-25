object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 263
  ClientWidth = 276
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
    Left = 175
    Top = 230
    Width = 90
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 79
    Top = 230
    Width = 90
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 257
    Height = 49
    Caption = 'First Image'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Image 1'
      'Image 2'
      'Image 3')
    TabOrder = 2
  end
  object RadioGroup3: TRadioGroup
    Left = 8
    Top = 173
    Width = 257
    Height = 49
    Caption = 'Resulting Image'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Image 1'
      'Image 2'
      'Image 3')
    TabOrder = 3
  end
  object RadioGroup2: TRadioGroup
    Left = 8
    Top = 118
    Width = 257
    Height = 49
    Caption = 'Second Image'
    Columns = 3
    ItemIndex = 1
    Items.Strings = (
      'Image 1'
      'Image 2'
      'Image 3')
    TabOrder = 4
  end
  object RadioGroup4: TRadioGroup
    Left = 8
    Top = 63
    Width = 257
    Height = 49
    Caption = 'Operator'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Sum'
      'Subtract'
      'Average')
    TabOrder = 5
  end
end
