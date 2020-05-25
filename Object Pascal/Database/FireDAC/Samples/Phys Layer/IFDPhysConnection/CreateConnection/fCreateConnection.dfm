inherited frmCreateConnection: TfrmCreateConnection
  Left = 341
  Top = 289
  Caption = 'Create Connection'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 192
      Caption = 'Create Connection'
    end
  end
  inherited pnlMain: TPanel
    object Console: TMemo
      Left = 0
      Top = 41
      Width = 628
      Height = 273
      Align = alClient
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 628
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object btnCreateConnection: TButton
        Left = 8
        Top = 8
        Width = 113
        Height = 25
        Caption = 'Create Connection'
        TabOrder = 0
        OnClick = btnCreateConnectionClick
      end
    end
  end
end
