object Form1: TForm1
  Left = 204
  Top = 110
  Width = 316
  Height = 138
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 136
    Top = 16
    Width = 113
    Height = 25
    Caption = 'Using handler'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 48
    Width = 113
    Height = 25
    Caption = 'Using loop'
    TabOrder = 1
    OnClick = Button2Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Oracle_Demo')
    Left = 8
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    OnError = FDQuery1Error
    SQL.Strings = (
      'insert into batch_demo values (:id, :name)')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end
      item
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Left = 16
    Top = 48
  end
end
