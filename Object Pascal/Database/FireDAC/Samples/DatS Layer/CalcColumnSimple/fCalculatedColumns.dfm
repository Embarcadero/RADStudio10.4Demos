inherited frmCalculatedColumns: TfrmCalculatedColumns
  Left = 333
  Top = 354
  Width = 595
  Height = 421
  Caption = 'Calculated columns'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 587
    inherited bvlTitle: TBevel
      Width = 529
    end
    inherited imgAnyDAC: TImage
      Left = 529
    end
    inherited lblTitle: TLabel
      Width = 203
      Caption = 'Calculated columns'
    end
  end
  inherited pnlMain: TPanel
    Width = 587
    Height = 297
    inherited pnlControlButtons: TPanel
      Width = 587
      Height = 65
      object btnCreateTable: TButton
        Left = 6
        Top = 8
        Width = 78
        Height = 25
        Caption = 'Create table'
        TabOrder = 2
        OnClick = btnCreateTableClick
      end
      object btnModify: TButton
        Left = 91
        Top = 8
        Width = 112
        Height = 25
        Caption = 'Modify expression'
        Enabled = False
        TabOrder = 3
        OnClick = btnModifyClick
      end
      object edtCurExpression: TLabeledEdit
        Left = 63
        Top = 38
        Width = 139
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Expression:'
        LabelPosition = lpLeft
        TabOrder = 0
        OnKeyPress = edtCurExpressionKeyPress
      end
      object mmInfo: TMemo
        Left = 210
        Top = 8
        Width = 371
        Height = 51
        Color = clInfoBk
        Lines.Strings = (
          'You may type expression by hands in the Expression edit, '
          'than press Enter')
        TabOrder = 1
      end
    end
    inherited Console: TMemo
      Top = 65
      Width = 587
      Height = 232
    end
  end
  inherited pnlButtons: TPanel
    Top = 350
    Width = 587
    inherited bvlButtons: TBevel
      Width = 587
    end
    inherited btnClose: TButton
      Left = 508
    end
  end
end
