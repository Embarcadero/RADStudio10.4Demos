inherited frmAggregates: TfrmAggregates
  Left = 439
  Top = 144
  Width = 512
  Height = 639
  Caption = 'Aggregates'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 504
    inherited bvlTitle: TBevel
      Width = 446
    end
    inherited imgAnyDAC: TImage
      Left = 446
    end
    inherited lblTitle: TLabel
      Width = 119
      Caption = 'Aggregates'
    end
  end
  inherited pnlMain: TPanel
    Width = 504
    Height = 496
    inherited pnlConnection: TPanel
      Width = 504
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    inherited pnlSubPageControl: TPanel
      Width = 504
      Height = 437
      inherited pcMain: TPageControl
        Width = 504
        Height = 436
        ActivePage = tsData
        inherited tsData: TTabSheet
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 496
            Height = 146
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object edtUser: TLabeledEdit
              Left = 75
              Top = 91
              Width = 121
              Height = 21
              EditLabel.Width = 18
              EditLabel.Height = 13
              EditLabel.Caption = 'Try:'
              LabelPosition = lpLeft
              TabOrder = 0
              OnKeyPress = edtUserKeyPress
            end
            object edtMax: TLabeledEdit
              Left = 75
              Top = 64
              Width = 121
              Height = 21
              EditLabel.Width = 72
              EditLabel.Height = 13
              EditLabel.Caption = 'Max(OrderID)= '
              LabelPosition = lpLeft
              ReadOnly = True
              TabOrder = 1
            end
            object edtAvg: TLabeledEdit
              Left = 310
              Top = 64
              Width = 121
              Height = 21
              EditLabel.Width = 69
              EditLabel.Height = 13
              EditLabel.Caption = 'Avg(Freight) = '
              LabelPosition = lpLeft
              ReadOnly = True
              TabOrder = 2
            end
            object edtSum: TLabeledEdit
              Left = 310
              Top = 91
              Width = 121
              Height = 21
              EditLabel.Width = 71
              EditLabel.Height = 13
              EditLabel.Caption = 'Sum(Freight) = '
              LabelPosition = lpLeft
              ReadOnly = True
              TabOrder = 4
            end
            object edtUsrRes: TLabeledEdit
              Left = 75
              Top = 118
              Width = 121
              Height = 21
              EditLabel.Width = 42
              EditLabel.Height = 13
              EditLabel.Caption = 'Result = '
              LabelPosition = lpLeft
              TabOrder = 3
            end
            object Memo1: TMemo
              Left = 0
              Top = 0
              Width = 496
              Height = 57
              Align = alTop
              Color = clInfoBk
              Lines.Strings = (
                
                  'Type an aggregate expression in the "Try" edit box and press Ent' +
                  'er for evaluation.'
                
                  'Also, see qryAggregates.Aggregates collection, where already are' +
                  ' defined 3 items.')
              TabOrder = 5
            end
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 146
            Width = 496
            Height = 259
            Align = alClient
            DataSource = DataSource1
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
        end
        inherited tsOptions: TTabSheet
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            Width = 496
            Height = 364
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 492
              Height = 360
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 492
              Height = 360
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 492
              Height = 360
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 492
              Height = 360
            end
          end
          inherited pnlDataSet: TPanel
            Width = 496
            inherited lblDataSet: TLabel
              Left = 7
              Width = 40
            end
          end
        end
      end
      inherited pnlMainSep: TPanel
        Width = 504
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 549
    Width = 504
    inherited bvlButtons: TBevel
      Width = 504
    end
    inherited btnClose: TButton
      Left = 425
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 586
    Width = 504
  end
  object qryAggregates: TFDQuery
    Aggregates = <
      item
        Name = 'Avg of Freight'
        Expression = 'Avg(Freight)'
        Active = True
      end
      item
        Name = 'Sum of Freight'
        Expression = 'Sum(Freight)'
        Active = True
      end
      item
        Name = 'Max of OrderID'
        Expression = 'Max(OrderID)'
        Active = True
      end
      item
        Name = 'User'
      end>
    AggregatesActive = True
    Connection = dmlMainComp.dbMain
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'select * from {id Orders}')
    Left = 256
    Top = 344
  end
  object DataSource1: TDataSource
    DataSet = qryAggregates
    OnDataChange = DataSource1DataChange
    Left = 288
    Top = 344
  end
end
