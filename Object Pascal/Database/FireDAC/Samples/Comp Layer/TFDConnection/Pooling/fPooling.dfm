inherited frmMain: TfrmMain
  Left = 378
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pooling demo'
  ClientHeight = 266
  ClientWidth = 462
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 462
    ExplicitWidth = 462
    inherited bvlTitle: TBevel
      Width = 404
      ExplicitWidth = 404
    end
    inherited imgAnyDAC: TImage
      Left = 404
      ExplicitLeft = 404
    end
    inherited lblTitle: TLabel
      Width = 78
      Caption = 'Pooling'
      ExplicitWidth = 78
    end
  end
  inherited pnlMain: TPanel
    Width = 462
    Height = 157
    ExplicitWidth = 462
    ExplicitHeight = 157
    object Label1: TLabel [0]
      Left = 6
      Top = 115
      Width = 81
      Height = 13
      Caption = 'Total executions:'
    end
    object lblTotalExec: TLabel [1]
      Left = 95
      Top = 115
      Width = 9
      Height = 13
      Caption = '---'
    end
    object Label2: TLabel [2]
      Left = 6
      Top = 135
      Width = 49
      Height = 13
      Caption = 'Total time:'
    end
    object lblTotalTime: TLabel [3]
      Left = 95
      Top = 135
      Width = 9
      Height = 13
      Caption = '---'
    end
    object btnRun: TButton [4]
      Left = 6
      Top = 78
      Width = 75
      Height = 25
      Caption = 'Run'
      Enabled = False
      TabOrder = 2
      OnClick = btnRunClick
    end
    inherited pnlConnection: TPanel
      Width = 462
      TabOrder = 1
      ExplicitWidth = 462
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
    end
    object chPooled: TCheckBox
      Left = 6
      Top = 49
      Width = 82
      Height = 17
      Caption = 'Run pooled'
      TabOrder = 0
    end
  end
  inherited pnlButtons: TPanel
    Top = 210
    Width = 462
    ExplicitTop = 210
    ExplicitWidth = 462
    inherited bvlButtons: TBevel
      Width = 462
      ExplicitWidth = 462
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 247
    Width = 462
    ExplicitTop = 247
    ExplicitWidth = 462
  end
end
