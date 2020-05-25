inherited frmChildRelations: TfrmChildRelations
  Left = 354
  Top = 206
  Width = 590
  Height = 480
  Caption = 'Child relations'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 582
    inherited bvlTitle: TBevel
      Width = 524
    end
    inherited imgAnyDAC: TImage
      Left = 524
    end
    inherited lblTitle: TLabel
      Width = 150
      Caption = 'Child relations'
    end
  end
  inherited pnlMain: TPanel
    Width = 582
    Height = 356
    inherited pnlControlButtons: TPanel
      Width = 582
      Height = 39
      BorderWidth = 11
      object btnSelect: TButton
        Left = 171
        Top = 7
        Width = 76
        Height = 25
        Caption = 'Select'
        TabOrder = 0
        OnClick = btnSelectClick
      end
      object btnChildRels: TButton
        Left = 6
        Top = 7
        Width = 76
        Height = 25
        Caption = 'ChildRelations'
        TabOrder = 1
        OnClick = btnChildRelsClick
      end
      object btnCompute: TButton
        Left = 88
        Top = 7
        Width = 76
        Height = 25
        Caption = 'Compute'
        TabOrder = 2
        OnClick = btnComputeClick
      end
    end
    inherited Console: TMemo
      Top = 39
      Width = 582
      Height = 317
    end
  end
  inherited pnlButtons: TPanel
    Top = 409
    Width = 582
    inherited bvlButtons: TBevel
      Width = 582
    end
    inherited btnClose: TButton
      Left = 503
    end
  end
end
