object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'PostgreSQL Ranges'
  ClientHeight = 383
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    635
    383)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 305
    Width = 56
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Low bound:'
  end
  object Label2: TLabel
    Left = 8
    Top = 332
    Width = 58
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'High bound:'
  end
  object Label3: TLabel
    Left = 247
    Top = 305
    Width = 29
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Flags:'
  end
  object Label4: TLabel
    Left = 247
    Top = 332
    Width = 86
    Height = 13
    Caption = 'Low bound props:'
  end
  object Label5: TLabel
    Left = 247
    Top = 359
    Width = 88
    Height = 13
    Caption = 'High bound props:'
  end
  object lblLBound: TLabel
    Left = 344
    Top = 332
    Width = 45
    Height = 13
    Caption = 'lblLBound'
  end
  object lblHBound: TLabel
    Left = 344
    Top = 359
    Width = 47
    Height = 13
    Caption = 'lblHBound'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 619
    Height = 284
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 68
    Top = 302
    Width = 142
    Height = 21
    Anchors = [akLeft, akBottom]
    DataField = 'rng.lbound'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 68
    Top = 329
    Width = 142
    Height = 21
    Anchors = [akLeft, akBottom]
    DataField = 'rng.hbound'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 344
    Top = 302
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    DataField = 'rng.flags'
    DataSource = DataSource1
    TabOrder = 3
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=PG_Demo')
    Connected = True
    Left = 40
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT int4range(null,2000, '#39'(]'#39') rng'
      'UNION ALL'
      'SELECT int4range(3000,4000, '#39'[)'#39') rng'
      'UNION ALL'
      'SELECT int4range(5000,6000, '#39'[]'#39') rng'
      'UNION ALL'
      'SELECT int4range(7000,null, '#39'()'#39') rng'
      'UNION ALL'
      'SELECT int4range(20,20, '#39'()'#39') rng')
    Left = 152
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 248
    Top = 24
  end
end
