inherited frmMasterDetails: TfrmMasterDetails
  Left = 277
  Top = 195
  Width = 716
  Height = 501
  Caption = 'Master details and auto incremental fields'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 708
    inherited bvlTitle: TBevel
      Width = 650
    end
    inherited imgAnyDAC: TImage
      Left = 650
    end
    inherited lblTitle: TLabel
      Width = 324
      Caption = 'Master Details (auto inc fields)'
    end
  end
  inherited pnlMain: TPanel
    Width = 708
    Height = 377
    inherited pnlConnection: TPanel
      Width = 708
      Height = 81
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object btnInsertMast: TButton [1]
        Left = 6
        Top = 48
        Width = 92
        Height = 25
        Caption = 'Insert into master'
        Enabled = False
        TabOrder = 1
        OnClick = btnInsertMastClick
      end
      object btnInsertDet: TButton [2]
        Left = 103
        Top = 48
        Width = 90
        Height = 25
        Caption = 'Insert into details'
        Enabled = False
        TabOrder = 2
        OnClick = btnInsertDetClick
      end
      object btnPrint: TButton [3]
        Left = 199
        Top = 48
        Width = 64
        Height = 25
        Caption = 'Print'
        Enabled = False
        TabOrder = 3
        OnClick = btnPrintClick
      end
    end
    inherited Console: TMemo
      Top = 81
      Width = 698
      Height = 292
    end
  end
  inherited pnlButtons: TPanel
    Top = 430
    Width = 708
    inherited bvlButtons: TBevel
      Width = 708
    end
    inherited btnClose: TButton
      Left = 629
    end
  end
end
