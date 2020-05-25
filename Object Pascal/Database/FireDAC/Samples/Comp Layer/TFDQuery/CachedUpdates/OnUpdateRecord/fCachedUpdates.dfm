inherited frmCachedUpdates: TfrmCachedUpdates
  Left = 243
  Top = 79
  Width = 536
  Height = 538
  Caption = 'Cached updates'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 528
    inherited bvlTitle: TBevel
      Width = 470
    end
    inherited imgAnyDAC: TImage
      Left = 470
    end
    inherited lblTitle: TLabel
      Width = 300
      Caption = 'Cached Updates and OnUpdateRecord'
    end
  end
  inherited pnlMain: TPanel
    Width = 528
    Height = 395
    inherited pnlConnection: TPanel
      Width = 528
    end
    inherited pnlSubPageControl: TPanel
      Width = 528
      Height = 336
      inherited pcMain: TPageControl
        Width = 528
        Height = 335
        ActivePage = tsData
        inherited tsData: TTabSheet
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 520
            Height = 304
            Align = alClient
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 0
              Top = 0
              Width = 520
              Height = 270
              Align = alClient
              DataSource = dsProducts
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
            object Panel1: TPanel
              Left = 0
              Top = 270
              Width = 520
              Height = 34
              Align = alBottom
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 1
              object btnApply: TButton
                Left = 0
                Top = 6
                Width = 84
                Height = 25
                Caption = 'Apply Updates'
                TabOrder = 0
                OnClick = btnApplyClick
              end
              object btnCancel: TButton
                Left = 92
                Top = 6
                Width = 100
                Height = 25
                Caption = 'Cancel Updates'
                TabOrder = 1
                OnClick = btnCancelClick
              end
              object btnCommit: TButton
                Left = 200
                Top = 6
                Width = 89
                Height = 25
                Caption = 'Commit Updates'
                TabOrder = 2
                OnClick = btnCommitClick
              end
              object btnRevert: TButton
                Left = 296
                Top = 6
                Width = 83
                Height = 25
                Caption = 'Revert Record'
                TabOrder = 3
                OnClick = btnRevertClick
              end
              object btnUndoLast: TButton
                Left = 386
                Top = 6
                Width = 97
                Height = 25
                Caption = 'Undo Last Change'
                TabOrder = 4
                OnClick = btnUndoLastClick
              end
            end
          end
        end
        inherited tsOptions: TTabSheet
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            Width = 520
            Height = 263
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 516
              Height = 259
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 516
              Height = 259
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 516
              Height = 259
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 516
              Height = 259
            end
          end
          inherited pnlDataSet: TPanel
            Width = 520
          end
        end
      end
      inherited pnlMainSep: TPanel
        Width = 528
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 448
    Width = 528
    inherited bvlButtons: TBevel
      Width = 528
    end
    inherited btnClose: TButton
      Left = 449
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 485
    Width = 528
  end
  object qryProducts: TFDQuery
    CachedUpdates = True
    OnUpdateRecord = qryProductsUpdateRecord
    Connection = dmlMainComp.dbMain
    FetchOptions.AssignedValues = [evMode, evItems, evCache]
    FetchOptions.Mode = fmAll
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'select p.*, c.CategoryName'
      
        'from {id Products} p left outer join {id Categories} c on p.Cate' +
        'goryID = c.CategoryID'
      'order by ProductID')
    Left = 432
    Top = 240
  end
  object usProducts: TFDUpdateSQL
    ConnectionName = 'MainDB'
    InsertSQL.Strings = (
      'INSERT INTO {id Products} ('
      '  ProductName, SupplierID, CategoryID, '
      '  QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, '
      '  ReorderLevel, Discontinued)'
      'VALUES ('
      '  :NEW_ProductName, :NEW_SupplierID, '
      '  :NEW_CategoryID, :NEW_QuantityPerUnit, :NEW_UnitPrice, '
      '  :NEW_UnitsInStock, :NEW_UnitsOnOrder, :NEW_ReorderLevel, '
      '  :NEW_Discontinued'
      ')'
      '{IF MSSQL} select :NEW_ProductID = @@identity {FI}'
      '{IF MSAcc} select @@identity as ProductID {FI}'
      '{IF MySQL} select LAST_INSERT_ID() as ProductID {FI}'
      '{IF IB} returning ProductID {into :NEW_ProductID} {FI}'
      '{IF PG} returning ProductID {into :NEW_ProductID} {FI}'
      '{IF SQLite}; select LAST_INSERT_ROWID() as ProductID {FI}'
      '{IF Ora} returning ProductID into :NEW_ProductID {FI}')
    ModifySQL.Strings = (
      'UPDATE {id Products} SET'
      '  ProductName = :NEW_ProductName, '
      '  SupplierID = :NEW_SupplierID, CategoryID = :NEW_CategoryID, '
      
        '  QuantityPerUnit = :NEW_QuantityPerUnit, UnitPrice = :NEW_UnitP' +
        'rice, '
      
        '  UnitsInStock = :NEW_UnitsInStock, UnitsOnOrder = :NEW_UnitsOnO' +
        'rder, '
      
        '  ReorderLevel = :NEW_ReorderLevel, Discontinued = :NEW_Disconti' +
        'nued'
      'WHERE'
      '  ProductID = :OLD_ProductID')
    DeleteSQL.Strings = (
      'DELETE FROM {id Products}'
      'WHERE'
      '  ProductID = :OLD_ProductID')
    FetchRowSQL.Strings = (
      'SELECT *'
      'FROM {id Products}'
      'WHERE'
      '  ProductID = :ProductID')
    Left = 432
    Top = 272
  end
  object usCategories: TFDUpdateSQL
    ConnectionName = 'MainDB'
    ModifySQL.Strings = (
      'UPDATE {id Categories} SET'
      '  CategoryName = :NEW_CategoryName'
      'WHERE'
      '  CategoryID = :OLD_CategoryID')
    Left = 432
    Top = 304
  end
  object dsProducts: TDataSource
    DataSet = qryProducts
    Left = 464
    Top = 240
  end
end
