object Form1: TForm1
  Left = 0
  Top = 0
  Width = 714
  Height = 678
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object DBGrid1: TDBGrid
    Left = 10
    Top = 61
    Width = 654
    Height = 303
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Memo1: TMemo
    Left = 10
    Top = 377
    Width = 654
    Height = 245
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 10
    Top = 10
    Width = 654
    Height = 44
    Color = clInfoBk
    Ctl3D = False
    Lines.Strings = (

        'To see "Compile-Time Authorization Callbacks" in action, just tr' +
        'y to delete a record in the grid below.')
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
