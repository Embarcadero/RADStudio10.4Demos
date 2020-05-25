inherited frmSchemaAdapter: TfrmSchemaAdapter
  Left = 361
  Top = 207
  Caption = 'Cached Updates'
  ClientHeight = 466
  ClientWidth = 579
  Font.Name = 'MS Sans Serif'
  ExplicitWidth = 587
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 579
    ExplicitWidth = 579
    inherited imgAnyDAC: TImage [0]
      Left = 521
      ExplicitLeft = 521
    end
    inherited bvlTitle: TBevel [1]
      Width = 521
      ExplicitWidth = 521
    end
    inherited lblTitle: TLabel
      Width = 293
      Caption = 'Centralized Cached Updates'
      ExplicitWidth = 293
    end
  end
  inherited pnlMain: TPanel
    Width = 579
    Height = 357
    ExplicitWidth = 579
    ExplicitHeight = 357
    inherited pnlConnection: TPanel
      Width = 579
      Height = 48
      ExplicitWidth = 579
      ExplicitHeight = 48
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
      inherited cbDB: TComboBox
        Top = 21
        ExplicitTop = 21
      end
      object Button1: TButton
        Left = 162
        Top = 19
        Width = 97
        Height = 25
        Caption = 'Apply updates'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    inherited pnlSubPageControl: TPanel
      Top = 48
      Width = 579
      Height = 309
      ExplicitTop = 48
      ExplicitWidth = 579
      ExplicitHeight = 309
      inherited pcMain: TPageControl
        Width = 579
        Height = 308
        ActivePage = tsData
        ExplicitWidth = 579
        ExplicitHeight = 308
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 571
          ExplicitHeight = 277
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 571
            Height = 145
            Align = alTop
            DataSource = dsMaster
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object DBGrid2: TDBGrid
            Left = 0
            Top = 145
            Width = 571
            Height = 132
            Align = alClient
            DataSource = dsDetail
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
        end
        inherited tsOptions: TTabSheet
          ExplicitWidth = 571
          ExplicitHeight = 277
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            Width = 571
            Height = 236
            ExplicitWidth = 571
            ExplicitHeight = 236
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 567
              Height = 232
              ExplicitWidth = 567
              ExplicitHeight = 232
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 567
              Height = 232
              ExplicitWidth = 567
              ExplicitHeight = 232
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 567
              Height = 232
              ExplicitWidth = 567
              ExplicitHeight = 232
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 567
              Height = 232
              ExplicitWidth = 567
              ExplicitHeight = 232
            end
          end
          inherited pnlDataSet: TPanel
            Width = 571
            ExplicitWidth = 571
            inherited lblDataSet: TLabel
              Left = 13
              Width = 40
              ExplicitLeft = 13
              ExplicitWidth = 40
            end
          end
        end
      end
      inherited pnlMainSep: TPanel
        Width = 579
        ExplicitWidth = 579
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 410
    Width = 579
    ExplicitTop = 410
    ExplicitWidth = 579
    inherited bvlButtons: TBevel
      Width = 579
      ExplicitWidth = 579
    end
    inherited btnClose: TButton
      Left = 582
      ExplicitLeft = 582
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 447
    Width = 579
    ExplicitTop = 447
    ExplicitWidth = 579
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 224
    Top = 120
  end
  object dsMaster: TDataSource
    DataSet = qMaster
    Left = 192
    Top = 224
  end
  object dsDetail: TDataSource
    DataSet = qDetail
    Left = 264
    Top = 224
  end
  object qMaster: TFDQuery
    CachedUpdates = True
    ConstraintsEnabled = True
    Connection = dmlMainComp.dbMain
    SchemaAdapter = FDSchemaAdapter1
    SQL.Strings = (
      'select * from {id FDQA_master_autoinc}')
    Left = 192
    Top = 168
  end
  object qDetail: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'fk_id1'
    ConstraintsEnabled = True
    MasterSource = dsMaster
    MasterFields = 'id1'
    Connection = dmlMainComp.dbMain
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select * from {id FDQA_details_autoinc}')
    Left = 264
    Top = 168
  end
end
