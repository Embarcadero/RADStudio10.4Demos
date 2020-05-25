inherited frmMechanisms: TfrmMechanisms
  Left = 339
  Top = 283
  Caption = 'Mechanisms'
  ClientHeight = 390
  ClientWidth = 512
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  ExplicitWidth = 528
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 512
    ExplicitWidth = 512
    inherited bvlTitle: TBevel
      Width = 454
      ExplicitWidth = 462
    end
    inherited imgAnyDAC: TImage
      Left = 454
      ExplicitLeft = 462
    end
    inherited lblTitle: TLabel
      Width = 129
      Caption = 'Mechanisms'
      ExplicitWidth = 129
    end
  end
  inherited pnlMain: TPanel
    Width = 512
    Height = 300
    ExplicitWidth = 512
    ExplicitHeight = 300
    inherited pnlConnection: TPanel
      Width = 512
      Height = 76
      ExplicitWidth = 512
      ExplicitHeight = 76
      inherited lblUseConnectionDef: TLabel
        Width = 126
        ExplicitWidth = 126
      end
      object btnCreateTable: TButton [1]
        Left = 6
        Top = 47
        Width = 97
        Height = 25
        Caption = 'Create table'
        TabOrder = 1
        OnClick = btnCreateTableClick
      end
      object btnCreateView: TButton [2]
        Left = 108
        Top = 47
        Width = 97
        Height = 25
        Caption = 'Create views'
        Enabled = False
        TabOrder = 2
        OnClick = btnCreateViewClick
      end
      object btnPrint: TButton [3]
        Left = 211
        Top = 47
        Width = 89
        Height = 25
        Caption = 'Print'
        Enabled = False
        TabOrder = 3
        OnClick = btnPrintClick
      end
    end
    inherited Console: TMemo
      Top = 79
      Width = 510
      Height = 217
      ExplicitTop = 79
      ExplicitWidth = 510
      ExplicitHeight = 217
    end
  end
  inherited pnlButtons: TPanel
    Top = 353
    Width = 512
    ExplicitTop = 353
    ExplicitWidth = 512
    inherited bvlButtons: TBevel
      Width = 512
      ExplicitWidth = 520
    end
    inherited btnClose: TButton
      Left = 441
      ExplicitLeft = 441
    end
  end
end
