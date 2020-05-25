object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Cross DB query'
  ClientHeight = 286
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    451
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 63
    Width = 451
    Height = 223
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Open / Close'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 96
    Top = 8
    Width = 347
    Height = 49
    Color = clInfoBk
    Lines.Strings = (
      
        'To use demo, setup cnSQLite and cnMSAccess to the connections yo' +
        'u '
      'will use. Optionally change the qOrders, qDetails and FDQuery1 '
      'SQL commands.')
    ReadOnly = True
    TabOrder = 2
  end
  object cnSQLite: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Left = 32
    Top = 24
  end
  object qOrders: TFDQuery
    LocalSQL = FDLocalSQL1
    Connection = cnSQLite
    SQL.Strings = (
      'select * from "Orders"')
    Left = 32
    Top = 72
  end
  object cnMSAccess: TFDConnection
    Params.Strings = (
      'ConnectionDef=Access_Demo')
    Left = 120
    Top = 24
  end
  object qDetails: TFDQuery
    LocalSQL = FDLocalSQL1
    Connection = cnMSAccess
    SQL.Strings = (
      'select * from "Order Details"')
    Left = 120
    Top = 72
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 72
    Top = 136
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = FDConnection1
    Active = True
    DataSets = <>
    Left = 128
    Top = 136
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT QO.*, QD.*'
      'FROM qOrders QO LEFT JOIN qDetails QD ON QO.OrderID = QD.OrderID'
      'ORDER BY QO.OrderID'
      '')
    Left = 72
    Top = 184
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 224
    Top = 232
  end
  object FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink
    Left = 312
    Top = 232
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 352
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 128
    Top = 184
  end
end
