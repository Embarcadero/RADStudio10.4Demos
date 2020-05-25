inherited frmBatch: TfrmBatch
  Left = 372
  Top = 221
  Caption = 'Batch executing'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 169
      Caption = 'Batch Executing'
    end
  end
  inherited pnlMain: TPanel
    inherited pnlSubPageControl: TPanel
      inherited pcMain: TPageControl
        ActivePage = tsData
        Style = tsButtons
        inherited tsData: TTabSheet
          object DBGrid1: TDBGrid
            Left = 0
            Top = 70
            Width = 620
            Height = 341
            Align = alClient
            DataSource = DataSource1
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pnlControlButtons: TPanel
            Left = 0
            Top = 0
            Width = 620
            Height = 70
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object btnExecSQL: TButton
              Left = 2
              Top = 37
              Width = 76
              Height = 25
              Caption = 'ExecSQL'
              Enabled = False
              TabOrder = 3
              OnClick = btnExecSQLClick
            end
            object btnDisconnect: TButton
              Left = 84
              Top = 37
              Width = 76
              Height = 25
              Caption = 'Disconnect'
              Enabled = False
              TabOrder = 4
              OnClick = btnDisconnectClick
            end
            object cbxInsertBlob: TCheckBox
              Left = 165
              Top = 10
              Width = 81
              Height = 17
              Caption = 'insert blob'
              TabOrder = 0
              OnClick = cbxInsertBlobClick
            end
            object cbxBatchExec: TCheckBox
              Left = 242
              Top = 10
              Width = 97
              Height = 17
              Caption = 'batch executing'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object edtArraySize: TLabeledEdit
              Left = 57
              Top = 8
              Width = 99
              Height = 21
              EditLabel.Width = 52
              EditLabel.Height = 13
              EditLabel.Caption = 'Array size:'
              LabelPosition = lpLeft
              TabOrder = 2
              Text = '10000'
            end
          end
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 555
  end
  inherited StatusBar1: TStatusBar
    Top = 592
    SimplePanel = True
  end
  object qryBatch: TFDQuery
    Connection = dmlMainComp.dbMain
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      
        'insert into {id FDQA_Batch_test}(tint, tstring, tblob) values(:f' +
        '1, :f2, :f3)')
    Left = 300
    Top = 267
    ParamData = <
      item
        Name = 'F1'
        ParamType = ptInput
      end
      item
        Name = 'F2'
        ParamType = ptInput
      end
      item
        Name = 'F3'
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = qrySelect
    Left = 340
    Top = 267
  end
  object qrySelect: TFDQuery
    Connection = dmlMainComp.dbMain
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'select * from {id FDQA_Batch_test}')
    Left = 300
    Top = 307
  end
end
