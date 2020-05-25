inherited frmCreateTable: TfrmCreateTable
  Left = 361
  Top = 230
  Width = 550
  Height = 380
  Caption = 'Create a table'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 542
    inherited bvlTitle: TBevel
      Width = 484
    end
    inherited imgAnyDAC: TImage
      Left = 484
    end
    inherited lblTitle: TLabel
      Width = 147
      Caption = 'Create a table'
    end
  end
  inherited pnlMain: TPanel
    Width = 542
    Height = 256
    inherited pnlControlButtons: TPanel
      Width = 542
      Height = 36
      object btnCreateTable: TButton
        Left = 5
        Top = 5
        Width = 89
        Height = 25
        Caption = 'Create table'
        TabOrder = 0
        OnClick = btnCreateTableClick
      end
      object btnDefColumns: TButton
        Left = 100
        Top = 5
        Width = 89
        Height = 25
        Caption = 'Define Columns'
        Enabled = False
        TabOrder = 1
        OnClick = btnDefColumnsClick
      end
    end
    inherited Console: TMemo
      Top = 36
      Width = 542
      Height = 220
    end
  end
  inherited pnlButtons: TPanel
    Top = 309
    Width = 542
    inherited bvlButtons: TBevel
      Width = 542
    end
    inherited btnClose: TButton
      Left = 463
    end
  end
end
