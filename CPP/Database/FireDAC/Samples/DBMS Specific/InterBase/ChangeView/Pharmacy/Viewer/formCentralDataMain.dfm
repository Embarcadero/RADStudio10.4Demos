object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Simple Editor'
  ClientHeight = 443
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 318
    Top = 13
    Height = 317
    ExplicitLeft = 232
    ExplicitTop = 0
    ExplicitHeight = 336
  end
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 635
    Height = 13
    Align = alTop
    Caption = 'Simple Data Editor so you can see Change Views in Action'
    ExplicitWidth = 276
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 330
    Width = 635
    Height = 72
    Align = alBottom
    DataSource = dsLinks
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 13
    Width = 318
    Height = 317
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 316
      Height = 290
      Align = alClient
      DataSource = dsCategory
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 291
      Width = 316
      Height = 25
      DataSource = dsCategory
      Align = alBottom
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 321
    Top = 13
    Width = 314
    Height = 317
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 312
      Height = 290
      Align = alClient
      DataSource = dsMedicine
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBNavigator2: TDBNavigator
      Left = 1
      Top = 291
      Width = 312
      Height = 25
      DataSource = dsMedicine
      Align = alBottom
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 402
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      635
      41)
    object Panel4: TPanel
      Left = 225
      Top = 0
      Width = 185
      Height = 41
      Anchors = [akTop]
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        185
        41)
      object btnAdd: TButton
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Action = DatasetInsert1
        Anchors = [akTop]
        TabOrder = 0
      end
      object btnDelete: TButton
        Left = 102
        Top = 8
        Width = 75
        Height = 25
        Action = DatasetDelete1
        Anchors = [akTop]
        Caption = '&Delete Link'
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 64
    object Data1: TMenuItem
      Caption = 'Data'
      object Refresh1: TMenuItem
        Caption = 'Refresh'
        OnClick = Refresh1Click
      end
    end
  end
  object dsCategory: TDataSource
    Left = 128
    Top = 152
  end
  object dsMedicine: TDataSource
    Left = 488
    Top = 152
  end
  object dsLinks: TDataSource
    Left = 488
    Top = 360
  end
  object ActionList1: TActionList
    Left = 224
    Top = 256
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Add link'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = dsLinks
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dsLinks
    end
  end
end
