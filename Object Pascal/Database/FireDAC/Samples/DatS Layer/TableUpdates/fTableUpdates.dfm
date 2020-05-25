inherited frmTableUpdates: TfrmTableUpdates
  Left = 417
  Top = 257
  Width = 549
  Height = 553
  Caption = 'Table Updates'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 541
    inherited bvlTitle: TBevel
      Width = 483
    end
    inherited imgAnyDAC: TImage
      Left = 483
    end
    inherited lblTitle: TLabel
      Width = 150
      Caption = 'Table Updates'
    end
  end
  inherited pnlMain: TPanel
    Width = 541
    Height = 429
    inherited pnlConnection: TPanel
      Width = 541
      Height = 139
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object btnChange: TButton [1]
        Left = 7
        Top = 46
        Width = 76
        Height = 25
        Caption = 'Change rows'
        Enabled = False
        TabOrder = 1
        OnClick = btnChangeClick
      end
      object btnAccept: TButton [2]
        Left = 7
        Top = 77
        Width = 76
        Height = 25
        Caption = 'Accept'
        Enabled = False
        TabOrder = 2
        OnClick = btnAcceptClick
      end
      object btnFirstChange: TButton [3]
        Left = 7
        Top = 108
        Width = 76
        Height = 25
        Caption = 'First change'
        Enabled = False
        TabOrder = 4
        OnClick = btnFirstChangeClick
      end
      object btnSavePoint: TButton [4]
        Left = 92
        Top = 46
        Width = 76
        Height = 25
        Caption = 'SavePoint'
        Enabled = False
        TabOrder = 5
        OnClick = btnSavePointClick
      end
      object btnLastChange: TButton [5]
        Left = 177
        Top = 108
        Width = 76
        Height = 25
        Caption = 'Last change'
        Enabled = False
        TabOrder = 7
        OnClick = btnLastChangeClick
      end
      object btnRestorePoint: TButton [6]
        Left = 177
        Top = 46
        Width = 76
        Height = 25
        Caption = 'RestorePoint'
        Enabled = False
        TabOrder = 8
        OnClick = btnRestorePointClick
      end
      object btnReject: TButton
        Left = 92
        Top = 77
        Width = 76
        Height = 25
        Caption = 'Reject'
        Enabled = False
        TabOrder = 3
        OnClick = btnRejectClick
      end
      object btnNextChange: TButton
        Left = 92
        Top = 108
        Width = 76
        Height = 25
        Caption = 'Next change'
        Enabled = False
        TabOrder = 6
        OnClick = btnNextChangeClick
      end
    end
    inherited Console: TMemo
      Top = 139
      Width = 530
      Height = 283
    end
  end
  inherited pnlButtons: TPanel
    Top = 482
    Width = 541
    inherited bvlButtons: TBevel
      Width = 541
    end
    inherited btnClose: TButton
      Left = 462
    end
  end
end
