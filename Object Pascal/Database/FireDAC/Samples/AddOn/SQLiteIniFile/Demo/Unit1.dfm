object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TFDSQLiteIniFile Demo'
  ClientHeight = 566
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 566
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      575
      566)
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 575
      Height = 241
      Align = alTop
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 241
      Width = 575
      Height = 288
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 535
      Width = 270
      Height = 25
      DataSource = DataSource1
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 575
    Top = 0
    Width = 255
    Height = 566
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object Image1: TImage
      Left = 0
      Top = 241
      Width = 255
      Height = 325
      Align = alBottom
      Center = True
      Stretch = True
      ExplicitWidth = 247
    end
    object Button1: TButton
      Left = 48
      Top = 8
      Width = 161
      Height = 25
      Caption = 'Write to IniFile'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 48
      Top = 39
      Width = 161
      Height = 25
      Caption = 'Read from IniFile'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Memo2: TMemo
      Left = 0
      Top = 80
      Width = 255
      Height = 161
      Align = alBottom
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 96
    Top = 360
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=IniFile.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 64
    Top = 328
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '  B.SECTION_NAME as "Section::varchar(32)", '
      '  A.KEY_NAME as "Name::varchar(32)", '
      '  case when length(A.KEY_VALUE) <= 32 then A.KEY_VALUE'
      '  else '#39'(blob)'#39' end as "Value::varchar(32)" '
      'from KEYS A'
      'left join SECTIONS B on B.SECTION_ID = A.SECTION_ID'
      '')
    Left = 96
    Top = 328
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 32
    Top = 328
  end
end
