inherited frmAddRelation: TfrmAddRelation
  Left = 345
  Top = 219
  Width = 614
  Height = 454
  Caption = 'Add relation'
  Font.Name = 'MS Sans Serif'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 606
    inherited bvlTitle: TBevel
      Width = 548
    end
    inherited imgAnyDAC: TImage
      Left = 548
    end
    inherited lblTitle: TLabel
      Width = 127
      Caption = 'Add relation'
    end
  end
  inherited pnlMain: TPanel
    Width = 606
    Height = 330
    inherited pnlControlButtons: TPanel
      Width = 606
      Height = 41
      object btnCreateDatSManager: TButton
        Left = 6
        Top = 8
        Width = 121
        Height = 25
        Caption = 'Create DatS Manager'
        TabOrder = 0
        OnClick = btnCreateDatSManagerClick
      end
      object btnCreateRel: TButton
        Left = 133
        Top = 8
        Width = 121
        Height = 25
        Caption = 'Create relation'
        Enabled = False
        TabOrder = 1
        OnClick = btnCreateRelClick
      end
    end
    inherited Console: TMemo
      Top = 41
      Width = 606
      Height = 289
    end
  end
  inherited pnlButtons: TPanel
    Top = 383
    Width = 606
    inherited bvlButtons: TBevel
      Width = 606
    end
    inherited btnClose: TButton
      Left = 527
    end
  end
end
