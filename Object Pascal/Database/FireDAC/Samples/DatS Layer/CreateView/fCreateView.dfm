inherited frmCreateView: TfrmCreateView
  Left = 355
  Top = 234
  Width = 576
  Height = 503
  Caption = 'Create DatS View'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 568
    inherited bvlTitle: TBevel
      Width = 510
    end
    inherited imgAnyDAC: TImage
      Left = 510
    end
    inherited lblTitle: TLabel
      Width = 183
      Caption = 'Create DatS View'
    end
  end
  inherited pnlMain: TPanel
    Width = 568
    Height = 379
    inherited pnlControlButtons: TPanel
      Width = 568
      Height = 38
      object btnCreateTable: TButton
        Left = 6
        Top = 6
        Width = 97
        Height = 25
        Caption = 'Create table'
        TabOrder = 0
        OnClick = btnCreateTableClick
      end
      object btnCreateView: TButton
        Left = 108
        Top = 6
        Width = 97
        Height = 25
        Caption = 'Create view'
        Enabled = False
        TabOrder = 1
        OnClick = btnCreateViewClick
      end
      object btnPrint: TButton
        Left = 210
        Top = 6
        Width = 89
        Height = 25
        Caption = 'Print'
        Enabled = False
        TabOrder = 2
        OnClick = btnPrintClick
      end
    end
    inherited Console: TMemo
      Top = 38
      Width = 568
      Height = 341
    end
  end
  inherited pnlButtons: TPanel
    Top = 432
    Width = 568
    inherited bvlButtons: TBevel
      Width = 568
    end
    inherited btnClose: TButton
      Left = 489
    end
  end
end
