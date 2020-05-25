object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 401
    Height = 130
    DataSource = dsOriginal
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 144
    Width = 401
    Height = 148
    DataSource = dsChanges
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 416
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Activate'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 416
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Deactivate'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 416
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 4
    OnClick = Button3Click
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 256
    Top = 240
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    ListServers = False
    Left = 136
    Top = 240
  end
  object conOriginal: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_Demo')
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    Left = 40
    Top = 24
  end
  object qOriginal: TFDQuery
    Connection = conOriginal
    SQL.Strings = (
      'select * from FDQA_TransTable')
    Left = 143
    Top = 24
  end
  object dsOriginal: TDataSource
    DataSet = qOriginal
    Left = 288
    Top = 32
  end
  object conChanges: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_Demo')
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    Connected = True
    Left = 40
    Top = 136
  end
  object qChanges: TFDQuery
    ChangeAlerter = eaChanges
    Connection = conChanges
    SQL.Strings = (
      'select id, name from dbo.FDQA_TransTable')
    Left = 144
    Top = 136
  end
  object eaChanges: TFDEventAlerter
    Connection = conChanges
    SubscriptionName = 'aaa'
    Left = 200
    Top = 136
  end
  object dsChanges: TDataSource
    DataSet = qChanges
    Left = 288
    Top = 136
  end
end
