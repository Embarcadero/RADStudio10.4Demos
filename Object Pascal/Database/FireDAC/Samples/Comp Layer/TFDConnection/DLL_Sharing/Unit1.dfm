object Form1: TForm1
  Left = 204
  Top = 113
  Width = 574
  Height = 306
  Caption = 'Form in EXE'
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
    Width = 457
    Height = 241
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 480
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Load DLL'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 480
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Unload DLL'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 480
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Show Data'
    TabOrder = 3
    OnClick = Button3Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Access_Demo')
    Connected = True
    Left = 8
    Top = 8
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT C.*'
      'FROM Categories C')
    Left = 40
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Left = 16
    Top = 48
  end
  object FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink
    Left = 48
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 72
    Top = 8
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 48
    Top = 88
  end
end
