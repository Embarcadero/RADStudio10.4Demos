inherited frmPooling: TfrmPooling
  Left = 326
  Top = 223
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pooling demo'
  ClientHeight = 425
  ClientWidth = 469
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 469
    inherited bvlTitle: TBevel
      Width = 411
    end
    inherited imgAnyDAC: TImage
      Left = 411
    end
    inherited lblTitle: TLabel
      Width = 78
      Caption = 'Pooling'
    end
  end
  inherited pnlMain: TPanel
    Width = 469
    Height = 335
    inherited pnlConnection: TPanel
      Width = 469
      Height = 129
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object Label1: TLabel [1]
        Left = 6
        Top = 84
        Width = 81
        Height = 13
        Caption = 'Total executions:'
      end
      object lblTotalExec: TLabel [2]
        Left = 94
        Top = 84
        Width = 9
        Height = 13
        Caption = '---'
      end
      object Label2: TLabel [3]
        Left = 6
        Top = 100
        Width = 49
        Height = 13
        Caption = 'Total time:'
      end
      object lblTotalTime: TLabel [4]
        Left = 94
        Top = 100
        Width = 9
        Height = 13
        Caption = '---'
      end
      object btnRun: TButton [5]
        Left = 6
        Top = 49
        Width = 76
        Height = 25
        Caption = 'Run'
        Enabled = False
        TabOrder = 2
        OnClick = btnRunClick
      end
      inherited cbDB: TComboBox
        TabOrder = 1
      end
      object cbPooled: TCheckBox
        Left = 89
        Top = 52
        Width = 82
        Height = 17
        Caption = 'Run pooled'
        Enabled = False
        TabOrder = 0
      end
    end
    inherited Console: TMemo
      Top = 121
      Width = 458
      Height = 206
    end
  end
  inherited pnlButtons: TPanel
    Top = 388
    Width = 469
    inherited bvlButtons: TBevel
      Width = 469
    end
    inherited btnClose: TButton
      Left = 390
    end
  end
end
