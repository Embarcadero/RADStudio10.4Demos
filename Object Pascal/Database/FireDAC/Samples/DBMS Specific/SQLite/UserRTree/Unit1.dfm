object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 286
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    426
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOpen: TButton
    Left = 111
    Top = 8
    Width = 99
    Height = 25
    Caption = 'Open Data'
    TabOrder = 0
    OnClick = btnOpenClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 410
    Height = 239
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnInit: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Init Data'
    TabOrder = 2
    OnClick = btnInitClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Left = 32
    Top = 64
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 64
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 32
    Top = 96
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 64
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 96
    Top = 64
  end
  object FDSQLiteRTree1: TFDSQLiteRTree
    DriverLink = FDPhysSQLiteDriverLink1
    RTreeName = 'RTreeCallback'
    OnCalculate = FDSQLiteRTree1Calculate
    Left = 192
    Top = 88
  end
end
