object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 484
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 47
    Width = 500
    Height = 231
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Memo1: TMemo
    Left = 8
    Top = 288
    Width = 500
    Height = 188
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 8
    Top = 8
    Width = 500
    Height = 33
    Color = clInfoBk
    Ctl3D = False
    Lines.Strings = (

        'To see "Data Change Notification Callback" in action, just edit ' +
        'a data in the grid below.')
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 2
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Left = 32
    Top = 64
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT O.*'
      'FROM Orders O'
      '')
    Left = 64
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
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
end
