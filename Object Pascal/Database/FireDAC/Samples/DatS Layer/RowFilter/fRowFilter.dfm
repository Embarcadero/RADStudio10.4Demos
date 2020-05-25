inherited frmRowFilter: TfrmRowFilter
  Left = 404
  Top = 283
  Width = 505
  Height = 576
  Caption = 'Row filter'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 497
    inherited bvlTitle: TBevel
      Width = 439
    end
    inherited imgAnyDAC: TImage
      Left = 439
    end
    inherited lblTitle: TLabel
      Width = 107
      Caption = 'Row Filter'
    end
  end
  inherited pnlMain: TPanel
    Width = 497
    Height = 452
    inherited pnlConnection: TPanel
      Width = 497
      Height = 123
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object Label3: TLabel [1]
        Left = 6
        Top = 46
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'RowFilter example:'
      end
      object Label1: TLabel [2]
        Left = 162
        Top = 46
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = 'RowStateFilter:'
      end
      object btnChange: TButton [3]
        Left = 6
        Top = 92
        Width = 89
        Height = 25
        Caption = 'Change data'
        Enabled = False
        TabOrder = 3
        OnClick = btnChangeClick
      end
      object btnAccept: TButton [4]
        Left = 101
        Top = 92
        Width = 96
        Height = 25
        Caption = 'Accept Changes'
        Enabled = False
        TabOrder = 4
        OnClick = btnAcceptClick
      end
      object btnResetFilters: TButton [5]
        Left = 319
        Top = 61
        Width = 96
        Height = 25
        Caption = 'Reset filters'
        Enabled = False
        TabOrder = 5
        OnClick = btnResetFiltersClick
      end
      inherited cbDB: TComboBox
        TabOrder = 2
      end
      object cbRowStates: TComboBox
        Left = 162
        Top = 63
        Width = 150
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbRowStatesChange
        Items.Strings = (
          'rsDetached'
          'rsInserted'
          'rsDeleted'
          'rsModified'
          'rsUnchanged')
      end
      object cbRowFilter: TComboBox
        Left = 6
        Top = 63
        Width = 150
        Height = 21
        Enabled = False
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbRowFilterChange
        Items.Strings = (
          'ShipperID < 2'
          'left(CompanyName, 1) = '#39'S'#39)
      end
    end
    inherited Console: TMemo
      Top = 126
      Width = 486
      Height = 320
    end
  end
  inherited pnlButtons: TPanel
    Top = 505
    Width = 497
    inherited bvlButtons: TBevel
      Width = 497
    end
    inherited btnClose: TButton
      Left = 418
    end
  end
end
