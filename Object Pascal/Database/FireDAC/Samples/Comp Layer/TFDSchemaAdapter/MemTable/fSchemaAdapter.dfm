inherited frmSchemaAdapter: TfrmSchemaAdapter
  Left = 361
  Top = 207
  Caption = 'Schema Adapter'
  ClientHeight = 509
  ClientWidth = 571
  Font.Name = 'MS Sans Serif'
  ExplicitWidth = 587
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 571
    ExplicitWidth = 571
    inherited imgAnyDAC: TImage [0]
      Left = 513
      ExplicitLeft = 521
    end
    inherited bvlTitle: TBevel [1]
      Width = 513
      ExplicitWidth = 521
    end
    inherited lblTitle: TLabel
      Width = 171
      Caption = 'Schema Adapter'
      ExplicitWidth = 171
    end
  end
  inherited pnlMain: TPanel
    Width = 571
    Height = 400
    ExplicitWidth = 571
    ExplicitHeight = 400
    inherited pnlConnection: TPanel
      Width = 571
      Height = 48
      ExplicitWidth = 571
      ExplicitHeight = 48
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
    end
    object DBGrid1: TDBGrid
      Left = 6
      Top = 82
      Width = 559
      Height = 153
      Anchors = [akLeft, akTop, akRight]
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 6
      Top = 240
      Width = 559
      Height = 156
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource2
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel1: TPanel
      Left = 0
      Top = 48
      Width = 571
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      object btnSavePoint: TButton
        Left = 5
        Top = 1
        Width = 76
        Height = 25
        Caption = 'SavePoint'
        TabOrder = 4
        OnClick = btnSavePointClick
      end
      object btnRevertPoint: TButton
        Left = 83
        Top = 1
        Width = 76
        Height = 25
        Caption = 'RevertPoint'
        TabOrder = 3
        OnClick = btnRevertPointClick
      end
      object btnULastChange: TButton
        Left = 161
        Top = 1
        Width = 94
        Height = 25
        Caption = 'UndoLastChange'
        TabOrder = 0
        OnClick = btnULastChangeClick
      end
      object btnCancelUpdates: TButton
        Left = 257
        Top = 1
        Width = 94
        Height = 25
        Caption = 'CancelUpdates'
        TabOrder = 1
        OnClick = btnCancelUpdatesClick
      end
      object btnApplyUpdates: TButton
        Left = 353
        Top = 1
        Width = 94
        Height = 25
        Caption = 'ApplyUpdates'
        TabOrder = 2
        OnClick = btnApplyUpdatesClick
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 453
    Width = 571
    ExplicitTop = 453
    ExplicitWidth = 571
    inherited bvlButtons: TBevel
      Width = 571
      ExplicitWidth = 579
    end
    inherited lblInfo: TLabel
      Hint = 
        'http://docwiki.embarcadero.com/RADStudio/en/Caching_Updates_' +
        '(FireDAC)'
    end
    inherited btnClose: TButton
      Left = 582
      ExplicitLeft = 582
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 490
    Width = 571
    ExplicitTop = 490
    ExplicitWidth = 571
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 64
    Top = 120
  end
  object FDTableAdapter1: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter1
    SelectCommand = FDCommand1
    Left = 40
    Top = 224
  end
  object FDTableAdapter2: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter1
    SelectCommand = FDCommand2
    Left = 88
    Top = 224
  end
  object FDCommand1: TFDCommand
    Connection = dmlMainComp.dbMain
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    CommandKind = skSelect
    CommandText.Strings = (
      'select * from {id FDQA_master_autoinc}')
    Left = 40
    Top = 256
  end
  object FDCommand2: TFDCommand
    Connection = dmlMainComp.dbMain
    FetchOptions.AssignedValues = [evMode, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.DetailCascade = True
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    CommandKind = skSelect
    CommandText.Strings = (
      'select * from {id FDQA_details_autoinc}')
    Left = 88
    Top = 256
  end
  object FDMemTable1: TFDMemTable
    CachedUpdates = True
    ConstraintsEnabled = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Adapter = FDTableAdapter1
    Left = 40
    Top = 192
  end
  object FDMemTable2: TFDMemTable
    CachedUpdates = True
    IndexFieldNames = 'fk_id1'
    ConstraintsEnabled = True
    MasterSource = DataSource1
    MasterFields = 'id1'
    FetchOptions.AssignedValues = [evMode, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.DetailCascade = True
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Adapter = FDTableAdapter2
    Left = 88
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    OnDataChange = DataSource1DataChange
    Left = 40
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable2
    OnDataChange = DataSource1DataChange
    Left = 88
    Top = 160
  end
end
