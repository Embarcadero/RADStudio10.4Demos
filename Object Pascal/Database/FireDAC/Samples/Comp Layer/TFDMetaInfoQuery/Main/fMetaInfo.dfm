inherited frmMetaInfo: TfrmMetaInfo
  Top = 180
  Height = 605
  Caption = 'MetaInfo xRDBMS demo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 97
      Caption = 'MetaInfo'
    end
  end
  inherited pnlMain: TPanel
    Height = 458
    inherited pnlConnection: TPanel
      inherited cbDB: TComboBox
        TabOrder = 1
      end
      object mmInfo: TMemo
        Left = 405
        Top = 0
        Width = 223
        Height = 57
        TabStop = False
        Align = alRight
        Color = clInfoBk
        Lines.Strings = (
          'In case of MSAccess error will be raised on '
          'getting structure of some of system tables '
          '(MSysACEs, MSysObjects, etc).')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pcMain: TPageControl
      Left = 0
      Top = 57
      Width = 628
      Height = 401
      ActivePage = tsData
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = pcMainChange
      object tsData: TTabSheet
        Caption = 'Data'
        object PageControl1: TPageControl
          Left = 0
          Top = 0
          Width = 620
          Height = 370
          ActivePage = TabSheet1
          Align = alClient
          Style = tsFlatButtons
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'Tables'
            object Splitter1: TSplitter
              Left = 0
              Top = 120
              Width = 612
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object dbgTables: TDBGrid
              Left = 0
              Top = 0
              Width = 612
              Height = 120
              Align = alTop
              DataSource = dsTables
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
            object PageControl2: TPageControl
              Left = 0
              Top = 123
              Width = 612
              Height = 216
              ActivePage = TabSheet4
              Align = alClient
              Style = tsFlatButtons
              TabOrder = 1
              object TabSheet4: TTabSheet
                Caption = 'Fields'
                object dbgFields: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 604
                  Height = 185
                  Align = alClient
                  DataSource = dsFields
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'Indexes'
                ImageIndex = 1
                object Splitter2: TSplitter
                  Left = 0
                  Top = 81
                  Width = 604
                  Height = 3
                  Cursor = crVSplit
                  Align = alTop
                end
                object dbgIndexes: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 604
                  Height = 81
                  Align = alTop
                  DataSource = dsIndexes
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
                object dbgIndexFields: TDBGrid
                  Left = 0
                  Top = 84
                  Width = 604
                  Height = 105
                  Align = alClient
                  DataSource = dsIndexFields
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'PK'#39's'
                ImageIndex = 2
                object Splitter3: TSplitter
                  Left = 0
                  Top = 81
                  Width = 604
                  Height = 3
                  Cursor = crVSplit
                  Align = alTop
                end
                object dbgPrimaryKeys: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 604
                  Height = 81
                  Align = alTop
                  DataSource = dsPrimaryKeys
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
                object dbgPrimaryKeyFields: TDBGrid
                  Left = 0
                  Top = 84
                  Width = 604
                  Height = 105
                  Align = alClient
                  DataSource = dsPrimaryKeyFields
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
              end
              object TabSheet7: TTabSheet
                Caption = 'FK'#39's'
                ImageIndex = 3
                object Splitter7: TSplitter
                  Left = 0
                  Top = 81
                  Width = 604
                  Height = 3
                  Cursor = crVSplit
                  Align = alTop
                end
                object dbgForeignKeys: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 604
                  Height = 81
                  Align = alTop
                  DataSource = dsForeignKeys
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
                object dbgForeignKeyFields: TDBGrid
                  Left = 0
                  Top = 84
                  Width = 604
                  Height = 105
                  Align = alClient
                  DataSource = dsForeignKeyFields
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Packages'
            ImageIndex = 1
            object Splitter4: TSplitter
              Left = 0
              Top = 120
              Width = 612
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object Splitter5: TSplitter
              Left = 0
              Top = 243
              Width = 612
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object dbgPackages: TDBGrid
              Left = 0
              Top = 0
              Width = 612
              Height = 120
              Align = alTop
              DataSource = dsPackages
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
            object dbgPackProcs: TDBGrid
              Left = 0
              Top = 123
              Width = 612
              Height = 120
              Align = alTop
              DataSource = dsPackProcs
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
            object dbgPackProcArgs: TDBGrid
              Left = 0
              Top = 246
              Width = 612
              Height = 97
              Align = alClient
              DataSource = dsPackProcArgs
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Procedures'
            ImageIndex = 2
            object Splitter6: TSplitter
              Left = 0
              Top = 120
              Width = 612
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object dbgProcs: TDBGrid
              Left = 0
              Top = 0
              Width = 612
              Height = 120
              Align = alTop
              DataSource = dsProcs
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
            object DBGrid11: TDBGrid
              Left = 0
              Top = 123
              Width = 612
              Height = 220
              Align = alClient
              DataSource = dsProcArgs
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
      end
      object tsOptions: TTabSheet
        Caption = 'Options'
        ImageIndex = 1
        object Label3: TLabel
          Left = 11
          Top = 10
          Width = 41
          Height = 13
          Caption = 'Catalog:'
        end
        object Label4: TLabel
          Left = 11
          Top = 36
          Width = 41
          Height = 13
          Caption = 'Schema:'
        end
        object edtCatalog: TEdit
          Left = 56
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edtSchema: TEdit
          Left = 56
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 11
          Top = 55
          Width = 89
          Height = 73
          Caption = 'Object scopes'
          TabOrder = 2
          object cbMy: TCheckBox
            Left = 8
            Top = 16
            Width = 65
            Height = 17
            Caption = 'My'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbOther: TCheckBox
            Left = 8
            Top = 32
            Width = 65
            Height = 17
            Caption = 'Other'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cbSystem: TCheckBox
            Left = 8
            Top = 48
            Width = 65
            Height = 17
            Caption = 'System'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object GroupBox2: TGroupBox
          Left = 105
          Top = 55
          Width = 161
          Height = 73
          Caption = 'Table kinds'
          TabOrder = 3
          object cbSynonym: TCheckBox
            Left = 8
            Top = 16
            Width = 68
            Height = 17
            Caption = 'Synonym'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbTable: TCheckBox
            Left = 8
            Top = 32
            Width = 68
            Height = 17
            Caption = 'Table'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cbView: TCheckBox
            Left = 8
            Top = 48
            Width = 68
            Height = 17
            Caption = 'View'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object cbTempTable: TCheckBox
            Left = 80
            Top = 16
            Width = 78
            Height = 17
            Caption = 'TempTable'
            TabOrder = 3
          end
          object cbLocalTable: TCheckBox
            Left = 80
            Top = 32
            Width = 78
            Height = 17
            Caption = 'LocalTable'
            TabOrder = 4
          end
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 511
  end
  inherited StatusBar1: TStatusBar
    Top = 548
  end
  object miTables: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 272
    Top = 217
  end
  object miFields: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkTableFields
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 304
    Top = 217
  end
  object miIndexes: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkIndexes
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 336
    Top = 217
  end
  object miIndexFields: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkIndexFields
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 368
    Top = 217
  end
  object miPrimaryKeys: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkPrimaryKey
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 400
    Top = 217
  end
  object miPrimaryKeyFields: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkPrimaryKeyFields
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 432
    Top = 217
  end
  object dsTables: TDataSource
    DataSet = miTables
    OnDataChange = dsTablesDataChange
    Left = 272
    Top = 249
  end
  object dsFields: TDataSource
    DataSet = miFields
    Left = 304
    Top = 249
  end
  object dsIndexes: TDataSource
    DataSet = miIndexes
    OnDataChange = dsIndexesDataChange
    Left = 336
    Top = 249
  end
  object dsIndexFields: TDataSource
    DataSet = miIndexFields
    Left = 368
    Top = 249
  end
  object dsPrimaryKeys: TDataSource
    DataSet = miPrimaryKeys
    OnDataChange = dsPrimaryKeysDataChange
    Left = 400
    Top = 249
  end
  object dsPrimaryKeyFields: TDataSource
    DataSet = miPrimaryKeyFields
    Left = 432
    Top = 249
  end
  object miPackages: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkPackages
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 272
    Top = 369
  end
  object miPackProcs: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkProcs
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 304
    Top = 369
  end
  object miPackProcArgs: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkProcArgs
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 336
    Top = 369
  end
  object miProcs: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkProcs
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 272
    Top = 441
  end
  object miProcArgs: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkProcArgs
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 304
    Top = 441
  end
  object dsPackages: TDataSource
    DataSet = miPackages
    OnDataChange = dsPackagesDataChange
    Left = 272
    Top = 401
  end
  object dsPackProcs: TDataSource
    DataSet = miPackProcs
    OnDataChange = dsPackProcsDataChange
    Left = 304
    Top = 401
  end
  object dsPackProcArgs: TDataSource
    DataSet = miPackProcArgs
    Left = 336
    Top = 401
  end
  object dsProcs: TDataSource
    DataSet = miProcs
    OnDataChange = dsProcsDataChange
    Left = 272
    Top = 473
  end
  object dsProcArgs: TDataSource
    DataSet = miProcArgs
    Left = 304
    Top = 473
  end
  object miForeignKeys: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkForeignKeys
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 465
    Top = 217
  end
  object miForeignKeyFields: TFDMetaInfoQuery
    AfterOpen = miTablesAfterOpen
    Connection = dmlMainComp.dbMain
    MetaInfoKind = mkForeignKeyFields
    ObjectScopes = [osMy, osOther, osSystem]
    Left = 497
    Top = 217
  end
  object dsForeignKeys: TDataSource
    DataSet = miForeignKeys
    OnDataChange = dsForeignKeysDataChange
    Left = 465
    Top = 249
  end
  object dsForeignKeyFields: TDataSource
    DataSet = miForeignKeyFields
    Left = 497
    Top = 249
  end
end
