inherited frmFetchTable: TfrmFetchTable
  Left = 383
  Top = 267
  Width = 547
  Height = 471
  Caption = 'Fetch a table'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 539
    inherited bvlTitle: TBevel
      Width = 481
    end
    inherited imgAnyDAC: TImage
      Left = 481
    end
    inherited lblTitle: TLabel
      Width = 135
      Caption = 'Fetch a table'
    end
  end
  inherited pnlMain: TPanel
    Width = 539
    Height = 347
    inherited pnlConnection: TPanel
      Width = 539
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    inherited Console: TMemo
      Width = 529
      Height = 293
    end
  end
  inherited pnlButtons: TPanel
    Top = 400
    Width = 539
    inherited bvlButtons: TBevel
      Width = 539
    end
    inherited btnClose: TButton
      Left = 460
    end
  end
end
