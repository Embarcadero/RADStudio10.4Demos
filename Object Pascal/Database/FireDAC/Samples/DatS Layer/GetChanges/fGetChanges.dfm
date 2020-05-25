inherited frmGetChanges: TfrmGetChanges
  Left = 359
  Top = 224
  Width = 526
  Height = 507
  Caption = 'GetChanges'
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 518
    inherited bvlTitle: TBevel
      Width = 460
    end
    inherited imgAnyDAC: TImage
      Left = 460
    end
    inherited lblTitle: TLabel
      Width = 129
      Caption = 'Get changes'
    end
  end
  inherited pnlMain: TPanel
    Width = 518
    Height = 383
    inherited pnlConnection: TPanel
      Width = 518
      Height = 97
      inherited lblUseConnectionDef: TLabel
        Width = 126
      end
      object Label3: TLabel [1]
        Left = 6
        Top = 76
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Filter:'
      end
      object Label1: TLabel [2]
        Left = 6
        Top = 50
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sort:'
      end
      object btnSelect: TButton [3]
        Left = 175
        Top = 47
        Width = 87
        Height = 25
        Caption = 'Select'
        Enabled = False
        TabOrder = 4
        OnClick = btnSelectClick
      end
      inherited cbDB: TComboBox
        TabOrder = 2
      end
      object cbFilter: TComboBox
        Left = 34
        Top = 72
        Width = 137
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'ShipperID < 5'
          'ShipperID > 3'
          'ShipperID = 7'
          'Length(CompanyName) > 8')
      end
      object cbSort: TComboBox
        Left = 34
        Top = 46
        Width = 137
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'ShipperId'
          'CompanyName'
          'Phone')
      end
      object mmInfo: TMemo
        Left = 269
        Top = 46
        Width = 243
        Height = 45
        Color = clInfoBk
        Lines.Strings = (
          'Select the values in Filter or/and Sort '
          'combo box and press Select')
        TabOrder = 3
      end
    end
    inherited Console: TMemo
      Top = 97
      Width = 508
      Height = 282
    end
  end
  inherited pnlButtons: TPanel
    Top = 436
    Width = 518
    inherited bvlButtons: TBevel
      Width = 518
    end
    inherited btnClose: TButton
      Left = 439
    end
  end
end
