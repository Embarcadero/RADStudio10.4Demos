object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'In-memory DB'
  ClientHeight = 286
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    426
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 410
    Height = 273
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'MemTab1'
      object DBNavigator1: TDBNavigator
        Left = 3
        Top = 3
        Width = 240
        Height = 25
        DataSource = DataSource1
        Kind = dbnHorizontal
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 34
        Width = 396
        Height = 208
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'MemTab2'
      ImageIndex = 1
      object DBNavigator2: TDBNavigator
        Left = 3
        Top = 3
        Width = 240
        Height = 25
        DataSource = DataSource2
        Kind = dbnHorizontal
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 3
        Top = 34
        Width = 396
        Height = 208
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Query'
      ImageIndex = 2
      object DBNavigator3: TDBNavigator
        Left = 3
        Top = 3
        Width = 240
        Height = 25
        DataSource = DataSource3
        Kind = dbnHorizontal
        TabOrder = 0
      end
      object DBGrid3: TDBGrid
        Left = 3
        Top = 34
        Width = 396
        Height = 208
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource3
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object Brands: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    LocalSQL = FDLocalSQL1
    Left = 104
    Top = 104
  end
  object Models: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    LocalSQL = FDLocalSQL1
    Left = 184
    Top = 104
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 224
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from Brands B left join Models M on B.Code = M.Brand')
    Left = 280
    Top = 104
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = FDConnection1
    Active = True
    DataSets = <>
    Left = 144
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Left = 80
    Top = 224
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 176
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = Brands
    Left = 104
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = Models
    Left = 184
    Top = 152
  end
  object DataSource3: TDataSource
    DataSet = FDQuery1
    Left = 280
    Top = 152
  end
end
