object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'PostgreSQL Arrays'
  ClientHeight = 243
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    472
    243)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 456
    Height = 196
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnOpen: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'PG Read'
    TabOrder = 0
    OnClick = btnOpenClick
  end
  object btnWrite: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'PG Write'
    TabOrder = 1
    OnClick = btnWriteClick
  end
  object ComboBox1: TComboBox
    Left = 173
    Top = 10
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 2
    Text = 'Array as ftArray'
    OnClick = ComboBox1Click
    Items.Strings = (
      'Array as ftArray'
      'Array as ftDataSet')
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=PG_Demo')
    Left = 40
    Top = 80
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 136
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 232
    Top = 80
  end
end
