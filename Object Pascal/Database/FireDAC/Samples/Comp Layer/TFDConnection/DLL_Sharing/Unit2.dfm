object Form2: TForm2
  Left = 204
  Top = 110
  Width = 570
  Height = 312
  Caption = 'Form in DLL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 529
    Height = 249
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Access_Demo')
    Left = 8
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT O.*'
      'FROM Orders O')
    Left = 40
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Left = 8
    Top = 40
  end
  object FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink
    Left = 40
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 72
    Top = 8
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 40
    Top = 88
  end
end
