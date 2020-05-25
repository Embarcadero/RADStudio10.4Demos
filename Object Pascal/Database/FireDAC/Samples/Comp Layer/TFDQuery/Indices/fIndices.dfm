inherited frmIndices: TfrmIndices
  Left = 410
  Top = 133
  Width = 530
  Height = 647
  Caption = 'Indices'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 522
    inherited bvlTitle: TBevel
      Width = 464
    end
    inherited imgAnyDAC: TImage
      Left = 464
    end
    inherited lblTitle: TLabel
      Width = 76
      Caption = 'Indices'
    end
  end
  inherited pnlMain: TPanel
    Width = 522
    Height = 504
    inherited pnlConnection: TPanel
      Width = 522
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    inherited pnlSubPageControl: TPanel
      Width = 522
      Height = 445
      inherited pcMain: TPageControl
        Width = 522
        Height = 444
        ActivePage = tsData
        inherited tsData: TTabSheet
          object DBGrid1: TDBGrid
            Left = 0
            Top = 49
            Width = 514
            Height = 364
            Align = alClient
            DataSource = DataSource1
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = DBGrid1TitleClick
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 514
            Height = 49
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object Label1: TLabel
              Left = 0
              Top = 6
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'OrderBy:'
            end
            object cbIndexes: TComboBox
              Left = 47
              Top = 3
              Width = 208
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              OnChange = cbIndexesChange
            end
            object Memo1: TMemo
              Left = 261
              Top = 2
              Width = 251
              Height = 42
              Color = clInfoBk
              Lines.Strings = (
                'Choose item from OrderBy combo box. Or click '
                'on grid column title. For details see qryMain.'
                'Indexes property.')
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
        inherited tsOptions: TTabSheet
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            Width = 514
            Height = 372
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 510
              Height = 368
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 510
              Height = 368
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 510
              Height = 368
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 510
              Height = 368
            end
          end
          inherited pnlDataSet: TPanel
            Width = 514
            inherited lblDataSet: TLabel
              Left = 13
              Width = 40
            end
          end
        end
      end
      inherited pnlMainSep: TPanel
        Width = 522
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 557
    Width = 522
    inherited bvlButtons: TBevel
      Width = 522
    end
    inherited btnClose: TButton
      Left = 443
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 594
    Width = 522
  end
  object qryMain: TFDQuery
    Constraints = <
      item
        FromDictionary = False
      end>
    Indexes = <
      item
        Active = True
        Name = 'CustomerID'
        Fields = 'CustomerID'
      end
      item
        Active = True
        Name = 'ShipName (case insensitive)'
        Fields = 'ShipName'
        CaseInsFields = 'ShipName'
      end
      item
        Active = True
        Name = 'CustomerID (descending)'
        Fields = 'CustomerID'
        DescFields = 'CustomerID'
      end
      item
        Active = True
        Name = 'CustomerID (where EmployeeID = 8)'
        Fields = 'CustomerID'
        Filter = 'EmployeeID = 8'
      end
      item
        Active = True
        Name = 'OrderDate year (expression)'
        Expression = 'year(OrderDate)'
      end>
    Connection = dmlMainComp.dbMain
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'select * from {id Orders}')
    Left = 284
    Top = 368
  end
  object DataSource1: TDataSource
    DataSet = qryMain
    Left = 316
    Top = 368
  end
end
