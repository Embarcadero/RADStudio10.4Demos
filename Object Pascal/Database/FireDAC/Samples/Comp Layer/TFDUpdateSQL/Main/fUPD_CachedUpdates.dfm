inherited frmCachedUpdates: TfrmCachedUpdates
  Left = 333
  Top = 69
  Width = 578
  Height = 583
  Caption = 'Update SQL - Cached updates'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 570
    inherited bvlTitle: TBevel
      Width = 512
    end
    inherited imgAnyDAC: TImage
      Left = 512
    end
    inherited lblTitle: TLabel
      Width = 166
      Caption = 'Cached updates'
    end
  end
  inherited pnlMain: TPanel
    Width = 570
    Height = 440
    inherited pnlConnection: TPanel
      Width = 570
    end
    inherited pnlSubPageControl: TPanel
      Width = 570
      Height = 381
      inherited pcMain: TPageControl
        Width = 570
        Height = 380
        ActivePage = tsData
        inherited tsData: TTabSheet
          object DBGrid1: TDBGrid
            Left = 0
            Top = 60
            Width = 562
            Height = 289
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsProducts
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 360
            Height = 25
            DataSource = dsProducts
            Flat = True
            TabOrder = 2
          end
          object Panel1: TPanel
            Left = 0
            Top = 25
            Width = 562
            Height = 35
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object btnApply: TButton
              Left = 1
              Top = 5
              Width = 61
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = 'Apply'
              TabOrder = 0
              OnClick = btnApplyClick
            end
            object btnCancel: TButton
              Left = 67
              Top = 5
              Width = 57
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = 'Cancel'
              TabOrder = 1
              OnClick = btnCancelClick
            end
            object btnCommit: TButton
              Left = 129
              Top = 5
              Width = 65
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = 'Commit'
              TabOrder = 2
              OnClick = btnCommitClick
            end
            object btnRevert: TButton
              Left = 199
              Top = 5
              Width = 83
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = 'Revert record'
              TabOrder = 3
              OnClick = btnRevertClick
            end
            object btnUndoLast: TButton
              Left = 287
              Top = 5
              Width = 105
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = 'Undo last change'
              TabOrder = 4
              OnClick = btnUndoLastClick
            end
          end
        end
        inherited tsOptions: TTabSheet
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            Width = 562
            Height = 308
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 558
              Height = 304
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 558
              Height = 304
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 558
              Height = 304
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 558
              Height = 304
            end
          end
          inherited pnlDataSet: TPanel
            Width = 562
          end
        end
      end
      inherited pnlMainSep: TPanel
        Width = 570
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 493
    Width = 570
    inherited bvlButtons: TBevel
      Width = 570
    end
    inherited btnClose: TButton
      Left = 491
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 530
    Width = 570
  end
  object qrProducts: TFDQuery
    CachedUpdates = True
    OnUpdateRecord = qrProductsUpdateRecord
    Connection = dmlMainComp.dbMain
    FetchOptions.Mode = fmAll
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.KeyFields = 'ProductID'
    SQL.Strings = (
      'select p.*, c.CategoryName'
      'from {id Products} p, {id Categories} c'
      'where p.CategoryID = c.CategoryID')
    Left = 320
    Top = 336
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
      'select :NEW_ProductID = @@identity')
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
      '  ProductID = :OLD_ProductID')
    Left = 320
    Top = 368
  end
  object usCategories: TFDUpdateSQL
    ConnectionName = 'MainDB'
    ModifySQL.Strings = (
      'UPDATE {id Categories} SET'
      '  CategoryName = :NEW_CategoryName'
      'WHERE'
      '  CategoryID = :OLD_CategoryID')
    Left = 320
    Top = 400
  end
  object dsProducts: TDataSource
    DataSet = qrProducts
    Left = 352
    Top = 336
  end
end
