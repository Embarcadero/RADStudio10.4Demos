inherited frmMain: TfrmMain
  Left = 347
  Top = 254
  Width = 609
  Height = 472
  Caption = 'Autoinc fields'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 601
    inherited bvlTitle: TBevel
      Width = 543
    end
    inherited imgAnyDAC: TImage
      Left = 543
    end
    inherited lblTitle: TLabel
      Width = 141
      Caption = 'Autoinc fields'
    end
  end
  inherited pnlMain: TPanel
    Width = 601
    Height = 348
    inherited pnlConnection: TPanel
      Width = 601
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
    end
    inherited Console: TMemo
      Width = 591
      Height = 294
    end
  end
  inherited pnlButtons: TPanel
    Top = 401
    Width = 601
    inherited bvlButtons: TBevel
      Width = 601
    end
    inherited btnClose: TButton
      Left = 522
    end
  end
end
