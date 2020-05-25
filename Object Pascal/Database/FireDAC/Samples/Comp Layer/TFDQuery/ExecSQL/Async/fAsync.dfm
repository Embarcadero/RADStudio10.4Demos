inherited frmAsync: TfrmAsync
  Left = 265
  Top = 139
  Width = 554
  Height = 649
  Caption = 'Async ExecSQL'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 546
    inherited bvlTitle: TBevel
      Width = 488
    end
    inherited imgAnyDAC: TImage
      Left = 488
    end
    inherited lblTitle: TLabel
      Width = 170
      Caption = 'Async Execution'
    end
  end
  inherited pnlMain: TPanel
    Width = 546
    Height = 506
    inherited pnlConnection: TPanel
      Width = 546
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    inherited pnlSubPageControl: TPanel
      Width = 546
      Height = 447
      inherited pcMain: TPageControl
        Width = 546
        Height = 446
        ActivePage = tsData
        inherited tsData: TTabSheet
          object mmExample: TMemo
            Left = 0
            Top = 31
            Width = 538
            Height = 33
            Align = alTop
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 64
            Width = 538
            Height = 351
            Align = alClient
            DataSource = DataSource1
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 538
            Height = 31
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 2
            object btnExec: TButton
              Left = 0
              Top = 1
              Width = 112
              Height = 25
              Caption = 'Exec sql command'
              TabOrder = 0
              OnClick = btnExecClick
            end
            object btnExecCancelDlg: TButton
              Left = 117
              Top = 1
              Width = 170
              Height = 25
              Caption = 'Execute/Open with CancelDialog'
              TabOrder = 1
              OnClick = btnExecCancelDlgClick
            end
            object btnAsyncExec: TButton
              Left = 292
              Top = 1
              Width = 138
              Height = 25
              Caption = 'Async executing/opening'
              TabOrder = 2
              OnClick = btnAsyncExecClick
            end
          end
        end
        inherited tsOptions: TTabSheet
          inherited FDGUIxFormsPanelTree1: TFDGUIxFormsPanelTree
            Width = 538
            Height = 374
            inherited frmUpdateOptions: TfrmFDGUIxFormsUpdateOptions
              Width = 534
              Height = 370
            end
            inherited frmResourceOptions: TfrmFDGUIxFormsResourceOptions
              Width = 534
              Height = 370
            end
            inherited frmFormatOptions: TfrmFDGUIxFormsFormatOptions
              Width = 534
              Height = 370
            end
            inherited frmFetchOptions: TfrmFDGUIxFormsFetchOptions
              Width = 534
              Height = 370
            end
          end
          inherited pnlDataSet: TPanel
            Width = 538
            inherited lblDataSet: TLabel
              Left = 7
              Width = 40
            end
          end
        end
      end
      inherited pnlMainSep: TPanel
        Width = 546
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 559
    Width = 546
    inherited bvlButtons: TBevel
      Width = 546
    end
    inherited btnClose: TButton
      Left = 467
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 596
    Width = 546
  end
  object qryExecSQL: TFDQuery
    Constraints = <
      item
        FromDictionary = False
      end>
    Connection = dmlMainComp.dbMain
    FetchOptions.Items = [fiBlobs, fiDetails]
    Left = 368
    Top = 361
  end
  object DataSource1: TDataSource
    DataSet = qryExecSQL
    Left = 412
    Top = 355
  end
end
