inherited frmMainConnectionDefBase: TfrmMainConnectionDefBase
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object pnlConnection: TPanel
      Left = 0
      Top = 0
      Width = 628
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblUseConnectionDef: TLabel
        Left = 6
        Top = 4
        Width = 127
        Height = 13
        Caption = 'Use Connection Definition:'
      end
      object cbDB: TComboBox
        Left = 6
        Top = 19
        Width = 150
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnClick = cbDBClick
      end
    end
  end
end
