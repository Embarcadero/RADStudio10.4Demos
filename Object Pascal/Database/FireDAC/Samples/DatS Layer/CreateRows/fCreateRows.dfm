inherited frmCreateRows: TfrmCreateRows
  Left = 342
  Top = 239
  Width = 457
  Height = 369
  Caption = 'Create rows'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 449
    inherited bvlTitle: TBevel
      Width = 391
    end
    inherited imgAnyDAC: TImage
      Left = 391
    end
    inherited lblTitle: TLabel
      Width = 133
      Caption = 'Create Rows'
    end
  end
  inherited pnlMain: TPanel
    Width = 449
    Height = 245
    inherited pnlControlButtons: TPanel
      Width = 449
      Height = 38
      object btnCreateTable: TButton
        Left = 5
        Top = 6
        Width = 77
        Height = 25
        Caption = 'Create table'
        TabOrder = 0
        OnClick = btnCreateTableClick
      end
      object btnPopulate: TButton
        Left = 87
        Top = 6
        Width = 77
        Height = 25
        Caption = 'Populate'
        Enabled = False
        TabOrder = 1
        OnClick = btnPopulateClick
      end
      object btnPrint: TButton
        Left = 170
        Top = 6
        Width = 76
        Height = 25
        Caption = 'Print rows'
        Enabled = False
        TabOrder = 2
        OnClick = btnPrintClick
      end
    end
    inherited Console: TMemo
      Top = 38
      Width = 449
      Height = 207
    end
  end
  inherited pnlButtons: TPanel
    Top = 298
    Width = 449
    inherited bvlButtons: TBevel
      Width = 449
    end
    inherited btnClose: TButton
      Left = 374
      Width = 70
    end
  end
end
