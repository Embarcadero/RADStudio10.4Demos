inherited frmMasterDetails: TfrmMasterDetails
  Left = 334
  Top = 214
  Width = 560
  Height = 471
  Caption = 'Master Details'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
      inherited pnlTitle: TPanel
        Width = 542
        inherited lblTitle: TLabel
          Width = 152
          Caption = 'Master Details'
        end
        inherited imgAnyDAC: TImage
          Left = 245
        end
      end
      inherited pnlMain: TPanel
        Width = 542
        Height = 343
        inherited pnlConnection: TPanel
          Width = 542
          inherited lblUseConnectionDef: TLabel
            Width = 126
          end
        end
        inherited Console: TMemo
          Width = 542
          Height = 286
        end
      end
  inherited pnlButtons: TPanel
    Top = 406
    Width = 552
    inherited btnClose: TButton
      Left = 473
    end
  end
end
