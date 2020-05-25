object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'PostgreSQL LO'
  ClientHeight = 286
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 103
    Width = 329
    Height = 175
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 410
    Height = 89
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 343
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Add picture'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button4: TButton
    Left = 343
    Top = 103
    Width = 75
    Height = 25
    Caption = 'Open / Close'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 343
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Start TX'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 343
    Top = 215
    Width = 75
    Height = 25
    Caption = 'End TX'
    TabOrder = 4
    OnClick = Button3Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=PG_Demo')
    TxOptions.Isolation = xiSnapshot
    Left = 16
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select t.* from lo_table t')
    Left = 48
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 16
    Top = 48
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 48
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 80
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    Left = 240
    Top = 48
  end
end
