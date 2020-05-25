inherited frmCachedUpdates: TfrmCachedUpdates
  Left = 317
  Top = 200
  Width = 564
  Height = 459
  Caption = 'Cached Updates'
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 556
    inherited bvlTitle: TBevel
      Width = 498
    end
    inherited imgAnyDAC: TImage
      Left = 498
    end
    inherited lblTitle: TLabel
      Width = 169
      Caption = 'Cached Updates'
      Color = clBlack
      Font.Color = clBlack
      ParentColor = False
      Transparent = True
    end
  end
  inherited pnlMain: TPanel
    Width = 556
    Height = 316
    object btnSavePoint: TButton [0]
      Left = 2
      Top = 28
      Width = 76
      Height = 25
      Caption = 'SavePoint'
      TabOrder = 3
      OnClick = btnSavePointClick
    end
    object btnRevertPoint: TButton [1]
      Left = 91
      Top = 28
      Width = 76
      Height = 25
      Caption = 'RevertPoint'
      TabOrder = 4
      OnClick = btnRevertPointClick
    end
    inherited pnlConnection: TPanel
      Width = 556
      Height = 47
      TabOrder = 2
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 79
      Width = 556
      Height = 237
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel1: TPanel
      Left = 0
      Top = 47
      Width = 556
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object btnRevertRecord: TButton
        Left = 5
        Top = 0
        Width = 76
        Height = 25
        Caption = 'RevertRecord'
        TabOrder = 0
        OnClick = btnRevertRecordClick
      end
      object btnULastChange: TButton
        Left = 93
        Top = 0
        Width = 94
        Height = 25
        Caption = 'UndoLastChange'
        TabOrder = 1
        OnClick = btnULastChangeClick
      end
      object btnCancelUpdates: TButton
        Left = 199
        Top = 0
        Width = 94
        Height = 25
        Caption = 'CancelUpdates'
        TabOrder = 2
        OnClick = btnCancelUpdatesClick
      end
      object btnApplyUpdates: TButton
        Left = 305
        Top = 0
        Width = 94
        Height = 25
        Caption = 'ApplyUpdates'
        TabOrder = 3
        OnClick = btnApplyUpdatesClick
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 369
    Width = 556
    inherited bvlButtons: TBevel
      Width = 556
    end
    inherited btnClose: TButton
      Left = 477
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 406
    Width = 556
  end
  object cdsOrders: TFDMemTable
    CachedUpdates = True
    IndexFieldNames = 'OrderID'
    Adapter = FDTableAdapter1
    Left = 424
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = cdsOrders
    OnDataChange = DataSource1DataChange
    Left = 456
    Top = 176
  end
  object FDTableAdapter1: TFDTableAdapter
    SelectCommand = FDCommand1
    Left = 393
    Top = 176
  end
  object FDCommand1: TFDCommand
    Connection = dmlMainComp.dbMain
    CommandText.Strings = (
      'select * from {id Orders}')
    Left = 425
    Top = 211
  end
end
