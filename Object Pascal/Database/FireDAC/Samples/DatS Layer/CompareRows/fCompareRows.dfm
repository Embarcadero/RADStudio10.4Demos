inherited frmCompareRows: TfrmCompareRows
  Caption = 'Compare rows'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 152
      Caption = 'Compare rows'
    end
  end
  inherited pnlMain: TPanel
    inherited pnlControlButtons: TPanel
      Height = 33
      object SpeedButton1: TButton
        Left = 6
        Top = 4
        Width = 85
        Height = 25
        Caption = 'Compare rows'
        TabOrder = 0
        OnClick = SpeedButton1Click
      end
    end
    inherited Console: TMemo
      Top = 33
      Height = 281
    end
  end
end
