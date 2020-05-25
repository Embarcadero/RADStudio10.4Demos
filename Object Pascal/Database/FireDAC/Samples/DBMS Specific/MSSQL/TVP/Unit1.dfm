object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 395
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 104
    Width = 98
    Height = 9
    Shape = bsBottomLine
  end
  object btnSPAutoSetup: TButton
    Left = 8
    Top = 8
    Width = 98
    Height = 25
    Caption = 'SP auto setup'
    TabOrder = 0
    OnClick = btnSPAutoSetupClick
  end
  object DBGrid1: TDBGrid
    Left = 112
    Top = 8
    Width = 497
    Height = 284
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnSPManualSetup: TButton
    Left = 8
    Top = 39
    Width = 98
    Height = 25
    Caption = 'SP manual setup'
    TabOrder = 2
    OnClick = btnSPManualSetupClick
  end
  object btnQryManualSetup: TButton
    Left = 8
    Top = 70
    Width = 98
    Height = 25
    Caption = 'Qry manual setup'
    TabOrder = 3
    OnClick = btnQryManualSetupClick
  end
  object Memo1: TMemo
    Left = 112
    Top = 296
    Width = 500
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object btnQryArrayDML: TButton
    Left = 8
    Top = 126
    Width = 98
    Height = 25
    Caption = 'Qry Array DML'
    TabOrder = 5
    OnClick = btnQryArrayDMLClick
  end
  object btnQryRegular: TButton
    Left = 8
    Top = 157
    Width = 98
    Height = 25
    Caption = 'Qry Regular'
    TabOrder = 6
    OnClick = btnQryRegularClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_Demo')
    Connected = True
    Left = 232
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select *'
      'from TVPTab'
      'order by Code')
    Left = 400
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 296
    Top = 224
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 408
    Top = 224
  end
  object FDStoredProc1: TFDStoredProc
    Connection = FDConnection1
    Left = 312
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 400
    Top = 88
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 312
    Top = 80
  end
end
