inherited frmGettingStarted: TfrmGettingStarted
  Left = 347
  Top = 254
  Width = 556
  Height = 474
  Caption = 'Getting Started'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 548
    inherited bvlTitle: TBevel
      Width = 490
    end
    inherited imgAnyDAC: TImage
      Left = 490
    end
    inherited lblTitle: TLabel
      Width = 162
      Caption = 'Getting Started'
    end
  end
  inherited pnlMain: TPanel
    Width = 548
    Height = 350
    inherited pnlConnection: TPanel
      Width = 548
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    inherited Console: TMemo
      Width = 538
      Height = 296
    end
  end
  inherited pnlButtons: TPanel
    Top = 403
    Width = 548
    inherited bvlButtons: TBevel
      Width = 548
    end
    inherited btnClose: TButton
      Left = 469
    end
  end
end
