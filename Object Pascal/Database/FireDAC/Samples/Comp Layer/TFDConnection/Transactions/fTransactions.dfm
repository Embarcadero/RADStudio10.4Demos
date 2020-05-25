inherited frmTransactions: TfrmTransactions
  Left = 394
  Top = 216
  Width = 533
  Height = 469
  Caption = 'Transactions'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 525
    inherited bvlTitle: TBevel
      Width = 467
    end
    inherited imgAnyDAC: TImage
      Left = 467
    end
    inherited lblTitle: TLabel
      Width = 135
      Caption = 'Transactions'
    end
  end
  inherited pnlMain: TPanel
    Width = 525
    Height = 326
    object lblPInfo: TLabel [0]
      Left = 7
      Top = 58
      Width = 64
      Height = 13
      Caption = 'Process Info:'
    end
    inherited pnlConnection: TPanel
      Width = 525
      TabOrder = 1
    end
    object mmInfo: TMemo
      Left = 6
      Top = 49
      Width = 513
      Height = 269
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
  inherited pnlButtons: TPanel
    Top = 379
    Width = 525
    inherited bvlButtons: TBevel
      Width = 525
    end
    inherited btnClose: TButton
      Left = 446
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 416
    Width = 525
  end
  object FDQuery1: TFDQuery
    Connection = dmlMainComp.dbMain
    FetchOptions.Items = [fiBlobs, fiDetails]
    Left = 188
    Top = 75
  end
end
